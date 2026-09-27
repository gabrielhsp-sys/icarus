extends Control
## Créditos e score do jogador, depois da cutscene final (G-019). "Voltar ao início"
## leva à tela inicial. A equipe é a divisão de tarefas do grupo (G-013).

@onready var _score: Label = $Centro/Linhas/Score
@onready var _voltar: Button = $Centro/Linhas/Voltar


func _ready() -> void:
	_score.text = "Seu score: %d" % Partida.placar.score()
	_voltar.pressed.connect(func() -> void: Telas.trocar_para(Telas.TELA_INICIAL))
	_voltar.grab_focus()
