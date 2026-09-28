class_name PlataformaMovel
extends Plataforma
## Plataforma móvel: vai e volta para os lados.

var velocidade := Ajustes.VELOCIDADE_DA_PLATAFORMA_MOVEL_NO_COMECO
var amplitude := Ajustes.AMPLITUDE_DA_PLATAFORMA_MOVEL

var _centro_x := 0.0
var _tempo := 0.0


func _ready() -> void:
	super()
	_centro_x = position.x
	_tempo = randf() * TAU


func _physics_process(delta: float) -> void:
	_tempo += delta * velocidade / amplitude
	position.x = _centro_x + sin(_tempo) * amplitude
	super(delta)
