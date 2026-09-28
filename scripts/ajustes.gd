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
const TEMPO_SEM_QUIQUE_DEPOIS_DO_DANO := 0.3   ## Ícaro atravessa as plataformas, sem quicar

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
const TEMPO_DA_TELA_PRETA := 0.4         ## escurecer e clarear ao trocar de tela (a queda usa TEMPO_DA_TELA_PRETA_AO_CAIR)
const TEMPO_DO_FADE_DO_FUNDO := 1.5      ## troca entre cenários (G-022)
const DURACAO_DA_CUTSCENE_FINAL := 6.0   ## G-019; tempo de jogo: com a câmera lenta, dura DURACAO / CAMERA_LENTA_NA_CUTSCENE segundos reais, mais a frase final


# =======================================================================================
# APRESENTAÇÃO E META — provisório da Programação (branch feat/vibe-indie)
# Nada daqui muda regra do grupo (G-001 a G-024). Cada camada tem liga/desliga: true liga,
# false desliga. Onde cada efeito fica no código: docs/ARQUITETURA.md.
# =======================================================================================

# --- Acessibilidade ---------------------------------------------------------------------
const REDUZIR_TREMOR_DE_TELA := false    ## true = tremor bem mais fraco
const REDUZIR_FLASHES := false           ## true = sem clarões fortes (dano, sol na cutscene)
const FATOR_DO_TREMOR_REDUZIDO := 0.3    ## multiplica o tremor quando REDUZIR_TREMOR_DE_TELA
const FATOR_DOS_FLASHES_REDUZIDOS := 0.3  ## multiplica os clarões quando REDUZIR_FLASHES

# --- Identidade visual ------------------------------------------------------------------
const TOON_E_CONTORNO := true            ## sombreamento em faixas + contorno escuro nos objetos 3D
const FAIXAS_DE_SOMBRA := 3.0
const SOMBRA_MINIMA := 0.42              ## brilho da faixa mais escura (0 = preto, 1 = sem sombra)
const BORDA_DE_LUZ := 0.22               ## luz na borda dos objetos (rim), para separar do fundo
const ESPESSURA_DO_CONTORNO := 0.035     ## metros
const COR_DO_CONTORNO := Color(0.13, 0.05, 0.16)
const PALETA_POR_CENARIO := true         ## fundo em degradê, luz, névoa, saturação e contraste mudam por cenário
const LUZ_ESQUENTA_NA_SUBIDA := true     ## o sol fica mais quente e forte perto do céu
const ENERGIA_DA_LUZ_NO_CHAO := 1.0
const ENERGIA_DA_LUZ_NO_CEU := 1.7
const BLOOM_PERTO_DO_CEU := true
const BLOOM_COMECA_EM := 0.6             ## fração da subida (0 a 1) em que o brilho começa
const BLOOM_NO_CEU := 1.2
const VINHETA := true
const FORCA_DA_VINHETA := 0.35
const PARTICULAS_AMBIENTE := true        ## poeira, pó e nuvenzinhas ao fundo, sem colisão
const QUANTIDADE_DE_PARTICULAS_AMBIENTE := 40

## Paleta de cada cenário, na ordem: Terra (Creta), Cidade, Subida para o céu, Nuvens, Céu.
## Fundo provisório em degradê (em cima / embaixo), luz, névoa, partículas e saturação.
const FUNDO_EM_CIMA := [Color(0.35, 0.75, 1.0), Color(0.55, 0.6, 0.95), Color(0.3, 0.55, 1.0), Color(0.5, 0.72, 1.0), Color(0.22, 0.4, 0.95)]
const FUNDO_EMBAIXO := [Color(1.0, 0.85, 0.55), Color(1.0, 0.7, 0.55), Color(0.75, 0.9, 1.0), Color(1.0, 1.0, 1.0), Color(1.0, 0.72, 0.28)]
const COR_DA_LUZ := [Color(1.0, 0.96, 0.88), Color(1.0, 0.9, 0.8), Color(1.0, 0.92, 0.75), Color(1.0, 0.88, 0.65), Color(1.0, 0.75, 0.45)]
const COR_DA_NEVOA := [Color(1.0, 0.85, 0.6), Color(0.85, 0.75, 0.9), Color(0.7, 0.85, 1.0), Color(1.0, 1.0, 1.0), Color(1.0, 0.85, 0.5)]
const COR_DAS_PARTICULAS := [Color(0.85, 0.65, 0.35, 0.5), Color(0.9, 0.85, 0.8, 0.45), Color(1.0, 1.0, 1.0, 0.5), Color(1.0, 1.0, 1.0, 0.7), Color(1.0, 0.9, 0.5, 0.6)]
const SATURACAO := [1.15, 1.1, 1.15, 1.05, 1.25]
const CONTRASTE := [1.05, 1.1, 1.0, 0.95, 1.1]
## Cor lisa de cada fundo quando PALETA_POR_CENARIO = false (o fundo do protótipo base).
const CORES_SEM_PALETA := [Color(0.85, 0.65, 0.35), Color(0.6, 0.62, 0.7), Color(0.45, 0.7, 0.95), Color(0.8, 0.9, 1.0), Color(0.35, 0.55, 1.0)]
const DENSIDADE_DA_NEVOA := 0.005

# --- Game feel: Ícaro -------------------------------------------------------------------
const SQUASH_E_STRETCH := true
const ESTICAR_NO_SALTO := 1.25           ## escala vertical no salto (1 = sem efeito)
const AMASSAR_NO_POUSO := 0.72
const INCLINACAO_E_VIRADA := true
const INCLINACAO_MAXIMA := 0.35          ## radianos para o lado em que anda
const VIRADA_MAXIMA := 0.6               ## radianos: vira o corpo para o lado em que anda
const RASTRO_NA_VELOCIDADE := true
const AURA_DO_PODER := true
const ANIMACAO_DO_INIMIGO := true        ## o inimigo genérico balança e inclina (sem mudar a colisão)

# --- Game feel: plataformas -------------------------------------------------------------
const POEIRA_NO_POUSO := true
const PLATAFORMA_AFUNDA := true
const QUANTO_A_PLATAFORMA_AFUNDA := 0.15
const BOING_DO_PULA_PULA := true
const INSTAVEL_TREME_E_QUEBRA := true
const TREMIDA_DA_INSTAVEL := 0.06        ## metros

# --- Game feel: câmera ------------------------------------------------------------------
const TREMOR_DE_TELA := true
const TRAUMA_NO_DANO := 0.55             ## 0 a 1; o tremor é trauma², com ruído, e o trauma cai
const TRAUMA_NA_QUEBRA := 0.25
const QUEDA_DO_TRAUMA := 1.6             ## quanto trauma some por segundo
const TREMOR_MAXIMO := 0.5               ## metros de deslocamento com trauma 1
const ANTECIPACAO_DA_CAMERA := true
const ANTECIPACAO := 0.18                ## segundos de subida que a câmera olha à frente
const SUAVIDADE_DA_ANTECIPACAO := 6.0    ## a antecipação só desloca a imagem; não muda a altura usada para decidir a queda
const FREQUENCIA_DO_TREMOR := 2.5
const SUAVIDADE_DO_FOV := 8.0
const FOV_NO_IMPULSO := true
const FOV_EXTRA_NO_PULA_PULA := 6.0      ## graus, some aos poucos
const FOV_EXTRA_NA_VELOCIDADE := 4.0     ## graus, enquanto o poder de velocidade durar
const QUEDA_DO_FOV_EXTRA := 10.0         ## graus por segundo

# --- Game feel: combate, dano e poderes -------------------------------------------------
const RASTRO_NA_FLECHA := true
const HIT_STOP := true
const DURACAO_DO_HIT_STOP := 0.06        ## segundos quase parados quando a flecha acerta
const ESCALA_DO_TEMPO_NO_HIT_STOP := 0.05
const ESTOURO_DO_INIMIGO := true
const FLASH_DE_DANO := true
const FORCA_DO_FLASH_DE_DANO := 0.85     ## 0 a 1
const NUMERO_FLUTUANTE := true           ## "-50" subindo quando Ícaro perde pontos
const POP_NA_COLETA := true
const BARRA_DO_PODER := true

# --- Vontade de jogar de novo -----------------------------------------------------------
const RECORDE := true                    ## salva e mostra recorde de score e de altura
const MARCAS_DE_ALTURA := true           ## linha no cenário na altura do recorde e da partida anterior
const DISTANCIA_MINIMA_ENTRE_MARCAS := 2.0  ## metros: a marca da anterior só aparece se estiver longe da do recorde
const FAIXA_DO_CENARIO := true           ## nome do cenário ao entrar nele
const TEMPO_DA_FAIXA_DO_CENARIO := 2.4
const TEMPO_DO_AVISO := 1.4              ## "Novo recorde!" e a frase perto do sol
const AVISO_DE_NOVO_RECORDE := true
const TEXTO_NA_TELA_PRETA := true        ## PROVISÓRIO, para o grupo aprovar: altura e recorde ao cair
const TEMPO_DO_TEXTO_NA_TELA_PRETA := 0.55
const TEMPO_DO_FADE_DO_TEXTO := 0.1
const TEMPO_DA_TELA_PRETA_AO_CAIR := 0.2 ## escurecer e clarear no reinício (a troca de tela usa TEMPO_DA_TELA_PRETA)

# --- Interface e texto ------------------------------------------------------------------
const FRASES := true                     ## frases curtas do mito (texto em scripts/textos.gd)
const CONTAGEM_DO_SCORE := true
const RAPIDEZ_DA_CONTAGEM := 8.0
const CREDITOS_ROLANDO := true
const VELOCIDADE_DOS_CREDITOS := 60.0    ## pixels por segundo
const BOTOES_VIVOS := true               ## botão cresce ao passar o mouse
const TELA_INICIAL_ANIMADA := true       ## título e Ícaro se mexendo na tela inicial
const MUSICA := true                     ## música tema em loop (assets/audio/musica_tema.ogg)
const VOLUME_DA_MUSICA := 0.0            ## em dB; 0 = volume do arquivo, negativo abaixa
const FRACAO_PERTO_DO_SOL := 0.9         ## fração da subida em que aparece a frase "perto do sol"

# --- Cutscene final ---------------------------------------------------------------------
const CAMERA_LENTA_NA_CUTSCENE := 0.55   ## velocidade da queda (1 = normal)
const CLARAO_DO_SOL := true
const FORCA_DO_CLARAO := 0.9             ## 0 a 1
const CAMERA_ACOMPANHA_A_QUEDA := true
const SUAVIDADE_DA_CAMERA_DA_CUTSCENE := 2.5
const SOL_CRESCE_NA_CUTSCENE := true
const TEMPO_DA_FRASE_FINAL := 2.5
