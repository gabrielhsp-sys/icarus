class_name ItemDePoder
extends Area3D
## Item de poder (G-017). O item é 2D: um quadro plano que sempre fica de frente para a
## câmera. A cor e a letra são provisórias; a arte vem da equipe de Visual 2D.

const CORES := {
	Poderes.Tipo.VELOCIDADE: Color(0.1, 0.8, 1.0),
	Poderes.Tipo.PULO_ALTO: Color(0.3, 1.0, 0.3),
	Poderes.Tipo.ESCUDO: Color(1.0, 0.85, 0.1),
}
const LETRAS := {Poderes.Tipo.VELOCIDADE: "V", Poderes.Tipo.PULO_ALTO: "P", Poderes.Tipo.ESCUDO: "E"}

@export var tipo := Poderes.Tipo.VELOCIDADE

var _altura_inicial := 0.0
var _tempo := 0.0

@onready var _visual: Node3D = $Visual


func _ready() -> void:
	_altura_inicial = _visual.position.y
	body_entered.connect(_ao_encostar)
	var forma := _visual as MeshInstance3D
	if forma != null:
		var material := forma.get_active_material(0).duplicate() as StandardMaterial3D
		material.albedo_color = CORES.get(tipo, Color.WHITE)
		forma.material_override = material
	var letra := _visual.get_node_or_null("Letra") as Label3D
	if letra != null:
		letra.text = LETRAS.get(tipo, "?")


func _process(delta: float) -> void:
	_tempo += delta
	_visual.position.y = _altura_inicial + sin(_tempo * 3.0) * 0.15


func _ao_encostar(corpo: Node3D) -> void:
	if corpo is Icaro:
		corpo.pegar_poder(tipo)
		if Ajustes.POP_NA_COLETA:
			Efeitos.estouro(global_position, CORES.get(tipo, Color.WHITE), 18, 3.5)
			Efeitos.anel(global_position, Color(CORES.get(tipo, Color.WHITE), 0.9), 2.2)
		queue_free()
