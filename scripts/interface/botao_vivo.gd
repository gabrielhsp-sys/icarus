extends Button
## Botão que responde ao mouse e ao foco: cresce um pouco e inclina (Ajustes.BOTOES_VIVOS).
## O som "clique" toca ao apertar (em silêncio sem arquivo).


func _ready() -> void:
	resized.connect(func() -> void: pivot_offset = size / 2.0)
	pivot_offset = size / 2.0
	mouse_entered.connect(_realcar.bind(true))
	mouse_exited.connect(_realcar.bind(false))
	focus_entered.connect(_realcar.bind(true))
	focus_exited.connect(_realcar.bind(false))
	pressed.connect(func() -> void: Sons.tocar("clique"))


func _realcar(sim: bool) -> void:
	if not Ajustes.BOTOES_VIVOS:
		return
	var animacao := create_tween().set_parallel()
	animacao.tween_property(self, "scale", Vector2(1.08, 1.08) if sim else Vector2.ONE, 0.18) \
		.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	animacao.tween_property(self, "rotation", deg_to_rad(-2.0) if sim else 0.0, 0.18)
