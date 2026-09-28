class_name Textos
extends RefCounted
## TODAS as frases do jogo ficam aqui, para editar ou tirar fácil. São provisórias da
## Programação e precisam da aprovação do grupo. Desligar as frases: Ajustes.FRASES = false.
## Os nomes dos cenários vêm de Cenarios.NOMES (G-005).

## Uma delas aparece na tela inicial.
const TELA_INICIAL := [
	"Asas de cera. Coragem de sobra.",
	"Dédalo disse para não voar alto. Ícaro ouviu? Não.",
	"Sobe. Só não olha para o sol.",
	"Hoje é um ótimo dia para desobedecer o pai.",
]

## Uma por cenário, na ordem de Cenarios.NOMES, embaixo do nome ao entrar nele.
const CENARIOS := [
	"O labirinto ficou para trás.",
	"Lá embaixo, todo mundo parece pequeno.",
	"O ar esquenta. A cera também.",
	"Macio como algodão. Não pise com força.",
	"O sol está logo ali. Que mal pode fazer?",
]

## Uma aparece quando Ícaro chega perto do sol (Ajustes.FRACAO_PERTO_DO_SOL).
const PERTO_DO_SOL := [
	"Está cheirando a vela queimada...",
	"Só mais um pouquinho.",
]

## Depois da cutscene final, antes dos créditos (G-019: a arrogância leva à queda).
const FRASE_FINAL := "Quem voa perto demais do sol aprende o caminho de volta."

const NOVO_RECORDE := "Novo recorde!"
const MARCA_DO_RECORDE := "Recorde"
const MARCA_DA_ANTERIOR := "Última partida"
const JOGAR := "Jogar"
const VOLTAR_AO_INICIO := "Voltar ao início"
const RECORDE_NA_TELA_INICIAL := "Recorde: %d  ·  %d m"
const SCORE_NO_HUD := "Score: %d"
const RECORDE_NO_HUD := "Recorde: %d  ·  %d m"
const SEU_SCORE := "Seu score: %d"
const RECORDE_NOS_CREDITOS := "Recorde: %d"
const PODER_NO_HUD := "%s: %d s"
const NOMES_DOS_PODERES := {
	Poderes.Tipo.VELOCIDADE: "Velocidade",
	Poderes.Tipo.PULO_ALTO: "Pulo alto",
	Poderes.Tipo.ESCUDO: "Escudo",
}


## PROVISÓRIO, para o grupo aprovar (G-020 fala só de tela preta e reinício). Liga/desliga:
## Ajustes.TEXTO_NA_TELA_PRETA (não depende de FRASES). Sem recorde (Ajustes.RECORDE = false),
## mostra só a altura.
static func tela_preta(altura: float, melhor_altura: float, altura_foi_recorde: bool) -> String:
	if not Ajustes.RECORDE:
		return "%d m" % roundi(altura)
	if altura_foi_recorde:
		return "%d m. Nova altura recorde!" % roundi(altura)
	return "%d m  ·  recorde %d m" % [roundi(altura), roundi(melhor_altura)]


static func sortear(lista: Array) -> String:
	return lista[randi() % lista.size()] if Ajustes.FRASES and not lista.is_empty() else ""
