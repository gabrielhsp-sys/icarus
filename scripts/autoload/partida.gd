extends Node
## Autoload "Partida": estado da partida em andamento — score e poder ativo.
## Qualquer cena lê daqui (ex.: o HUD). A cena do jogo chama nova_partida() ao começar.

var placar := Placar.new(Ajustes.PONTOS_POR_METRO)
var poderes := Poderes.new(Ajustes.DURACAO_DOS_PODERES)
var em_andamento := false


func nova_partida() -> void:
	placar = Placar.new(Ajustes.PONTOS_POR_METRO)
	poderes = Poderes.new(Ajustes.DURACAO_DOS_PODERES)
	em_andamento = true


## Chamado na chegada ao céu: o score fica congelado para os créditos.
func encerrar() -> void:
	em_andamento = false


func _process(delta: float) -> void:
	if em_andamento:
		poderes.avancar(delta)
