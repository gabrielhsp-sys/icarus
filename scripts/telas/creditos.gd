extends Control
## Créditos e score do jogador, depois da cutscene final (G-019). "Voltar ao início"
## leva à tela inicial. A equipe é a divisão de tarefas do grupo (G-013).
## Os créditos rolam para cima (Ajustes.CREDITOS_ROLANDO).

@onready var _score: Label = $Topo/Score
@onready var _recorde: Label = $Topo/Recorde
@onready var _janela: Control = $Janela
@onready var _rolo: Control = $Janela/Rolo
@onready var _voltar: Button = $Voltar


func _ready() -> void:
	_score.text = Textos.SEU_SCORE % Partida.placar.score()
	_recorde.text = Textos.NOVO_RECORDE if Partida.ultima_foi_recorde else Textos.RECORDE_NOS_CREDITOS % Partida.recorde.melhor_score
	_recorde.visible = Ajustes.RECORDE
	_voltar.text = Textos.VOLTAR_AO_INICIO
	_voltar.pressed.connect(func() -> void: Telas.trocar_para(Telas.TELA_INICIAL))
	_voltar.grab_focus()
	if Ajustes.CREDITOS_ROLANDO:
		_rolo.position.y = _janela.size.y * 0.3


func _process(delta: float) -> void:
	if not Ajustes.CREDITOS_ROLANDO:
		return
	_rolo.position.y -= Ajustes.VELOCIDADE_DOS_CREDITOS * delta
	if _rolo.position.y < -_rolo.size.y:
		_rolo.position.y = _janela.size.y
