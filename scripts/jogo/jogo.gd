extends Node3D
## Cena principal do jogo: junta Ícaro, câmera, plataformas, fundo e HUD, e decide o fim:
## cair é tela preta e reinício (G-020); chegar ao céu leva à cutscene final (G-006, G-019).
## Também cuida da apresentação provisória que depende da partida inteira: clima da subida,
## marcas de altura, faixa de cenário, aviso de recorde e frase perto do sol.

const CENA_DA_MARCA := preload("res://scenes/efeitos/marca_de_altura.tscn")
const COR_DA_MARCA_DO_RECORDE := Color(1.0, 0.85, 0.2, 0.8)
const COR_DA_MARCA_ANTERIOR := Color(0.75, 0.9, 1.0, 0.7)

## Com false, cair não reinicia a partida. Serve ao teste de fumaça, que confere as
## mecânicas sem depender de Ícaro acertar as plataformas sorteadas.
var reiniciar_ao_cair := true
var _acabou := false
var _cenario := -1
var _marcas: Marcas
var _nos_das_marcas := {}
var _recorde_de_score: Marcas
var _perto_do_sol_avisado := false

@onready var _icaro: Icaro = $Icaro
@onready var _camera: Camera3D = $Camera
@onready var _plataformas: Node3D = $Plataformas
@onready var _fundo: CanvasLayer = $Fundo
@onready var _ambiente: WorldEnvironment = $Ambiente
@onready var _hud: CanvasLayer = $Hud


func _ready() -> void:
	Partida.nova_partida()
	Sons.tocar_musica()
	var recorde := Partida.recorde
	_recorde_de_score = Marcas.new({"score": float(recorde.melhor_score)})
	var alturas := {}
	if Ajustes.RECORDE and Ajustes.MARCAS_DE_ALTURA:
		alturas["recorde"] = recorde.melhor_altura
		if absf(recorde.altura_anterior - recorde.melhor_altura) > 2.0:
			alturas["anterior"] = recorde.altura_anterior
	_marcas = Marcas.new(alturas)
	for nome in alturas:
		if alturas[nome] <= 0.0:
			continue
		var marca := CENA_DA_MARCA.instantiate()
		add_child(marca)
		marca.position = Vector3(0.0, alturas[nome], 0.0)
		if nome == "recorde":
			marca.configurar(Textos.MARCA_DO_RECORDE, COR_DA_MARCA_DO_RECORDE)
		else:
			marca.configurar(Textos.MARCA_DA_ANTERIOR, COR_DA_MARCA_ANTERIOR)
		_nos_das_marcas[nome] = marca


func _physics_process(_delta: float) -> void:
	var borda_de_baixo: float = _camera.borda_de_baixo()
	_plataformas.atualizar(_camera.position.y, borda_de_baixo)
	var altura := Partida.placar.altura_maxima()
	var cenario := Cenarios.indice(altura, Ajustes.ALTURA_DO_CEU)
	_fundo.mostrar(cenario)
	_ambiente.atualizar(altura)
	if cenario != _cenario:
		_cenario = cenario
		_hud.mostrar_cenario(Cenarios.NOMES[cenario], Textos.sortear([Textos.CENARIOS[cenario]]))
	if _acabou:
		return
	_apresentar_marcas(altura)
	if altura >= Ajustes.ALTURA_DO_CEU:
		_acabou = true
		Partida.encerrar()
		Telas.trocar_para(Telas.CUTSCENE_FINAL)
	elif reiniciar_ao_cair and _icaro.position.y < borda_de_baixo - Ajustes.MARGEM_DA_QUEDA:
		_acabou = true
		Partida.encerrar()
		var texto := Textos.tela_preta(altura, Partida.recorde.melhor_altura, Partida.ultima_foi_recorde)
		Telas.reiniciar_partida(texto)


func _apresentar_marcas(altura: float) -> void:
	for nome in _marcas.verificar(altura):
		if _nos_das_marcas.has(nome):
			_nos_das_marcas[nome].brilhar()
	if Ajustes.AVISO_DE_NOVO_RECORDE and not _recorde_de_score.verificar(Partida.placar.score()).is_empty():
		_hud.avisar(Textos.NOVO_RECORDE)
	if not _perto_do_sol_avisado and altura >= Ajustes.ALTURA_DO_CEU * Ajustes.FRACAO_PERTO_DO_SOL:
		_perto_do_sol_avisado = true
		_hud.avisar(Textos.sortear(Textos.PERTO_DO_SOL))
