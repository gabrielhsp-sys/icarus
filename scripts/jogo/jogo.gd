extends Node3D
## Cena principal do jogo: junta Ícaro, câmera, plataformas, fundo e HUD, e decide o fim:
## cair é tela preta e reinício (G-020); chegar ao céu leva à cutscene final (G-006, G-019).

var _acabou := false

@onready var _icaro: Icaro = $Icaro
@onready var _camera: Camera3D = $Camera
@onready var _plataformas: Node3D = $Plataformas
@onready var _fundo: CanvasLayer = $Fundo


func _ready() -> void:
	Partida.nova_partida()


func _physics_process(_delta: float) -> void:
	var borda_de_baixo: float = _camera.borda_de_baixo()
	_plataformas.atualizar(_camera.position.y, borda_de_baixo)
	var altura := Partida.placar.altura_maxima()
	_fundo.mostrar(Cenarios.indice(altura, Ajustes.ALTURA_DO_CEU))
	if _acabou:
		return
	if altura >= Ajustes.ALTURA_DO_CEU:
		_acabou = true
		Partida.encerrar()
		Telas.trocar_para(Telas.CUTSCENE_FINAL)
	elif _icaro.position.y < borda_de_baixo - 1.0:
		_acabou = true
		Partida.encerrar()
		Telas.reiniciar_partida()
