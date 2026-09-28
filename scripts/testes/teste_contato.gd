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
