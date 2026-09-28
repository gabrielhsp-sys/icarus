class_name Marcas
extends RefCounted
## Marcas a superar (ex.: altura do recorde e da partida anterior). Cada marca avisa uma vez
## só, no momento em que é superada. Marca 0 ou negativa não conta.

var _restantes := {}


func _init(valores_por_nome: Dictionary) -> void:
	for nome in valores_por_nome:
		if valores_por_nome[nome] > 0.0:
			_restantes[nome] = valores_por_nome[nome]


## Devolve os nomes das marcas superadas agora (e as tira da lista).
func verificar(valor_atual: float) -> Array:
	var superadas := []
	for nome in _restantes.keys():
		if valor_atual > _restantes[nome]:
			superadas.append(nome)
			_restantes.erase(nome)
	return superadas
