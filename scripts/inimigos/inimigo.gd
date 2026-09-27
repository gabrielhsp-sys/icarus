class_name Inimigo
extends Area3D
## Inimigo genérico PROVISÓRIO: um tipo só, andando de um lado para o outro.
## Tipo, quantidade e movimento dos inimigos ainda vão ser decididos pela equipe de
## Modelos 3D (pendência do grupo). Para trocar o movimento, mude só _mover().

var velocidade := Ajustes.VELOCIDADE_DO_INIMIGO_NO_COMECO
var _sentido := 1.0


func _ready() -> void:
	_sentido = 1.0 if randf() < 0.5 else -1.0


func _physics_process(delta: float) -> void:
	_mover(delta)
	for corpo in get_overlapping_bodies():
		if corpo is Icaro:
			corpo.inimigo_encostou()


## Atingido por uma flecha: morre (G-008).
func atingido() -> void:
	queue_free()


func _mover(delta: float) -> void:
	position.x += _sentido * velocidade * delta
	if absf(position.x) > Ajustes.LIMITE_LATERAL:
		position.x = signf(position.x) * Ajustes.LIMITE_LATERAL
		_sentido = -_sentido
