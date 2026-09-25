extends Node
## Cena principal mínima do Icarus. Não contém nenhuma mecânica de jogo.
## ESC fecha o jogo.


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and event.keycode == KEY_ESCAPE:
		get_tree().quit()
