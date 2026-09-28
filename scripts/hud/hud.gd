extends CanvasLayer
## HUD: score (G-001) e poder ativo com o tempo que falta (G-017), mais a apresentação
## provisória: contagem animada do score, recorde, barra do poder, faixa com o nome do
## cenário, aviso de novo recorde e frases. Lê a Partida.

var _contador := ContadorAnimado.new(Ajustes.RAPIDEZ_DA_CONTAGEM)
var _score_mostrado := -1

@onready var _score: Label = $Margem/Linhas/Score
@onready var _recorde: Label = $Margem/Linhas/Recorde
@onready var _poder: Label = $Margem/Linhas/Poder
@onready var _barra: ProgressBar = $Margem/Linhas/BarraDoPoder
@onready var _faixa: Control = $Faixa
@onready var _nome_do_cenario: Label = $Faixa/Linhas/Nome
@onready var _frase_do_cenario: Label = $Faixa/Linhas/Frase
@onready var _aviso: Label = $Aviso


func _ready() -> void:
	_faixa.modulate.a = 0.0
	_aviso.modulate.a = 0.0
	_recorde.visible = Ajustes.RECORDE and Partida.recorde.melhor_score > 0
	_recorde.text = Textos.RECORDE_NO_HUD % [Partida.recorde.melhor_score, roundi(Partida.recorde.melhor_altura)]


func _process(delta: float) -> void:
	var score := Partida.placar.score()
	if Ajustes.CONTAGEM_DO_SCORE:
		_contador.avancar(score, delta)
		score = _contador.valor()
	if score != _score_mostrado:
		if score > _score_mostrado and _score_mostrado >= 0 and Ajustes.CONTAGEM_DO_SCORE:
			_score.scale = Vector2(1.08, 1.08)
		_score_mostrado = score
		_score.text = Textos.SCORE_NO_HUD % score
	_score.scale = _score.scale.lerp(Vector2.ONE, 1.0 - exp(-12.0 * delta))
	var ativo := Partida.poderes.ativo()
	if ativo == Poderes.Tipo.NENHUM:
		_poder.text = ""
		_barra.visible = false
	else:
		var restante := Partida.poderes.tempo_restante()
		_poder.text = Textos.PODER_NO_HUD % [Textos.NOMES_DOS_PODERES[ativo], ceili(restante)]
		_barra.visible = Ajustes.BARRA_DO_PODER
		_barra.max_value = Ajustes.DURACAO_DOS_PODERES[ativo]
		_barra.value = restante
		_barra.modulate = ItemDePoder.CORES[ativo]


## Faixa com o nome do cenário (e uma frase) ao entrar nele.
func mostrar_cenario(nome: String, frase: String) -> void:
	if not Ajustes.FAIXA_DO_CENARIO:
		return
	_nome_do_cenario.text = nome
	_frase_do_cenario.text = frase
	_frase_do_cenario.visible = frase != ""
	_faixa.position.y = -40.0
	var entrada := create_tween()
	entrada.set_parallel()
	entrada.tween_property(_faixa, "modulate:a", 1.0, 0.3)
	entrada.tween_property(_faixa, "position:y", 0.0, 0.4).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	entrada.chain().tween_interval(Ajustes.TEMPO_DA_FAIXA_DO_CENARIO)
	entrada.chain().tween_property(_faixa, "modulate:a", 0.0, 0.6)


## Aviso no meio da tela ("Novo recorde!", frase perto do sol).
func avisar(texto: String) -> void:
	if texto == "":
		return
	_aviso.text = texto
	_aviso.pivot_offset = _aviso.size / 2.0
	_aviso.scale = Vector2(0.4, 0.4)
	var aviso := create_tween()
	aviso.set_parallel()
	aviso.tween_property(_aviso, "modulate:a", 1.0, 0.15)
	aviso.tween_property(_aviso, "scale", Vector2.ONE, 0.35).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	aviso.chain().tween_interval(Ajustes.TEMPO_DO_AVISO)
	aviso.chain().tween_property(_aviso, "modulate:a", 0.0, 0.4)
