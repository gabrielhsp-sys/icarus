class_name Contato
extends RefCounted
## O que acontece quando um inimigo encosta em Ícaro (G-018). Guarda o tempo de
## invulnerabilidade (Ícaro piscando) depois de um dano. Não há barra de vida.

enum Resultado { DANO, ABSORVIDO_PELO_ESCUDO, IGNORADO_INVULNERAVEL }

var _tempo_invulneravel: float
var _tempo_sem_quique: float
var _restante := 0.0
var _restante_sem_quique := 0.0


## tempo_invulneravel: segundos piscando depois de um dano. tempo_sem_quique: segundos em
## que Ícaro não quica nas plataformas depois do dano, para o empurrão levar ele para baixo
## de verdade (G-018). Os dois vêm de Ajustes.
func _init(tempo_invulneravel: float, tempo_sem_quique := 0.0) -> void:
	_tempo_invulneravel = tempo_invulneravel
	_tempo_sem_quique = tempo_sem_quique


func invulneravel() -> bool:
	return _restante > 0.0


## false logo depois de um dano: Ícaro atravessa as plataformas em vez de quicar nelas.
func pode_quicar() -> bool:
	return _restante_sem_quique <= 0.0


## Passa o tempo (delta, em segundos).
func avancar(delta: float) -> void:
	_restante = maxf(0.0, _restante - delta)
	_restante_sem_quique = maxf(0.0, _restante_sem_quique - delta)


## Decide o contato: piscando, nada acontece; com escudo, o escudo some e não há dano;
## senão é dano (quem chama tira os pontos e empurra Ícaro para baixo).
func inimigo_encostou(poderes: Poderes) -> Resultado:
	if invulneravel():
		return Resultado.IGNORADO_INVULNERAVEL
	if poderes.usar_escudo():
		return Resultado.ABSORVIDO_PELO_ESCUDO
	_restante = _tempo_invulneravel
	_restante_sem_quique = _tempo_sem_quique
	return Resultado.DANO
