extends CanvasLayer
## Autoload "Telas": troca de tela com uma tela preta no meio (G-020) e ESC para fechar.

const TELA_INICIAL := "res://scenes/telas/tela_inicial.tscn"
const JOGO := "res://scenes/jogo/jogo.tscn"
const CUTSCENE_FINAL := "res://scenes/cutscene/cutscene_final.tscn"
const CREDITOS := "res://scenes/telas/creditos.tscn"

var _preto := ColorRect.new()
var _texto := Label.new()
var _trocando := false


func _ready() -> void:
	layer = 100
	process_mode = Node.PROCESS_MODE_ALWAYS
	_preto.color = Color.BLACK
	_preto.modulate.a = 0.0
	_preto.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_preto.set_anchors_preset(Control.PRESET_FULL_RECT)
	add_child(_preto)
	_texto.set_anchors_preset(Control.PRESET_FULL_RECT)
	_texto.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_texto.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_texto.add_theme_font_size_override("font_size", 72)
	_texto.modulate.a = 0.0
	_texto.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(_texto)


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


## Ícaro caiu durante a subida: tela preta e a partida recomeça (G-020), rápido e sem menu.
## `texto` aparece sobre a tela preta (PROVISÓRIO: Ajustes.TEXTO_NA_TELA_PRETA).
func reiniciar_partida(texto := "") -> void:
	if _trocando:
		return
	_trocando = true
	var escurecer := create_tween()
	escurecer.tween_property(_preto, "modulate:a", 1.0, Ajustes.TEMPO_DA_TELA_PRETA_AO_CAIR)
	await escurecer.finished
	if texto != "" and Ajustes.TEXTO_NA_TELA_PRETA:
		_texto.text = texto
		var mostrar := create_tween()
		mostrar.tween_property(_texto, "modulate:a", 1.0, Ajustes.TEMPO_DO_FADE_DO_TEXTO)
		mostrar.tween_interval(Ajustes.TEMPO_DO_TEXTO_NA_TELA_PRETA)
		mostrar.tween_property(_texto, "modulate:a", 0.0, Ajustes.TEMPO_DO_FADE_DO_TEXTO)
		await mostrar.finished
	get_tree().change_scene_to_file(JOGO)
	await get_tree().process_frame
	var clarear := create_tween()
	clarear.tween_property(_preto, "modulate:a", 0.0, Ajustes.TEMPO_DA_TELA_PRETA_AO_CAIR)
	await clarear.finished
	_trocando = false


func trocando() -> bool:
	return _trocando


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and event.keycode == KEY_ESCAPE:
		get_tree().quit()
