extends Control
## Tela inicial com o botão "Jogar". Apresentação provisória: título animado, Ícaro
## provisório em loop, o recorde e uma frase (textos em scripts/textos.gd).

var _tempo := 0.0

@onready var _jogar: Button = $Centro/Linhas/Jogar
@onready var _titulo: Label = $Centro/Linhas/Titulo
@onready var _frase: Label = $Centro/Linhas/Frase
@onready var _recorde: Label = $Centro/Linhas/Recorde
@onready var _icaro: Node3D = $Vista/Mundo/Icaro


func _ready() -> void:
	_jogar.text = Textos.JOGAR
	_jogar.pressed.connect(func() -> void: Telas.trocar_para(Telas.JOGO))
	_jogar.grab_focus()
	_frase.text = Textos.sortear(Textos.TELA_INICIAL)
	_frase.visible = _frase.text != ""
	var recorde := Partida.recorde
	_recorde.visible = Ajustes.RECORDE and recorde.melhor_score > 0
	_recorde.text = Textos.RECORDE_NA_TELA_INICIAL % [recorde.melhor_score, roundi(recorde.melhor_altura)]
	EstiloToon.aplicar(_icaro)
	Sons.tocar_musica()


func _process(delta: float) -> void:
	_tempo += delta
	_titulo.pivot_offset = _titulo.size / 2.0
	_titulo.rotation = sin(_tempo * 1.3) * 0.04
	_titulo.scale = Vector2.ONE * (1.0 + sin(_tempo * 2.6) * 0.03)
	_icaro.position.y = sin(_tempo * 2.0) * 0.25
	_icaro.rotation.y = sin(_tempo * 0.8) * 0.6
	_icaro.rotation.z = sin(_tempo * 2.0 + 0.6) * 0.08
