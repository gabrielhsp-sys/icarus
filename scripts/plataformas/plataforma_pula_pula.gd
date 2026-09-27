class_name PlataformaPulaPula
extends Plataforma
## Plataforma pula-pula ("jump de impulso", G-007): o salto sai mais forte.


func multiplicador_do_salto() -> float:
	return Ajustes.MULTIPLICADOR_DO_PULA_PULA


func ao_ser_pisada() -> void:
	var visual: Node3D = $Visual
	var mola := create_tween()
	mola.tween_property(visual, "scale:y", 0.5, 0.06)
	mola.tween_property(visual, "scale:y", 1.0, 0.15)
