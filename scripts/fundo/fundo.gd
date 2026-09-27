extends CanvasLayer
## Fundo 2D atrás do mundo 3D: um por cenário (G-005), PNG 1920×1080 (G-022), com fade na
## troca. Enquanto o PNG não existir em assets/textures/, aparece a cor provisória.

const IMAGENS := [
	"res://assets/textures/fundo_1_terra_creta.png",
	"res://assets/textures/fundo_2_cidade.png",
	"res://assets/textures/fundo_3_subida_para_o_ceu.png",
	"res://assets/textures/fundo_4_nuvens.png",
	"res://assets/textures/fundo_5_ceu.png",
]
const CORES_PROVISORIAS := [
	Color(0.85, 0.65, 0.35),
	Color(0.6, 0.62, 0.7),
	Color(0.45, 0.7, 0.95),
	Color(0.8, 0.9, 1.0),
	Color(0.35, 0.55, 1.0),
]

var _camadas: Array[ColorRect] = []
var _atual := -1


func _ready() -> void:
	for i in IMAGENS.size():
		var camada := ColorRect.new()
		camada.name = "Cenario%d" % (i + 1)
		camada.color = CORES_PROVISORIAS[i]
		camada.mouse_filter = Control.MOUSE_FILTER_IGNORE
		camada.set_anchors_preset(Control.PRESET_FULL_RECT)
		camada.modulate.a = 0.0
		if ResourceLoader.exists(IMAGENS[i]):
			var imagem := TextureRect.new()
			imagem.texture = load(IMAGENS[i])
			imagem.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
			imagem.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_COVERED
			imagem.mouse_filter = Control.MOUSE_FILTER_IGNORE
			imagem.set_anchors_preset(Control.PRESET_FULL_RECT)
			camada.add_child(imagem)
		add_child(camada)
		_camadas.append(camada)
	mostrar(0, false)


## Mostra o cenário do índice dado (0 a 4). Com fade, o novo aparece por cima do anterior.
func mostrar(indice: int, com_fade := true) -> void:
	if indice == _atual:
		return
	_atual = indice
	var camada := _camadas[indice]
	move_child(camada, -1)
	if not com_fade:
		camada.modulate.a = 1.0
		return
	camada.modulate.a = 0.0
	create_tween().tween_property(camada, "modulate:a", 1.0, Ajustes.TEMPO_DO_FADE_DO_FUNDO)
