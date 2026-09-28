class_name Recorde
extends RefCounted
## Recorde de score e de altura, mais a altura da partida anterior. Meta provisória da
## Programação: não muda o score (G-001, G-018), só o guarda entre partidas.

var melhor_score := 0
var melhor_altura := 0.0
var altura_anterior := 0.0
## Se a última partida registrada bateu o recorde de altura.
var ultima_altura_foi_recorde := false


## Guarda o resultado de uma partida. Devolve true se o score for um recorde novo.
func registrar_partida(score: int, altura: float) -> bool:
	var novo := score > melhor_score
	ultima_altura_foi_recorde = altura > melhor_altura
	melhor_score = maxi(melhor_score, score)
	melhor_altura = maxf(melhor_altura, altura)
	altura_anterior = altura
	return novo


func para_dados() -> Dictionary:
	return {"melhor_score": melhor_score, "melhor_altura": melhor_altura, "altura_anterior": altura_anterior}


## Monta um recorde a partir de dados lidos do disco. O que faltar ou vier estragado vira 0.
static func de_dados(dados: Dictionary) -> Recorde:
	var recorde := Recorde.new()
	recorde.melhor_score = maxi(0, _numero(dados.get("melhor_score")) as int)
	recorde.melhor_altura = maxf(0.0, _numero(dados.get("melhor_altura")))
	recorde.altura_anterior = maxf(0.0, _numero(dados.get("altura_anterior")))
	return recorde


static func _numero(valor: Variant) -> float:
	if valor is int or valor is float:
		return float(valor)
	return 0.0
