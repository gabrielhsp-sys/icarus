extends CasoDeTeste
## Dificuldade crescente ao longo da subida (G-001, G-005).


func teste_fator_vai_de_zero_no_chao_a_um_no_ceu() -> void:
	quase_igual(Dificuldade.fator(0.0, 500.0, 1.0), 0.0, "no chão")
	quase_igual(Dificuldade.fator(250.0, 500.0, 1.0), 0.5, "no meio, curva linear")
	quase_igual(Dificuldade.fator(500.0, 500.0, 1.0), 1.0, "no céu")
	quase_igual(Dificuldade.fator(700.0, 500.0, 1.0), 1.0, "acima do céu não passa de 1")
	quase_igual(Dificuldade.fator(-3.0, 500.0, 1.0), 0.0, "abaixo do chão não fica negativo")


func teste_expoente_maior_deixa_o_comeco_mais_facil() -> void:
	quase_igual(Dificuldade.fator(250.0, 500.0, 2.0), 0.25, "no meio, expoente 2")


func teste_valor_interpolado_pelo_fator() -> void:
	quase_igual(Dificuldade.valor(2.0, 3.0, 0.0), 2.0, "fator 0 dá o valor do começo")
	quase_igual(Dificuldade.valor(2.0, 3.0, 0.5), 2.5, "fator 0,5 dá o meio")
	quase_igual(Dificuldade.valor(2.0, 3.0, 1.0), 3.0, "fator 1 dá o valor do fim")


func teste_sorteio_do_tipo_de_plataforma_respeita_os_pesos() -> void:
	# pesos 70 / 20 / 10: o sorteio (0 a 1) cai em faixas de 0,7 / 0,2 / 0,1
	var pesos := {"fixa": 70.0, "movel": 20.0, "instavel": 10.0}
	igual(Dificuldade.sortear(pesos, 0.0), "fixa", "sorteio 0")
	igual(Dificuldade.sortear(pesos, 0.69), "fixa", "sorteio 0,69")
	igual(Dificuldade.sortear(pesos, 0.71), "movel", "sorteio 0,71")
	igual(Dificuldade.sortear(pesos, 0.95), "instavel", "sorteio 0,95")
	igual(Dificuldade.sortear(pesos, 1.0), "instavel", "sorteio 1 fica no último")


func teste_pesos_do_comeco_e_do_fim_se_misturam_pelo_fator() -> void:
	var comeco := {"fixa": 80.0, "instavel": 20.0}
	var fim := {"fixa": 20.0, "instavel": 80.0}
	var meio := Dificuldade.pesos(comeco, fim, 0.5)
	quase_igual(meio["fixa"], 50.0, "fixa no meio")
	quase_igual(meio["instavel"], 50.0, "instável no meio")
