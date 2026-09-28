extends CasoDeTeste
## Cinco cenários ao longo da subida (G-005): Terra (Creta), Cidade, Subida para o céu,
## Nuvens, Céu. A subida é dividida em cinco trechos iguais (padrão provisório).


func teste_cenario_de_cada_altura() -> void:
	igual(Cenarios.indice(0.0, 500.0), 0, "chão: Terra (Creta)")
	igual(Cenarios.indice(99.9, 500.0), 0, "logo antes de 1/5: Terra (Creta)")
	igual(Cenarios.indice(100.0, 500.0), 1, "1/5 da subida: Cidade")
	igual(Cenarios.indice(250.0, 500.0), 2, "metade: Subida para o céu")
	igual(Cenarios.indice(420.0, 500.0), 4, "último quinto: Céu")
	igual(Cenarios.indice(500.0, 500.0), 4, "no céu continua o Céu")
	igual(Cenarios.indice(-5.0, 500.0), 0, "abaixo do chão fica na Terra")
