class_name PlataformaInstavel
extends Plataforma
## Plataforma instável: treme e quebra logo depois de ser pisada.
## A quebra em pedaços é provisória; a animação de verdade é da equipe de Modelos 3D (G-023).

const COR_DOS_PEDACOS := Color(0.95, 0.6, 0.2)

var _pisada := false
var _tremendo := false


func _quando_pisada() -> void:
	if _pisada:
		return
	_pisada = true
	_tremendo = Ajustes.INSTAVEL_TREME_E_QUEBRA
	await get_tree().create_timer(Ajustes.TEMPO_PARA_QUEBRAR).timeout
	_quebrar()


func _process(_delta: float) -> void:
	if _tremendo:
		$Visual.position.x = randf_range(-Ajustes.TREMIDA_DA_INSTAVEL, Ajustes.TREMIDA_DA_INSTAVEL)


func _quebrar() -> void:
	_tremendo = false
	Sons.tocar("plataforma_quebrando")
	$Colisao.set_deferred("disabled", true)
	if Ajustes.INSTAVEL_TREME_E_QUEBRA:
		Efeitos.estilhacos(global_position + Vector3(0.0, -0.2, 0.0), COR_DOS_PEDACOS)
		Efeitos.tremer(Ajustes.TRAUMA_NA_QUEBRA)
		$Visual.visible = false
		await get_tree().create_timer(0.1).timeout
		queue_free()
		return
	var queda := create_tween().set_parallel()
	queda.tween_property($Visual, "position:y", -3.0, 0.6).as_relative()
	queda.tween_property($Visual, "scale", Vector3(0.2, 0.2, 0.2), 0.6)
	await queda.finished
	queue_free()
