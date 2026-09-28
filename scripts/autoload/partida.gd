extends Node
## Autoload "Partida": estado da partida em andamento — score e poder ativo.
## Qualquer cena lê daqui (ex.: o HUD). A cena do jogo chama nova_partida() ao começar e
## encerrar() no fim; depois do fim, altura e dano não mudam mais o score.

var placar := Placar.new(Ajustes.PONTOS_POR_METRO)
var poderes := Poderes.new(Ajustes.DURACAO_DOS_PODERES)
var em_andamento := false
## Recorde salvo no computador (Ajustes.RECORDE). Onde fica: ArquivoDeRecorde.
var recorde := Recorde.new()
var ultima_foi_recorde := false            ## recorde de score
var ultima_altura_foi_recorde := false
var _caminho_do_recorde := ArquivoDeRecorde.CAMINHO_PADRAO


func _ready() -> void:
	_carregar_recorde()


## Troca o arquivo do recorde (o teste de fumaça usa um arquivo próprio).
func usar_arquivo_de_recorde(caminho: String) -> void:
	_caminho_do_recorde = caminho
	_carregar_recorde()


func nova_partida() -> void:
	placar = Placar.new(Ajustes.PONTOS_POR_METRO)
	poderes = Poderes.new(Ajustes.DURACAO_DOS_PODERES)
	em_andamento = true


## Fim da partida (chegada ao céu ou queda): o score fica congelado, e é ele que os
## créditos mostram.
func encerrar() -> void:
	if not em_andamento:
		return
	em_andamento = false
	if Ajustes.RECORDE:
		ultima_foi_recorde = recorde.registrar_partida(placar.score(), placar.altura_maxima())
		ultima_altura_foi_recorde = recorde.ultima_altura_foi_recorde
		ArquivoDeRecorde.salvar(recorde, _caminho_do_recorde)


func registrar_altura(altura: float) -> void:
	if em_andamento:
		placar.registrar_altura(altura)


func perder_pontos() -> void:
	if em_andamento:
		placar.perder_pontos(Ajustes.PONTOS_PERDIDOS)


func _carregar_recorde() -> void:
	recorde = ArquivoDeRecorde.ler(_caminho_do_recorde) if Ajustes.RECORDE else Recorde.new()


func _process(delta: float) -> void:
	if em_andamento:
		poderes.avancar(delta)
