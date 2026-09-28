extends CasoDeTeste
## Score pela altura (G-001) e perda de pontos quando um inimigo encosta (G-018).


func teste_score_comeca_em_zero() -> void:
	var placar := Placar.new(10)
	igual(placar.score(), 0, "score inicial")


func teste_score_vem_da_maior_altura_alcancada() -> void:
	var placar := Placar.new(10)
	placar.registrar_altura(12.5)
	placar.registrar_altura(4.0)
	igual(placar.score(), 125, "12,5 m a 10 pontos por metro; descer não tira pontos")


func teste_inimigo_que_encosta_tira_pontos() -> void:
	var placar := Placar.new(10)
	placar.registrar_altura(30.0)
	placar.perder_pontos(50)
	igual(placar.score(), 250, "300 pela altura menos 50")


func teste_score_nunca_fica_negativo() -> void:
	var placar := Placar.new(10)
	placar.registrar_altura(2.0)
	placar.perder_pontos(50)
	igual(placar.score(), 0, "20 pela altura menos 50 fica em 0")
