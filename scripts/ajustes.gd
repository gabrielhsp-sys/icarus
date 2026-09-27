class_name Ajustes
extends RefCounted
## Todos os números de ajuste da jogabilidade ficam aqui. São valores iniciais da
## Programação, feitos para testar e mudar: altere, rode o jogo (F5) e veja. Distâncias em
## metros (1 unidade = 1 metro, G-015), tempos em segundos, velocidades em metros por segundo.
## As animações provisórias (plataforma quebrando, pula-pula, Ícaro piscando, cutscene) têm
## os números no próprio script, porque vão ser trocadas pela arte.

# --- Ícaro -----------------------------------------------------------------------------
const VELOCIDADE_LATERAL := 7.0          ## A e D (G-009)
const GRAVIDADE := 20.0
const VELOCIDADE_DO_SALTO := 11.0        ## salto automático; altura ≈ v² / (2 × gravidade) ≈ 3 m
const LIMITE_LATERAL := 11.0             ## Ícaro não passa de -11 m a +11 m (bordas da tela)

# --- Poderes (G-017) --------------------------------------------------------------------
const DURACAO_DOS_PODERES := {
	Poderes.Tipo.VELOCIDADE: 8.0,
	Poderes.Tipo.PULO_ALTO: 8.0,
	Poderes.Tipo.ESCUDO: 12.0,
}
const MULTIPLICADOR_DE_VELOCIDADE := 1.6 ## poder "velocidade": anda mais rápido para os lados
const MULTIPLICADOR_DO_PULO_ALTO := 1.3  ## poder "pulo alto": salto mais alto

# --- Plataformas (G-007) ----------------------------------------------------------------
const MULTIPLICADOR_DO_PULA_PULA := 1.7  ## a plataforma pula-pula dá um impulso maior
const TEMPO_PARA_QUEBRAR := 0.4          ## plataforma instável: tempo entre ser pisada e quebrar
const AMPLITUDE_DA_PLATAFORMA_MOVEL := 2.5  ## quanto a plataforma móvel anda para cada lado

# --- Inimigo que encosta em Ícaro (G-018) ----------------------------------------------
const PONTOS_PERDIDOS := 50
const TEMPO_INVULNERAVEL := 1.5          ## Ícaro fica piscando
const EMPURRAO_PARA_BAIXO := 9.0         ## velocidade para baixo logo depois do dano

# --- Flecha (G-008) ---------------------------------------------------------------------
const VELOCIDADE_DA_FLECHA := 28.0
const DURACAO_DA_FLECHA := 1.2           ## depois disso a flecha some
const INTERVALO_ENTRE_FLECHAS := 0.25

# --- Score (G-001) ----------------------------------------------------------------------
const PONTOS_POR_METRO := 10.0

# --- Subida e dificuldade (G-005) -------------------------------------------------------
const ALTURA_DO_CEU := 400.0             ## altura total da subida; chegar aqui leva à cutscene final
const EXPOENTE_DA_DIFICULDADE := 1.0     ## 1 = cresce em linha reta; 2 = mais fácil no começo
## Distância vertical entre uma plataforma e a próxima (no começo e no fim da subida).
## Precisa ser menor que a altura do salto (≈ 3 m), senão a próxima fica inalcançável.
const DISTANCIA_VERTICAL_NO_COMECO := 2.0
const DISTANCIA_VERTICAL_NO_FIM := 2.7
const DISTANCIA_LATERAL_MAXIMA := 5.0    ## quanto a próxima plataforma pode estar para o lado
## Chance de cada tipo de plataforma (pesos relativos), no começo e no fim da subida.
const PESOS_DAS_PLATAFORMAS_NO_COMECO := {"fixa": 70.0, "movel": 15.0, "instavel": 10.0, "pula_pula": 5.0}
const PESOS_DAS_PLATAFORMAS_NO_FIM := {"fixa": 20.0, "movel": 30.0, "instavel": 40.0, "pula_pula": 10.0}
const VELOCIDADE_DA_PLATAFORMA_MOVEL_NO_COMECO := 1.5
const VELOCIDADE_DA_PLATAFORMA_MOVEL_NO_FIM := 3.5
## Chance (0 a 1), a cada plataforma nova, de aparecer um inimigo ou um item de poder.
const CHANCE_DE_INIMIGO_NO_COMECO := 0.03
const CHANCE_DE_INIMIGO_NO_FIM := 0.18
const VELOCIDADE_DO_INIMIGO_NO_COMECO := 2.0
const VELOCIDADE_DO_INIMIGO_NO_FIM := 4.5
const CHANCE_DE_ITEM_DE_PODER := 0.06
const ALTURA_DO_INIMIGO_ACIMA_DA_PLATAFORMA := 1.4
const ALTURA_DO_ITEM_ACIMA_DA_PLATAFORMA := 1.0
const MARGEM_DAS_PLATAFORMAS_NA_BORDA := 1.5  ## plataformas não nascem coladas na borda lateral
const ALCANCE_DA_GERACAO_ACIMA := 14.0       ## cria plataformas até esta distância acima da câmera
const DISTANCIA_PARA_APAGAR_ABAIXO := 12.0   ## apaga o que ficou esta distância abaixo da tela
const MARGEM_DA_QUEDA := 1.0                 ## Ícaro abaixo da borda de baixo da tela + isto = caiu

# --- Câmera (G-014) ---------------------------------------------------------------------
const CAMPO_DE_VISAO_DA_CAMERA := 55.0   ## graus, perspectiva
const DISTANCIA_DA_CAMERA := 14.0
const CAMERA_ACIMA_DE_ICARO := 3.0       ## a câmera mira um pouco acima de Ícaro
const SUAVIDADE_DA_CAMERA := 4.0

# --- Telas, fundos e cutscene -----------------------------------------------------------
const TEMPO_DA_TELA_PRETA := 0.4         ## ao cair (G-020) e ao trocar de tela
const TEMPO_DO_FADE_DO_FUNDO := 1.5      ## troca entre cenários (G-022)
const DURACAO_DA_CUTSCENE_FINAL := 6.0   ## G-019
