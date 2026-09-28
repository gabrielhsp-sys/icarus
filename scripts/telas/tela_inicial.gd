extends Control
## Tela inicial com o botão "Jogar".

@onready var _jogar: Button = $Centro/Linhas/Jogar


func _ready() -> void:
	_jogar.pressed.connect(func() -> void: Telas.trocar_para(Telas.JOGO))
	_jogar.grab_focus()
