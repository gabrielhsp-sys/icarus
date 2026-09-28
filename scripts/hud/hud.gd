extends CanvasLayer
## HUD: score (G-001) e poder ativo com o tempo que falta (G-017). Lê a Partida.

const NOMES_DOS_PODERES := {
	Poderes.Tipo.VELOCIDADE: "Velocidade",
	Poderes.Tipo.PULO_ALTO: "Pulo alto",
	Poderes.Tipo.ESCUDO: "Escudo",
}

@onready var _score: Label = $Margem/Linhas/Score
@onready var _poder: Label = $Margem/Linhas/Poder


func _process(_delta: float) -> void:
	_score.text = "Score: %d" % Partida.placar.score()
	var ativo := Partida.poderes.ativo()
	if ativo == Poderes.Tipo.NENHUM:
		_poder.text = ""
	else:
		_poder.text = "%s: %d s" % [NOMES_DOS_PODERES[ativo], ceili(Partida.poderes.tempo_restante())]
