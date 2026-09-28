extends Node3D
## Cutscene final PROVISÓRIA (G-006, G-019): Ícaro cai de costas com as asas queimando.
## A animação de verdade é da equipe de Modelos 3D (G-023). Apresentação provisória: câmera
## lenta (Ajustes.CAMERA_LENTA_NA_CUTSCENE), clarão do sol (CLARAO_DO_SOL, mais fraco com
## REDUZIR_FLASHES), câmera que acompanha a queda e uma frase final (scripts/textos.gd).
## Depois vêm os créditos.

@onready var _icaro: Node3D = $Icaro
@onready var _fogo: CPUParticles3D = $Icaro/Fogo
@onready var _sol: MeshInstance3D = $Sol
@onready var _camera: Camera3D = $Camera
@onready var _clarao: ColorRect = $Tela/Clarao
@onready var _frase: Label = $Tela/Frase


func _ready() -> void:
	EstiloToon.aplicar($Icaro/Visual)
	Engine.time_scale = Ajustes.CAMERA_LENTA_NA_CUTSCENE
	Sons.tocar("asas")
	_fogo.emitting = true
	_queimar_asas()
	_clarear_o_sol()
	var queda := create_tween().set_parallel()
	queda.tween_property(_icaro, "rotation:x", -PI / 2.0, 1.5)
	queda.tween_property(_icaro, "rotation:z", 0.6, Ajustes.DURACAO_DA_CUTSCENE_FINAL)
	queda.tween_property(_icaro, "position:y", -14.0, Ajustes.DURACAO_DA_CUTSCENE_FINAL) \
		.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)
	queda.tween_property(_sol, "scale", Vector3.ONE * 1.5, Ajustes.DURACAO_DA_CUTSCENE_FINAL)
	await get_tree().create_timer(Ajustes.DURACAO_DA_CUTSCENE_FINAL).timeout
	Engine.time_scale = 1.0
	await _mostrar_frase_final()
	Telas.trocar_para(Telas.CREDITOS)


func _process(delta: float) -> void:
	# a câmera acompanha a queda, um pouco acima e atrasada, olhando para baixo
	_camera.position.y = lerpf(_camera.position.y, _icaro.position.y + 2.5, 1.0 - exp(-2.5 * delta))


func _exit_tree() -> void:
	Engine.time_scale = 1.0


func _clarear_o_sol() -> void:
	if not Ajustes.CLARAO_DO_SOL:
		return
	var forca := Ajustes.FATOR_DOS_FLASHES_REDUZIDOS if Ajustes.REDUZIR_FLASHES else 0.9
	_clarao.modulate.a = forca
	create_tween().tween_property(_clarao, "modulate:a", 0.0, 0.8)


func _mostrar_frase_final() -> void:
	if not Ajustes.FRASES:
		return
	_frase.text = Textos.FRASE_FINAL
	var frase := create_tween()
	frase.tween_property(_frase, "modulate:a", 1.0, 0.6)
	frase.tween_interval(Ajustes.TEMPO_DA_FRASE_FINAL)
	await frase.finished


## As asas do modelo provisório (asa_*) ficam cor de fogo.
func _queimar_asas() -> void:
	var fogo := StandardMaterial3D.new()
	fogo.albedo_color = Color(1.0, 0.35, 0.05)
	fogo.emission_enabled = true
	fogo.emission = Color(1.0, 0.3, 0.0)
	fogo.emission_energy_multiplier = 1.5
	for asa in _icaro.find_children("asa_*", "MeshInstance3D", true, false):
		(asa as MeshInstance3D).material_override = fogo
