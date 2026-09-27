# Registro de decisões

Registro do grupo, recomeçado em 2026-09-25. O histórico anterior está no Git, no commit `8d19488` e
anteriores.

Rótulos: **DECIDIDO (grupo)** · **PENDENTE (grupo)** · **TÉCNICO (verificado)** — ver
[`GROUP-DECISIONS.md`](GROUP-DECISIONS.md).

Decisões novas entram no fim. Uma decisão não é reescrita: outra entrada a substitui e diz qual.

| ID | Data | Decisão | Status | Referência |
|---|---|---|---|---|
| G-001 | 2026-09-25 | Escopo do jogo aprovado pelo grupo, sujeito a alteração | **DECIDIDO (grupo)** | [`GROUP_SCOPE.md`](GROUP_SCOPE.md); o que ficou em aberto está em [`GROUP-DECISIONS.md`](GROUP-DECISIONS.md#pendente) |
| G-002 | 2026-09-25 | Engine e linguagem: **Godot 4 + GDScript**. Substitui só o trecho do documento de escopo que cita Python e "gamepy"; a transcrição em `GROUP_SCOPE.md` fica intacta | **DECIDIDO (grupo)**, por delegação: o grupo delegou a escolha da engine a um integrante | [justificativa abaixo](#g-002--godot-4--gdscript) |
| G-003 | 2026-09-25 | Infraestrutura: Git LFS para `*.blend`, `*.glb`, `*.png`, `*.wav` e `*.ogg`; repositório privado no GitHub, branch `main` | **TÉCNICO (verificado)** | `.gitattributes` |
| G-004 | 2026-09-25 | Elementos 3D: Ícaro, as plataformas e os inimigos são objetos 3D; os cenários de fundo são 2D. **Substitui** o trecho do documento original que descreve uma engine 2D em que o 3D só complementa o visual dos cenários | **DECIDIDO (grupo)**, pelo complemento | [`GROUP_SCOPE_COMPLEMENT.md`](GROUP_SCOPE_COMPLEMENT.md), "Elementos 3D" |
| G-005 | 2026-09-25 | Estrutura contínua: não há fases. Ícaro sobe sem parar e o cenário de fundo muda ao longo da subida (Terra/Creta, Cidade, Subida para o céu, Nuvens, Céu). **Substitui** as fases do documento original ("fases/temas", "quatro fases principais", "Quantidade de Fases") | **DECIDIDO (grupo)**, pelo complemento | [`GROUP_SCOPE_COMPLEMENT.md`](GROUP_SCOPE_COMPLEMENT.md), "Estrutura do jogo" |
| G-006 | 2026-09-25 | Final: não existe vitória. Ao chegar ao céu, o jogo termina com uma cutscene em que o sol derrete as asas e Ícaro cai. Derrota: Ícaro cai das plataformas durante a subida. **Substitui** a vitória do documento original ("Vitória: completar todos os cenários e fases") e a tela de vitória (em "Interfaces" e em "Programação"). O que aparece depois da cutscene continua **PENDENTE (grupo)** | **DECIDIDO (grupo)**, pelo complemento | [`GROUP_SCOPE_COMPLEMENT.md`](GROUP_SCOPE_COMPLEMENT.md), "Final" |
| G-007 | 2026-09-25 | "Jump de impulso": é uma plataforma do tipo pula-pula | **DECIDIDO (grupo)**, pelo complemento | [`GROUP_SCOPE_COMPLEMENT.md`](GROUP_SCOPE_COMPLEMENT.md), "Jump de impulso" |
| G-008 | 2026-09-25 | Flechas e inimigos: Ícaro atira flechas com o clique do mouse; inimigo atingido morre ou sai da tela. O que acontece quando um inimigo atinge Ícaro continua **PENDENTE (grupo)** | **DECIDIDO (grupo)**, pelo complemento | [`GROUP_SCOPE_COMPLEMENT.md`](GROUP_SCOPE_COMPLEMENT.md), "Flechas e inimigos" |
| G-009 | 2026-09-25 | Controles: A e D movem Ícaro para os lados; o salto é automático; o clique do mouse dispara as flechas | **DECIDIDO (grupo)**, pelo complemento | [`GROUP_SCOPE_COMPLEMENT.md`](GROUP_SCOPE_COMPLEMENT.md), "Controles" |
| G-010 | 2026-09-25 | Checkpoint: não há checkpoint; a partida dura até chegar ao fim ou perder | **DECIDIDO (grupo)**, pelo complemento | [`GROUP_SCOPE_COMPLEMENT.md`](GROUP_SCOPE_COMPLEMENT.md), "Checkpoint" |
| G-011 | 2026-09-25 | Organização: cada integrante trabalha em uma branch separada no Git, para não quebrar a `main`. Como as branches são juntadas na `main` (quem revisa e aprova) continua **PENDENTE (grupo)** | **DECIDIDO (grupo)**, pelo complemento | [`GROUP_SCOPE_COMPLEMENT.md`](GROUP_SCOPE_COMPLEMENT.md), "Organização" |
| G-012 | 2026-09-25 | Revisão de Pull Requests: Gabriel e Guilherme Falcucci revisam e aprovam os Pull Requests para a `main`. Os dois ficam com a Programação. Responde a parte de G-011 que continuava pendente (quem revisa e aprova). A divisão dos outros 4 integrantes continua **PENDENTE (grupo)** | **DECIDIDO (grupo)**, confirmado por Gabriel em 2026-09-25 | [`GROUP-DECISIONS.md`](GROUP-DECISIONS.md#2026-09-25--revisão-de-pull-requests-e-programação-g-012) |
| G-013 | 2026-09-25 | Divisão de tarefas: **Modelos 3D** (Blender) — Danilo e Luiz: Ícaro, plataformas (fixa, móvel, instável, pula-pula), inimigos e flecha. **Visual 2D** — Diogo e Gabriela: os 5 fundos, o desenho da tela inicial e da tela final, e os itens de poder. **Programação** (Godot) — Gabriel e Guilherme Falcucci: movimento e salto, plataformas, flechas e inimigos, câmera, score e derrota, troca dos fundos, telas e HUD, cutscene final. **Sons** — Gabriel. Responde a pendência "Divisão das tarefas por pessoa" do complemento e a parte de G-012 que continuava pendente | **DECIDIDO (grupo)**, confirmado por Gabriel em 2026-09-25 | [abaixo](#g-013-a-g-024--decisões-finais-do-grupo) |
| G-014 | 2026-09-25 | Câmera em perspectiva | **DECIDIDO (grupo)**, confirmado por Gabriel em 2026-09-25 | [abaixo](#g-013-a-g-024--decisões-finais-do-grupo) |
| G-015 | 2026-09-25 | Modelos 3D: exportados do Blender em `.glb` (File → Export → glTF 2.0, formato `.glb`); nome em minúsculo e sem espaço (ex.: `icaro.glb`); escala real, 1 unidade = 1 metro | **DECIDIDO (grupo)**, confirmado por Gabriel em 2026-09-25 | [abaixo](#g-013-a-g-024--decisões-finais-do-grupo) |
| G-016 | 2026-09-25 | Duração da partida: sem limite de tempo. A partida dura até chegar ao céu ou cair | **DECIDIDO (grupo)**, confirmado por Gabriel em 2026-09-25 | [abaixo](#g-013-a-g-024--decisões-finais-do-grupo) |
| G-017 | 2026-09-25 | Poderes temporários: exatamente três — **velocidade** (Ícaro se move mais rápido para os lados), **pulo alto** (o salto fica mais alto) e **escudo** (o próximo inimigo que encostar em Ícaro não causa dano; o escudo some ao ser usado ou quando o tempo acaba). Os itens de poder são 2D. A duração de cada poder é ajuste da Programação em teste. **Substitui** os "outros bônus" do documento original | **DECIDIDO (grupo)**, confirmado por Gabriel em 2026-09-25 | [abaixo](#g-013-a-g-024--decisões-finais-do-grupo) |
| G-018 | 2026-09-25 | Inimigo encosta em Ícaro: Ícaro perde pontos do score, é empurrado para baixo e fica invulnerável por um instante (piscando). Não há barra de vida. Os valores de pontos e de tempo são ajuste da Programação em teste. Completa G-008 | **DECIDIDO (grupo)**, confirmado por Gabriel em 2026-09-25 | [abaixo](#g-013-a-g-024--decisões-finais-do-grupo) |
| G-019 | 2026-09-25 | Final: cutscene final de Ícaro caindo de costas com as asas queimando, depois os créditos e o score do jogador. O final expressa a lição do mito (a arrogância leva à queda); não é vitória. Responde a pendência "O que aparece depois da cutscene final" de G-006 | **DECIDIDO (grupo)**, confirmado por Gabriel em 2026-09-25 | [abaixo](#g-013-a-g-024--decisões-finais-do-grupo) |
| G-020 | 2026-09-25 | Cair durante a subida: tela preta e a partida reinicia. Não existe tela de derrota desenhada. **Substitui** a tela de derrota do documento original ("telas de vitória e derrota", em "Interfaces") | **DECIDIDO (grupo)**, confirmado por Gabriel em 2026-09-25 | [abaixo](#g-013-a-g-024--decisões-finais-do-grupo) |
| G-021 | 2026-09-26 | Estilo visual: low poly cartoon, com referência no Mario antigo (estilo Mario 64): formas simples, cores fortes e saturadas, texturas simples. A referência é só de estilo: nenhum personagem, modelo ou textura da Nintendo entra no jogo | **DECIDIDO (grupo)**, confirmado por Gabriel em 2026-09-26 | [abaixo](#g-013-a-g-024--decisões-finais-do-grupo) |
| G-022 | 2026-09-26 | Fundos 2D: 1920×1080, em PNG, uma imagem por cenário (5 no total); a troca entre cenários é com fade. A janela do jogo é 1920×1080 (16:9), decisão da Programação; ela é configurada no projeto quando a Programação começar | **DECIDIDO (grupo)**, confirmado por Gabriel em 2026-09-26 | [abaixo](#g-013-a-g-024--decisões-finais-do-grupo) |
| G-023 | 2026-09-26 | Animações de Ícaro (asas, queda de costas) e da plataforma quebrando: equipe de Modelos 3D (Danilo e Luiz) | **DECIDIDO (grupo)**, confirmado por Gabriel em 2026-09-26 | [abaixo](#g-013-a-g-024--decisões-finais-do-grupo) |
| G-024 | 2026-09-26 | Sons: produzidos por Gabriel no FL Studio. São autorais, sem licença de terceiros | **DECIDIDO (grupo)**, confirmado por Gabriel em 2026-09-26 | [abaixo](#g-013-a-g-024--decisões-finais-do-grupo) |

## G-002 — Godot 4 + GDScript

O documento de escopo cita Python e uma engine "gamepy", que não existe com esse nome. O grupo
delegou a escolha da engine, e a escolha foi Godot 4 com GDScript, pelos motivos abaixo.

- **A disciplina exige elementos 3D, não uma linguagem.** Trocar Python por outra linguagem não
  descumpre nenhum requisito; deixar o 3D de fora descumpriria.
- **O 3D é parte real do jogo.** O Godot importa os modelos feitos no Blender e combina 3D e 2D na
  mesma cena. Os elementos 3D entram no jogo como modelos, não como imagens pré-renderizadas.
- **A maior parte do escopo já vem pronta na engine:** física de plataforma e salto, plataformas
  móveis e que quebram, parallax para os cinco cenários, telas e HUD, animações e sons.
- **GDScript é a linguagem nativa do Godot**, a mais integrada ao editor e a mais documentada, com
  sintaxe próxima da de Python.
- **Godot é gratuito e open source**, e os arquivos de projeto (cenas, recursos, configuração) são
  texto, o que funciona bem no Git com vários integrantes.

**Versão do projeto: Godot 4.7.2** (fixada em 2026-09-25). Todos os integrantes usam essa mesma
versão, porque o formato dos arquivos do projeto muda entre versões 4.x. O projeto base foi
validado nela sem janela (`--import`, `--quit` e `--check-only`, todos com código 0).

Quando esta decisão foi registrada, continuava **PENDENTE (grupo)** como os elementos 3D entram
no jogo; a decisão de engine não responde essa pergunta. O grupo a respondeu depois, em G-004.

**Nota (2026-09-25):** o documento do grupo agora também registra esta decisão. O complemento
([`GROUP_SCOPE_COMPLEMENT.md`](GROUP_SCOPE_COMPLEMENT.md), "Engine e linguagem") diz: Godot 4,
versão 4.7.2 para todos, com GDScript, no lugar do "gamepy" e do Python; os modelos 3D continuam
no Blender. A pendência sobre o 3D citada acima foi respondida em G-004.

## G-004 a G-011 — complemento do grupo

Em 2026-09-25 o grupo respondeu às pendências de [`GROUP-DECISIONS.md`](GROUP-DECISIONS.md) num
complemento ao documento de escopo, no mesmo Google Doc. Um integrante escreveu as respostas no
grupo e todos concordaram. A transcrição fiel está em
[`GROUP_SCOPE_COMPLEMENT.md`](GROUP_SCOPE_COMPLEMENT.md); a de `GROUP_SCOPE.md` fica intacta.

O complemento diz que, onde houver diferença, vale ele. Os trechos do documento original que ele
substitui:

| Documento original | Substituído por |
|---|---|
| engine 2D; o 3D complementa o visual dos cenários | G-004 — Ícaro, plataformas e inimigos em 3D; fundos em 2D |
| fases ("fases/temas", "quatro fases principais", "Quantidade de Fases") | G-005 — não há fases; o jogo é contínuo e o fundo muda ao longo da subida |
| "Vitória: completar todos os cenários e fases, alcançando o céu" | G-006 — não existe vitória; ao chegar ao céu, cutscene da queda |
| tela de vitória ("Interfaces"; "mostra a tela de vitória", em "Programação") | G-006 — o jogo termina com a cutscene; o que aparece depois é pendente |

## G-013 a G-024 — decisões finais do grupo

Confirmadas por Gabriel: G-013 a G-020 em 2026-09-25, G-021 a G-024 em 2026-09-26. O texto
consolidado do grupo está no Google Doc "Guia 1 — Icarus", que não foi transcrito aqui. Com elas,
as pendências do complemento e as de G-006, G-008, G-011 e G-012 ficam respondidas; a única que
sobra está em [`GROUP-DECISIONS.md`](GROUP-DECISIONS.md#pendente).

Os trechos anteriores que elas substituem ou completam:

| Antes | Agora |
|---|---|
| "outros bônus" nos poderes temporários (documento original) | G-017 — exatamente três poderes: velocidade, pulo alto e escudo |
| tela de derrota ("telas de vitória e derrota", em "Interfaces") | G-020 — tela preta e reinício; não existe tela de derrota desenhada |
| G-006 — o que aparece depois da cutscene final era pendente | G-019 — créditos e o score do jogador |
| G-008 — o que acontece quando um inimigo atinge Ícaro era pendente | G-018 — perde pontos, é empurrado para baixo e fica invulnerável por um instante |
| G-012 — a divisão dos outros 4 integrantes era pendente | G-013 — Modelos 3D, Visual 2D, Programação e Sons |

Valores de tempo e de pontos (duração dos poderes, pontos perdidos, tempo de invulnerabilidade)
são ajuste da Programação em teste e não entram neste registro.
