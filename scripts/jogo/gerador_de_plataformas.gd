extends Node3D
## Cria as plataformas acima da câmera enquanto Ícaro sobe, sem fases (G-005), com
## dificuldade crescente, até a altura do céu. Também põe inimigos e itens de poder, e
## apaga o que ficou para baixo da tela.

const CENAS := {
	"fixa": preload("res://scenes/plataformas/plataforma_fixa.tscn"),
	"movel": preload("res://scenes/plataformas/plataforma_movel.tscn"),
	"instavel": preload("res://scenes/plataformas/plataforma_instavel.tscn"),
	"pula_pula": preload("res://scenes/plataformas/plataforma_pula_pula.tscn"),
}
const CENA_DO_INIMIGO := preload("res://scenes/inimigos/inimigo.tscn")
const CENA_DO_ITEM := preload("res://scenes/itens/item_de_poder.tscn")
const ALCANCE_ACIMA := 14.0
const ALCANCE_ABAIXO := 12.0
const MARGEM_DA_BORDA := 1.5

var _sorteio := RandomNumberGenerator.new()
var _ultima_altura := 0.0
var _ultimo_x := 0.0


func _ready() -> void:
	_sorteio.randomize()
	_colocar(CENAS["fixa"].instantiate(), Vector3.ZERO)


## Chamado pela cena do jogo a cada quadro, com a altura da câmera e da borda de baixo.
func atualizar(altura_da_camera: float, borda_de_baixo: float) -> void:
	while _ultima_altura < altura_da_camera + ALCANCE_ACIMA and _ultima_altura < Ajustes.ALTURA_DO_CEU:
		_criar_proxima()
	for filho in get_children():
		if filho is Node3D and filho.position.y < borda_de_baixo - ALCANCE_ABAIXO:
			filho.queue_free()


func _criar_proxima() -> void:
	var fator := Dificuldade.fator(_ultima_altura, Ajustes.ALTURA_DO_CEU, Ajustes.EXPOENTE_DA_DIFICULDADE)
	var y := _ultima_altura + Dificuldade.valor(
		Ajustes.DISTANCIA_VERTICAL_NO_COMECO, Ajustes.DISTANCIA_VERTICAL_NO_FIM, fator)
	var limite := Ajustes.LIMITE_LATERAL - MARGEM_DA_BORDA
	var x := clampf(_ultimo_x + _sorteio.randf_range(-1.0, 1.0) * Ajustes.DISTANCIA_LATERAL_MAXIMA, -limite, limite)
	var pesos := Dificuldade.pesos(
		Ajustes.PESOS_DAS_PLATAFORMAS_NO_COMECO, Ajustes.PESOS_DAS_PLATAFORMAS_NO_FIM, fator)
	var tipo: String = Dificuldade.sortear(pesos, _sorteio.randf())
	var plataforma: Plataforma = CENAS[tipo].instantiate()
	if plataforma is PlataformaMovel:
		plataforma.velocidade = Dificuldade.valor(
			Ajustes.VELOCIDADE_DA_PLATAFORMA_MOVEL_NO_COMECO, Ajustes.VELOCIDADE_DA_PLATAFORMA_MOVEL_NO_FIM, fator)
		x = clampf(x, -limite + plataforma.amplitude, limite - plataforma.amplitude)
	_colocar(plataforma, Vector3(x, y, 0.0))
	_ultima_altura = y
	_ultimo_x = x

	var chance_de_inimigo := Dificuldade.valor(
		Ajustes.CHANCE_DE_INIMIGO_NO_COMECO, Ajustes.CHANCE_DE_INIMIGO_NO_FIM, fator)
	if _sorteio.randf() < chance_de_inimigo:
		var inimigo: Inimigo = CENA_DO_INIMIGO.instantiate()
		inimigo.velocidade = Dificuldade.valor(
			Ajustes.VELOCIDADE_DO_INIMIGO_NO_COMECO, Ajustes.VELOCIDADE_DO_INIMIGO_NO_FIM, fator)
		_colocar(inimigo, Vector3(_sorteio.randf_range(-limite, limite), y + 1.4, 0.0))
	elif _sorteio.randf() < Ajustes.CHANCE_DE_ITEM_DE_PODER:
		var item: ItemDePoder = CENA_DO_ITEM.instantiate()
		item.tipo = [Poderes.Tipo.VELOCIDADE, Poderes.Tipo.PULO_ALTO, Poderes.Tipo.ESCUDO][_sorteio.randi_range(0, 2)]
		_colocar(item, Vector3(x, y + 1.0, 0.0))


func _colocar(no: Node3D, posicao: Vector3) -> void:
	no.position = posicao
	add_child(no)
