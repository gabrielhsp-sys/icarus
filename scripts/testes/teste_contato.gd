extends CasoDeTeste
## Inimigo encosta em Ícaro (G-018), com escudo (G-017) e invulnerabilidade.

const DURACOES := {Poderes.Tipo.VELOCIDADE: 8.0, Poderes.Tipo.PULO_ALTO: 6.0, Poderes.Tipo.ESCUDO: 10.0}


func teste_sem_protecao_o_contato_causa_dano_e_deixa_invulneravel() -> void:
	var contato := Contato.new(1.5)
	var poderes := Poderes.new(DURACOES)
	igual(contato.inimigo_encostou(poderes), Contato.Resultado.DANO, "primeiro contato")
	verdadeiro(contato.invulneravel(), "invulnerável logo depois do dano")


func teste_invulneravel_ignora_novo_contato_ate_o_tempo_acabar() -> void:
	var contato := Contato.new(1.5)
	var poderes := Poderes.new(DURACOES)
	contato.inimigo_encostou(poderes)
	contato.avancar(1.0)
	igual(contato.inimigo_encostou(poderes), Contato.Resultado.IGNORADO_INVULNERAVEL, "aos 1 s de 1,5 s")
	contato.avancar(0.6)
	verdadeiro(not contato.invulneravel(), "a invulnerabilidade acabou")
	igual(contato.inimigo_encostou(poderes), Contato.Resultado.DANO, "depois dos 1,5 s, dano de novo")


func teste_escudo_absorve_o_contato_sem_dano() -> void:
	var contato := Contato.new(1.5)
	var poderes := Poderes.new(DURACOES)
	poderes.ativar(Poderes.Tipo.ESCUDO)
	igual(contato.inimigo_encostou(poderes), Contato.Resultado.ABSORVIDO_PELO_ESCUDO, "com escudo")
	verdadeiro(not contato.invulneravel(), "o escudo não deixa piscando")
	igual(contato.inimigo_encostou(poderes), Contato.Resultado.DANO, "o escudo já foi usado")


func teste_depois_do_dano_icaro_nao_quica_por_um_instante() -> void:
	var contato := Contato.new(1.5, 0.4)
	var poderes := Poderes.new(DURACOES)
	verdadeiro(contato.pode_quicar(), "antes do dano, quica")
	contato.inimigo_encostou(poderes)
	verdadeiro(not contato.pode_quicar(), "logo depois do dano, não quica")
	contato.avancar(0.3)
	verdadeiro(not contato.pode_quicar(), "aos 0,3 s de 0,4 s, ainda não quica")
	contato.avancar(0.15)
	verdadeiro(contato.pode_quicar(), "depois de 0,4 s, volta a quicar")


func teste_escudo_nao_tira_o_quique() -> void:
	var contato := Contato.new(1.5, 0.4)
	var poderes := Poderes.new(DURACOES)
	poderes.ativar(Poderes.Tipo.ESCUDO)
	contato.inimigo_encostou(poderes)
	verdadeiro(contato.pode_quicar(), "o escudo absorveu: não há empurrão")
