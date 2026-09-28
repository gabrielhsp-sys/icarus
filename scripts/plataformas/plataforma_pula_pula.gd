class_name PlataformaPulaPula
extends Plataforma
## Plataforma pula-pula ("jump de impulso", G-007): o salto sai mais forte.

const COR_DO_ANEL := Color(1.0, 0.4, 0.8, 0.9)


func multiplicador_do_salto() -> float:
	return Ajustes.MULTIPLICADOR_DO_PULA_PULA


func _quando_pisada() -> void:
	Sons.tocar("pula_pula")
	var visual: Node3D = $Visual
	var mola := create_tween()
	if not Ajustes.BOING_DO_PULA_PULA:
		mola.tween_property(visual, "scale:y", 0.5, 0.06)
		mola.tween_property(visual, "scale:y", 1.0, 0.15)
		return
	mola.tween_property(visual, "scale", Vector3(1.25, 0.35, 1.25), 0.05)
	mola.tween_property(visual, "scale", Vector3(0.85, 1.4, 0.85), 0.12).set_trans(Tween.TRANS_BACK)
	mola.tween_property(visual, "scale", Vector3.ONE, 0.35).set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_OUT)
	Efeitos.anel(global_position + Vector3(0.0, 0.05, 0.0), COR_DO_ANEL, 2.4)
	Efeitos.abrir_fov(Ajustes.FOV_EXTRA_NO_PULA_PULA)
