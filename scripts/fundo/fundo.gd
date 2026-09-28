extends CanvasLayer
## Fundo 2D atrás do mundo 3D: um por cenário (G-005), PNG 1920×1080 (G-022), com fade na
## troca. Enquanto o PNG não existir em assets/textures/, aparece um degradê provisório com a
## paleta do cenário (Ajustes.FUNDO_EM_CIMA e FUNDO_EMBAIXO).

const IMAGENS := [
	"res://assets/textures/fundo_1_terra_creta.png",
	"res://assets/textures/fundo_2_cidade.png",
	"res://assets/textures/fundo_3_subida_para_o_ceu.png",
	"res://assets/textures/fundo_4_nuvens.png",
	"res://assets/textures/fundo_5_ceu.png",
]
var _camadas: Array[ColorRect] = []
var _atual := -1


func _ready() -> void:
	for i in IMAGENS.size():
		var camada := ColorRect.new()
		camada.name = "Cenario%d" % (i + 1)
		camada.color = Ajustes.FUNDO_EM_CIMA[i]
		camada.mouse_filter = Control.MOUSE_FILTER_IGNORE
		camada.set_anchors_preset(Control.PRESET_FULL_RECT)
		camada.modulate.a = 0.0
		var textura: Texture2D = null
		if ResourceLoader.exists(IMAGENS[i]):
			textura = load(IMAGENS[i])
		elif Ajustes.PALETA_POR_CENARIO:
			textura = _degrade(Ajustes.FUNDO_EM_CIMA[i], Ajustes.FUNDO_EMBAIXO[i])
		if textura != null:
			var imagem := TextureRect.new()
			imagem.texture = textura
			imagem.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
			# o PNG cobre a tela sem distorcer; o degradê provisório estica inteiro
			imagem.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_COVERED if textura is not GradientTexture2D \
				else TextureRect.STRETCH_SCALE
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


func _degrade(em_cima: Color, embaixo: Color) -> GradientTexture2D:
	var degrade := Gradient.new()
	degrade.set_color(0, em_cima)
	degrade.set_color(1, embaixo)
	var textura := GradientTexture2D.new()
	textura.gradient = degrade
	textura.fill_from = Vector2(0.5, 0.0)
	textura.fill_to = Vector2(0.5, 1.0)
	textura.width = 16
	textura.height = 256
	return textura
