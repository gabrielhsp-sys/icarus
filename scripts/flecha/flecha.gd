class_name Flecha
extends Area3D
## Flecha disparada por Ícaro. Anda em linha reta; o inimigo atingido morre (G-008).

var _direcao := Vector3.UP
var _vida := 0.0


func lancar(saida: Vector3, direcao: Vector3) -> void:
	global_position = saida
	_direcao = direcao
	rotation.z = atan2(direcao.y, direcao.x)


func _ready() -> void:
	area_entered.connect(_ao_tocar)
	EstiloToon.aplicar($Visual)
	$Rastro.emitting = Ajustes.RASTRO_NA_FLECHA


func _physics_process(delta: float) -> void:
	position += _direcao * Ajustes.VELOCIDADE_DA_FLECHA * delta
	_vida += delta
	if _vida > Ajustes.DURACAO_DA_FLECHA:
		queue_free()


func _ao_tocar(area: Area3D) -> void:
	if area is Inimigo:
		area.atingido()
		queue_free()
