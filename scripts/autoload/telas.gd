extends CanvasLayer
## Autoload "Telas": troca de tela com uma tela preta no meio (G-020) e ESC para fechar.

const TELA_INICIAL := "res://scenes/telas/tela_inicial.tscn"
const JOGO := "res://scenes/jogo/jogo.tscn"
const CUTSCENE_FINAL := "res://scenes/cutscene/cutscene_final.tscn"
const CREDITOS := "res://scenes/telas/creditos.tscn"

var _preto := ColorRect.new()
var _trocando := false


func _ready() -> void:
	layer = 100
	process_mode = Node.PROCESS_MODE_ALWAYS
	_preto.color = Color.BLACK
	_preto.modulate.a = 0.0
	_preto.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_preto.set_anchors_preset(Control.PRESET_FULL_RECT)
	add_child(_preto)


func trocar_para(caminho_da_cena: String) -> void:
	if _trocando:
		return
	_trocando = true
	var escurecer := create_tween()
	escurecer.tween_property(_preto, "modulate:a", 1.0, Ajustes.TEMPO_DA_TELA_PRETA)
	await escurecer.finished
	get_tree().change_scene_to_file(caminho_da_cena)
	await get_tree().process_frame
	var clarear := create_tween()
	clarear.tween_property(_preto, "modulate:a", 0.0, Ajustes.TEMPO_DA_TELA_PRETA)
	await clarear.finished
	_trocando = false


## Ícaro caiu durante a subida: tela preta e a partida recomeça (G-020).
func reiniciar_partida() -> void:
	trocar_para(JOGO)


func trocando() -> bool:
	return _trocando


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and event.keycode == KEY_ESCAPE:
		get_tree().quit()
