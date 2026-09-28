class_name Poderes
extends RefCounted
## Poder temporário ativo de Ícaro (G-017). Um poder por vez.

enum Tipo { NENHUM, VELOCIDADE, PULO_ALTO, ESCUDO }

var _duracoes: Dictionary
var _ativo := Tipo.NENHUM
var _restante := 0.0


## duracoes: segundos de cada poder, por Tipo (vêm de Ajustes).
func _init(duracoes: Dictionary) -> void:
	_duracoes = duracoes


func ativo() -> Tipo:
	return _ativo


func tempo_restante() -> float:
	return _restante


## Pegar um item de poder. Um poder novo substitui o que estava ativo.
func ativar(tipo: Tipo) -> void:
	_ativo = tipo
	_restante = _duracoes.get(tipo, 0.0)


## Passa o tempo (delta, em segundos). O poder some quando o tempo acaba.
func avancar(delta: float) -> void:
	if _ativo == Tipo.NENHUM:
		return
	_restante = maxf(0.0, _restante - delta)
	if _restante == 0.0:
		_ativo = Tipo.NENHUM


## Um inimigo encostou. Se o escudo está ativo, ele absorve o dano e some (devolve true).
func usar_escudo() -> bool:
	if _ativo != Tipo.ESCUDO:
		return false
	_ativo = Tipo.NENHUM
	_restante = 0.0
	return true
