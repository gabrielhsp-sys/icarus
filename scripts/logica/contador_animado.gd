class_name ContadorAnimado
extends RefCounted
## Número que corre atrás de um alvo (o score do HUD). Anda uma fração da diferença por
## segundo — rápido quando falta muito, devagar no fim — e nunca passa do alvo.

var _rapidez: float
var _valor := 0.0


## rapidez: quanto da diferença anda por segundo (vem de Ajustes).
func _init(rapidez: float) -> void:
	_rapidez = rapidez


func valor() -> int:
	return roundi(_valor)


func avancar(alvo: int, delta: float) -> void:
	var diferenca := float(alvo) - _valor
	if absf(diferenca) < 0.5:
		_valor = alvo
		return
	var passo := diferenca * minf(1.0, _rapidez * delta)
	if absf(passo) < 1.0:
		passo = signf(diferenca)
	_valor += passo
	if signf(float(alvo) - _valor) != signf(diferenca):
		_valor = alvo
