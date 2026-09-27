class_name Placar
extends RefCounted
## Score da partida: pontos pela altura alcançada (G-001), menos os pontos perdidos
## quando um inimigo encosta em Ícaro (G-018).

var _pontos_por_metro: float
var _altura_maxima := 0.0
var _pontos_perdidos := 0


func _init(pontos_por_metro: float) -> void:
	_pontos_por_metro = pontos_por_metro


func registrar_altura(altura: float) -> void:
	_altura_maxima = maxf(_altura_maxima, altura)


func altura_maxima() -> float:
	return _altura_maxima


func perder_pontos(pontos: int) -> void:
	_pontos_perdidos += pontos


## Nunca fica abaixo de zero (padrão provisório da Programação).
func score() -> int:
	return maxi(0, floori(_altura_maxima * _pontos_por_metro) - _pontos_perdidos)
