class_name Dificuldade
extends RefCounted
## Curva de dificuldade da subida. O fator vai de 0 (chão) a 1 (céu); os números de
## começo e de fim de cada parâmetro ficam em Ajustes.


## expoente 1 = cresce em linha reta; maior que 1 = fica difícil mais perto do céu.
static func fator(altura: float, altura_do_ceu: float, expoente: float) -> float:
	return pow(clampf(altura / altura_do_ceu, 0.0, 1.0), expoente)


## O valor de um parâmetro na altura atual, entre o do começo e o do fim da subida.
static func valor(no_comeco: float, no_fim: float, fator_atual: float) -> float:
	return lerpf(no_comeco, no_fim, fator_atual)


## Mistura os pesos do começo e do fim da subida pelo fator. As chaves são as mesmas.
static func pesos(no_comeco: Dictionary, no_fim: Dictionary, fator_atual: float) -> Dictionary:
	var resultado := {}
	for chave in no_comeco:
		resultado[chave] = lerpf(no_comeco[chave], no_fim.get(chave, 0.0), fator_atual)
	return resultado


## Escolhe uma chave de acordo com os pesos. sorteio vai de 0 a 1 (quem chama sorteia,
## para o teste poder fixar o valor).
static func sortear(pesos_por_chave: Dictionary, sorteio: float) -> Variant:
	var total := 0.0
	for chave in pesos_por_chave:
		total += pesos_por_chave[chave]
	var limite := sorteio * total
	var acumulado := 0.0
	var ultima: Variant = null
	for chave in pesos_por_chave:
		acumulado += pesos_por_chave[chave]
		ultima = chave
		if limite < acumulado:
			return chave
	return ultima
