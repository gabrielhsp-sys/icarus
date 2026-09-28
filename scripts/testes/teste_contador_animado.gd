extends CasoDeTeste
## Score subindo com contagem animada no HUD: o número mostrado corre atrás do score real.


func teste_numero_mostrado_corre_ate_o_score_sem_passar() -> void:
	var contador := ContadorAnimado.new(8.0)
	contador.avancar(100, 0.05)
	verdadeiro(contador.valor() > 0 and contador.valor() < 100, "depois de um quadro, está no caminho (%d)" % contador.valor())
	for i in 60:
		contador.avancar(100, 0.05)
	igual(contador.valor(), 100, "chega ao score")
	contador.avancar(100, 0.05)
	igual(contador.valor(), 100, "não passa do score")


func teste_numero_mostrado_desce_quando_perde_pontos() -> void:
	var contador := ContadorAnimado.new(8.0)
	for i in 60:
		contador.avancar(100, 0.05)
	for i in 60:
		contador.avancar(50, 0.05)
	igual(contador.valor(), 50, "desce até o score depois do dano")


func teste_diferenca_pequena_nao_fica_parada() -> void:
	var contador := ContadorAnimado.new(8.0)
	contador.avancar(1, 0.001)
	igual(contador.valor(), 1, "1 ponto de diferença anda pelo menos 1")
