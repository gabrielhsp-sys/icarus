extends Node
## Autoload "Partida": estado da partida em andamento — score e poder ativo.
## Qualquer cena lê daqui (ex.: o HUD). A cena do jogo chama nova_partida() ao começar e
## encerrar() no fim; depois do fim, altura e dano não mudam mais o score.

var placar := Placar.new(Ajustes.PONTOS_POR_METRO)
var poderes := Poderes.new(Ajustes.DURACAO_DOS_PODERES)
var em_andamento := false


func nova_partida() -> void:
	placar = Placar.new(Ajustes.PONTOS_POR_METRO)
	poderes = Poderes.new(Ajustes.DURACAO_DOS_PODERES)
	em_andamento = true


## Fim da partida (chegada ao céu ou queda): o score fica congelado, e é ele que os
## créditos mostram.
func encerrar() -> void:
	em_andamento = false


func registrar_altura(altura: float) -> void:
	if em_andamento:
		placar.registrar_altura(altura)


func perder_pontos() -> void:
	if em_andamento:
		placar.perder_pontos(Ajustes.PONTOS_PERDIDOS)


func _process(delta: float) -> void:
	if em_andamento:
		poderes.avancar(delta)
