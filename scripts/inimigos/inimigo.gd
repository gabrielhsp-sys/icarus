class_name Inimigo
extends Area3D
## Inimigo genérico PROVISÓRIO: um tipo só, andando de um lado para o outro.
## Tipo, quantidade e movimento dos inimigos ainda vão ser decididos pela equipe de
## Modelos 3D (pendência do grupo). Para trocar o movimento, mude só _mover().

const COR_DO_ESTOURO := Color(0.95, 0.2, 0.35)

var velocidade := Ajustes.VELOCIDADE_DO_INIMIGO_NO_COMECO
var _sentido := 1.0
var _encostado := false
var _tempo := 0.0

@onready var _visual: Node3D = $Visual


func _ready() -> void:
	_sentido = 1.0 if randf() < 0.5 else -1.0
	_tempo = randf() * TAU
	EstiloToon.aplicar(_visual)


func _physics_process(delta: float) -> void:
	_mover(delta)
	_tempo += delta
	_visual.position.y = sin(_tempo * 4.0) * 0.12
	_visual.rotation.z = -_sentido * 0.15
	# Um contato por encontro: avisa quando começa a encostar, não a cada quadro. Assim o
	# inimigo que o escudo absorveu não causa dano enquanto continua encostado.
	var icaro: Icaro = null
	for corpo in get_overlapping_bodies():
		if corpo is Icaro:
			icaro = corpo
	if icaro != null and not _encostado:
		icaro.inimigo_encostou()
	_encostado = icaro != null


## Atingido por uma flecha: morre (G-008).
func atingido() -> void:
	Sons.tocar("acerto")
	if Ajustes.ESTOURO_DO_INIMIGO:
		Efeitos.estouro(global_position, COR_DO_ESTOURO, 30, 6.0)
		Efeitos.anel(global_position, Color(1.0, 1.0, 1.0, 0.9), 2.0)
	Efeitos.hit_stop()
	queue_free()


func _mover(delta: float) -> void:
	position.x += _sentido * velocidade * delta
	if absf(position.x) > Ajustes.LIMITE_LATERAL:
		position.x = signf(position.x) * Ajustes.LIMITE_LATERAL
		_sentido = -_sentido
