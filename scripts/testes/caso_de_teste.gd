class_name CasoDeTeste
extends RefCounted
## Base dos arquivos de teste. Cada função que começa com "teste_" é um teste.
## O executor (rodar_testes.gd) chama as funções e conta as falhas.

var falhas: Array[String] = []
var assercoes := 0


func igual(obtido: Variant, esperado: Variant, descricao := "") -> void:
	assercoes += 1
	if typeof(obtido) != typeof(esperado) or obtido != esperado:
		falhas.append("%s: esperado %s, obtido %s" % [descricao, var_to_str(esperado), var_to_str(obtido)])


func quase_igual(obtido: float, esperado: float, descricao := "", tolerancia := 0.0001) -> void:
	assercoes += 1
	if absf(obtido - esperado) > tolerancia:
		falhas.append("%s: esperado %s, obtido %s" % [descricao, esperado, obtido])


func verdadeiro(condicao: bool, descricao := "") -> void:
	assercoes += 1
	if not condicao:
		falhas.append("%s: esperado verdadeiro" % descricao)
