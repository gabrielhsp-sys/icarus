class_name Contato
extends RefCounted
## O que acontece quando um inimigo encosta em Ícaro (G-018). Guarda o tempo de
## invulnerabilidade (Ícaro piscando) depois de um dano. Não há barra de vida.

enum Resultado { DANO, ABSORVIDO_PELO_ESCUDO, IGNORADO_INVULNERAVEL }

var _tempo_invulneravel: float
var _restante := 0.0


## tempo_invulneravel: segundos piscando depois de um dano (vem de Ajustes).
func _init(tempo_invulneravel: float) -> void:
	_tempo_invulneravel = tempo_invulneravel


func invulneravel() -> bool:
	return _restante > 0.0


## Passa o tempo (delta, em segundos).
func avancar(delta: float) -> void:
	_restante = maxf(0.0, _restante - delta)


## Decide o contato: piscando, nada acontece; com escudo, o escudo some e não há dano;
## senão é dano (quem chama tira os pontos e empurra Ícaro para baixo).
func inimigo_encostou(poderes: Poderes) -> Resultado:
	if invulneravel():
		return Resultado.IGNORADO_INVULNERAVEL
	if poderes.usar_escudo():
		return Resultado.ABSORVIDO_PELO_ESCUDO
	_restante = _tempo_invulneravel
	return Resultado.DANO
