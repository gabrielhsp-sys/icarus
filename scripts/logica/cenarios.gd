class_name Cenarios
extends RefCounted
## Os cinco cenários da subida (G-005). Cada um ocupa um trecho igual da altura total.

const NOMES := ["Terra (Creta)", "Cidade", "Subida para o céu", "Nuvens", "Céu"]


## Índice do cenário (0 a 4) na altura dada.
static func indice(altura: float, altura_do_ceu: float) -> int:
	var quantidade := NOMES.size()
	return clampi(floori(altura / altura_do_ceu * quantidade), 0, quantidade - 1)
