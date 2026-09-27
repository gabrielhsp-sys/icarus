class_name PlataformaInstavel
extends Plataforma
## Plataforma instável: quebra logo depois de ser pisada.
## A queda abaixo é provisória; a animação de verdade é da equipe de Modelos 3D (G-023).

var _pisada := false


func ao_ser_pisada() -> void:
	if _pisada:
		return
	_pisada = true
	await get_tree().create_timer(Ajustes.TEMPO_PARA_QUEBRAR).timeout
	_quebrar()


func _quebrar() -> void:
	Sons.tocar("plataforma_quebrando")
	$Colisao.set_deferred("disabled", true)
	var queda := create_tween().set_parallel()
	queda.tween_property($Visual, "position:y", -3.0, 0.6).as_relative()
	queda.tween_property($Visual, "scale", Vector3(0.2, 0.2, 0.2), 0.6)
	await queda.finished
	queue_free()
