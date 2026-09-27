extends Node3D
## Cutscene final PROVISÓRIA (G-006, G-019): Ícaro cai de costas com as asas queimando.
## A animação de verdade é da equipe de Modelos 3D (G-023). Depois vêm os créditos.

@onready var _icaro: Node3D = $Icaro
@onready var _fogo: CPUParticles3D = $Icaro/Fogo


func _ready() -> void:
	Sons.tocar("asas")
	_fogo.emitting = true
	_queimar_asas()
	var queda := create_tween().set_parallel()
	queda.tween_property(_icaro, "rotation:x", -PI / 2.0, 1.5)
	queda.tween_property(_icaro, "position:y", -14.0, Ajustes.DURACAO_DA_CUTSCENE_FINAL) \
		.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)
	await get_tree().create_timer(Ajustes.DURACAO_DA_CUTSCENE_FINAL).timeout
	Telas.trocar_para(Telas.CREDITOS)


## As asas do modelo provisório (asa_esquerda, asa_direita) ficam cor de fogo.
func _queimar_asas() -> void:
	var fogo := StandardMaterial3D.new()
	fogo.albedo_color = Color(1.0, 0.35, 0.05)
	fogo.emission_enabled = true
	fogo.emission = Color(1.0, 0.3, 0.0)
	for asa in _icaro.find_children("asa_*", "MeshInstance3D", true, false):
		(asa as MeshInstance3D).material_override = fogo
