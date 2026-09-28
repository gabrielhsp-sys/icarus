extends CasoDeTeste
## Recorde de score e de altura, e a altura da partida anterior (meta provisória da
## Programação, para dar vontade de jogar de novo).


func teste_primeira_partida_vira_recorde() -> void:
	var recorde := Recorde.new()
	verdadeiro(recorde.registrar_partida(320, 31.5), "a primeira partida com pontos é recorde")
	igual(recorde.melhor_score, 320, "melhor score")
	quase_igual(recorde.melhor_altura, 31.5, "melhor altura")
	quase_igual(recorde.altura_anterior, 31.5, "altura da partida anterior")


func teste_partida_pior_nao_apaga_o_recorde() -> void:
	var recorde := Recorde.new()
	recorde.registrar_partida(320, 31.5)
	verdadeiro(not recorde.registrar_partida(100, 12.0), "partida pior não é recorde")
	igual(recorde.melhor_score, 320, "o melhor score continua")
	quase_igual(recorde.melhor_altura, 31.5, "a melhor altura continua")
	quase_igual(recorde.altura_anterior, 12.0, "a anterior é a última partida")


func teste_recorde_vira_dados_e_volta_igual() -> void:
	var recorde := Recorde.new()
	recorde.registrar_partida(320, 31.5)
	recorde.registrar_partida(100, 12.0)
	var lido := Recorde.de_dados(recorde.para_dados())
	igual(lido.melhor_score, 320, "melhor score depois de ler")
	quase_igual(lido.melhor_altura, 31.5, "melhor altura depois de ler")
	quase_igual(lido.altura_anterior, 12.0, "anterior depois de ler")


func teste_dados_estragados_viram_recorde_zerado() -> void:
	var lido := Recorde.de_dados({"melhor_score": "muito", "melhor_altura": -5.0})
	igual(lido.melhor_score, 0, "score que não é número vira 0")
	quase_igual(lido.melhor_altura, 0.0, "altura negativa vira 0")
	quase_igual(lido.altura_anterior, 0.0, "campo que falta vira 0")


func teste_salvar_e_ler_do_arquivo() -> void:
	var caminho := "user://teste_recorde.cfg"
	var recorde := Recorde.new()
	recorde.registrar_partida(777, 64.0)
	igual(ArquivoDeRecorde.salvar(recorde, caminho), OK, "salvou")
	var lido := ArquivoDeRecorde.ler(caminho)
	igual(lido.melhor_score, 777, "score lido do arquivo")
	quase_igual(lido.melhor_altura, 64.0, "altura lida do arquivo")
	DirAccess.remove_absolute(ProjectSettings.globalize_path(caminho))


func teste_sem_arquivo_o_recorde_comeca_zerado() -> void:
	var lido := ArquivoDeRecorde.ler("user://nao_existe_recorde.cfg")
	igual(lido.melhor_score, 0, "sem arquivo, score 0")
