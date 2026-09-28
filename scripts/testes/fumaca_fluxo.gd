extends SceneTree
## Teste de fumaça do jogo inteiro, sem janela. Não é teste de regra (esses são os
## teste_*.gd): ele joga pelas cenas de verdade e confere se cada etapa acontece.
##   flatpak run org.godotengine.Godot --headless --path . --script res://scripts/testes/fumaca_fluxo.gd
## Sai com código 0 se tudo passar e 1 se alguma etapa falhar.
##
## Aqui não se usam os tipos Icaro, Inimigo etc.: citá-los compilaria esses scripts antes
## de os autoloads existirem.

var _falhas := 0
# Os autoloads são lidos pela árvore: este script é compilado antes de eles existirem.
var partida: Node
var telas: Node


const LIMITE_DE_TEMPO := 120.0
const ARQUIVO_DE_RECORDE := "user://recorde_fumaca.cfg"


func _initialize() -> void:
	create_timer(LIMITE_DE_TEMPO).timeout.connect(func() -> void:
		print("FALHOU  o teste passou de %d s (etapa travada ou erro de script)" % LIMITE_DE_TEMPO)
		quit(1))
	_rodar.call_deferred()


func _rodar() -> void:
	partida = root.get_node("Partida")
	telas = root.get_node("Telas")
	# Arquivo de recorde só do teste, para não mexer no recorde de quem joga.
	DirAccess.remove_absolute(ProjectSettings.globalize_path(ARQUIVO_DE_RECORDE))
	partida.usar_arquivo_de_recorde(ARQUIVO_DE_RECORDE)
	change_scene_to_file(telas.TELA_INICIAL)
	confere(await _esperar_cena("TelaInicial"), "o jogo abre na tela inicial")

	current_scene.get_node("Centro/Linhas/Jogar").pressed.emit()
	confere(await _esperar_cena("Jogo"), "\"Jogar\" abre a cena do jogo")
	var jogo := current_scene
	jogo.reiniciar_ao_cair = false
	var icaro: Node3D = jogo.get_node("Icaro")
	await create_timer(2.0).timeout
	confere(partida.placar.altura_maxima() > 1.0, "Ícaro salta sozinho (altura %.1f m)" % partida.placar.altura_maxima())
	confere(jogo.get_node("Plataformas").get_child_count() > 8, "plataformas criadas acima")

	var x_antes := icaro.position.x
	Input.action_press("mover_direita")
	await create_timer(0.5).timeout
	Input.action_release("mover_direita")
	confere(icaro.position.x > x_antes + 1.0, "D move Ícaro para a direita")
	icaro.position.x = 50.0
	await physics_frame
	await physics_frame
	confere(icaro.position.x <= Ajustes.LIMITE_LATERAL, "Ícaro não passa da borda lateral")
	icaro.position.x = 0.0

	var inimigo := _novo_inimigo(jogo, icaro.global_position + Vector3(4.0, 0.0, 0.0))
	var flecha: Node3D = load("res://scenes/flecha/flecha.tscn").instantiate()
	jogo.add_child(flecha)
	flecha.lancar(icaro.global_position, Vector3.RIGHT)
	await create_timer(0.5).timeout
	confere(not is_instance_valid(inimigo), "a flecha mata o inimigo atingido")

	partida.placar.registrar_altura(20.0)
	var score_antes: int = partida.placar.score()
	inimigo = _novo_inimigo(jogo, icaro.global_position + Vector3(0.0, 0.8, 0.0))
	await _esperar(func() -> bool: return icaro.contato.invulneravel())
	confere(partida.placar.score() == score_antes - Ajustes.PONTOS_PERDIDOS, "inimigo que encosta tira pontos")
	confere(icaro.contato.invulneravel(), "depois do dano Ícaro fica invulnerável")
	inimigo.queue_free()

	# Dano logo acima de uma plataforma: o empurrão tem de levar Ícaro para baixo dela (G-018).
	await create_timer(Ajustes.TEMPO_INVULNERAVEL + 0.2).timeout
	var chao: Node3D = load("res://scenes/plataformas/plataforma_fixa.tscn").instantiate()
	jogo.add_child(chao)
	var altura_do_dano: float = icaro.position.y
	chao.global_position = Vector3(icaro.position.x, altura_do_dano - 0.3, 0.0)
	icaro.inimigo_encostou()
	var mais_baixo := altura_do_dano
	var fim_da_queda := Time.get_ticks_msec() + 600
	while Time.get_ticks_msec() < fim_da_queda:
		await physics_frame
		mais_baixo = minf(mais_baixo, icaro.position.y)
	confere(mais_baixo < altura_do_dano - 1.0, "o empurrão leva Ícaro para baixo da plataforma (%.1f m)" % (altura_do_dano - mais_baixo))
	chao.queue_free()

	await create_timer(Ajustes.TEMPO_INVULNERAVEL + 0.2).timeout
	partida.poderes.ativar(Poderes.Tipo.ESCUDO)
	score_antes = partida.placar.score()
	inimigo = _novo_inimigo(jogo, icaro.global_position + Vector3(0.0, 0.8, 0.0))
	await _esperar(func() -> bool: return partida.poderes.ativo() != Poderes.Tipo.ESCUDO)
	confere(partida.poderes.ativo() == Poderes.Tipo.NENHUM, "o escudo some ao ser usado")
	confere(partida.placar.score() == score_antes, "o escudo absorve o inimigo, sem perder pontos")
	confere(not icaro.contato.invulneravel(), "o escudo não deixa Ícaro piscando")
	var seguir := func() -> bool:
		inimigo.global_position = icaro.global_position + Vector3(0.0, 0.8, 0.0)
		return false
	await _esperar(seguir, 0.5)
	confere(partida.placar.score() == score_antes, "o inimigo absorvido não causa dano enquanto continua encostado")
	inimigo.queue_free()

	var item: Node3D = load("res://scenes/itens/item_de_poder.tscn").instantiate()
	item.tipo = Poderes.Tipo.PULO_ALTO
	jogo.add_child(item)
	item.global_position = icaro.global_position + Vector3(0.0, 0.8, 0.0)
	await _esperar(func() -> bool: return partida.poderes.ativo() == Poderes.Tipo.PULO_ALTO)
	confere(partida.poderes.ativo() == Poderes.Tipo.PULO_ALTO, "pegar o item ativa o poder")
	await process_frame
	await process_frame
	confere(jogo.get_node("Hud/Margem/Linhas/Poder").text.begins_with("Pulo alto"), "o HUD mostra o poder ativo")

	var instavel: Node3D = load("res://scenes/plataformas/plataforma_instavel.tscn").instantiate()
	jogo.add_child(instavel)
	instavel.ao_ser_pisada()
	await create_timer(Ajustes.TEMPO_PARA_QUEBRAR + 1.0).timeout
	confere(not is_instance_valid(instavel), "a plataforma instável quebra depois de pisada")

	partida.placar.registrar_altura(Ajustes.ALTURA_DO_CEU * 0.3)
	await create_timer(Ajustes.TEMPO_DO_FADE_DO_FUNDO + 0.2).timeout
	confere(jogo.get_node("Fundo/Cenario2").modulate.a > 0.99, "o fundo troca para o 2º cenário com fade")

	# Com o reinício desligado, Ícaro pode estar caindo há tempo e muito rápido: zera a
	# velocidade para o primeiro quadro depois do teleporte não descer abaixo do céu.
	icaro.velocity = Vector3.ZERO
	icaro.position.y = Ajustes.ALTURA_DO_CEU + 5.0
	var chegou := await _esperar_cena("CutsceneFinal")
	confere(chegou, "chegar ao céu leva à cutscene final")
	if not chegou:
		print("        estado: altura registrada %.1f m, Ícaro em y = %.1f, partida em andamento: %s, cena: %s"
			% [partida.placar.altura_maxima(), icaro.position.y if is_instance_valid(icaro) else -1.0,
			partida.em_andamento, current_scene.name])
	var duracao_da_cutscene := Ajustes.DURACAO_DA_CUTSCENE_FINAL / Ajustes.CAMERA_LENTA_NA_CUTSCENE \
		+ Ajustes.TEMPO_DA_FRASE_FINAL + 4.0
	confere(await _esperar_cena("Creditos", duracao_da_cutscene), "depois da cutscene vêm os créditos")
	confere(Engine.time_scale == 1.0, "a câmera lenta da cutscene termina")
	var score_final: int = partida.placar.score()
	confere(current_scene.get_node("Topo/Score").text.ends_with(str(score_final)), "os créditos mostram o score (%d)" % score_final)
	confere(ArquivoDeRecorde.ler(ARQUIVO_DE_RECORDE).melhor_score == score_final, "o recorde foi salvo no arquivo")
	current_scene.get_node("Voltar").pressed.emit()
	confere(await _esperar_cena("TelaInicial"), "\"Voltar ao início\" leva à tela inicial")

	current_scene.get_node("Centro/Linhas/Jogar").pressed.emit()
	confere(await _esperar_cena("Jogo"), "jogar de novo")
	var primeira_partida := current_scene
	var primeiro_placar: RefCounted = partida.placar
	await create_timer(0.5).timeout
	current_scene.reiniciar_ao_cair = true
	current_scene.get_node("Icaro").position.y = -40.0
	await create_timer(Ajustes.TEMPO_DA_TELA_PRETA_AO_CAIR * 2.0 + Ajustes.TEMPO_DO_TEXTO_NA_TELA_PRETA + 1.0).timeout
	confere(current_scene != primeira_partida and current_scene.name == "Jogo", "cair leva à tela preta e a partida recomeça")
	confere(partida.placar != primeiro_placar, "a partida nova começa com um placar novo")

	confere(current_scene.get_node_or_null("MarcaDeAltura") != null, "a partida nova mostra a marca do recorde")
	DirAccess.remove_absolute(ProjectSettings.globalize_path(ARQUIVO_DE_RECORDE))
	print("\n%s" % ("fumaça ok" if _falhas == 0 else "%d etapa(s) falharam" % _falhas))
	quit(0 if _falhas == 0 else 1)


func confere(condicao: bool, descricao: String) -> void:
	print(("ok      " if condicao else "FALHOU  ") + descricao)
	if not condicao:
		_falhas += 1


func _novo_inimigo(jogo: Node, posicao: Vector3) -> Node3D:
	var inimigo: Node3D = load("res://scenes/inimigos/inimigo.tscn").instantiate()
	inimigo.velocidade = 0.0
	jogo.add_child(inimigo)
	inimigo.global_position = posicao
	return inimigo


## Espera a condição ficar verdadeira, por no máximo `limite` segundos.
func _esperar(condicao: Callable, limite := 1.0) -> void:
	var fim := Time.get_ticks_msec() + int(limite * 1000.0)
	while Time.get_ticks_msec() < fim and not condicao.call():
		await physics_frame


func _esperar_cena(nome: String, limite := 3.0) -> bool:
	var fim := Time.get_ticks_msec() + int(limite * 1000.0)
	while Time.get_ticks_msec() < fim:
		await process_frame
		if current_scene != null and current_scene.name == nome and not telas.trocando():
			return true
	return false
