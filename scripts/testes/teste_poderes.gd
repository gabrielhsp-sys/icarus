extends CasoDeTeste
## Três poderes temporários (G-017): velocidade, pulo alto e escudo.

const DURACOES := {Poderes.Tipo.VELOCIDADE: 8.0, Poderes.Tipo.PULO_ALTO: 6.0, Poderes.Tipo.ESCUDO: 10.0}


func teste_sem_item_nao_ha_poder_ativo() -> void:
	var poderes := Poderes.new(DURACOES)
	igual(poderes.ativo(), Poderes.Tipo.NENHUM, "poder inicial")


func teste_pegar_item_ativa_o_poder_pelo_tempo_dele() -> void:
	var poderes := Poderes.new(DURACOES)
	poderes.ativar(Poderes.Tipo.PULO_ALTO)
	poderes.avancar(5.0)
	igual(poderes.ativo(), Poderes.Tipo.PULO_ALTO, "ainda ativo aos 5 s de 6")
	quase_igual(poderes.tempo_restante(), 1.0, "tempo restante aos 5 s de 6")
	poderes.avancar(1.5)
	igual(poderes.ativo(), Poderes.Tipo.NENHUM, "acabou depois de 6 s")
	quase_igual(poderes.tempo_restante(), 0.0, "sem tempo restante")


func teste_item_novo_substitui_o_poder_ativo() -> void:
	var poderes := Poderes.new(DURACOES)
	poderes.ativar(Poderes.Tipo.VELOCIDADE)
	poderes.avancar(7.0)
	poderes.ativar(Poderes.Tipo.ESCUDO)
	igual(poderes.ativo(), Poderes.Tipo.ESCUDO, "o escudo substitui a velocidade")
	quase_igual(poderes.tempo_restante(), 10.0, "o tempo recomeça com a duração do escudo")


func teste_escudo_absorve_um_inimigo_e_some() -> void:
	var poderes := Poderes.new(DURACOES)
	poderes.ativar(Poderes.Tipo.ESCUDO)
	verdadeiro(poderes.usar_escudo(), "o escudo absorve o primeiro inimigo")
	igual(poderes.ativo(), Poderes.Tipo.NENHUM, "o escudo some ao ser usado")
	verdadeiro(not poderes.usar_escudo(), "sem escudo, o segundo inimigo não é absorvido")


func teste_outro_poder_nao_absorve_inimigo() -> void:
	var poderes := Poderes.new(DURACOES)
	poderes.ativar(Poderes.Tipo.VELOCIDADE)
	verdadeiro(not poderes.usar_escudo(), "velocidade não protege")
	igual(poderes.ativo(), Poderes.Tipo.VELOCIDADE, "a velocidade continua ativa")
