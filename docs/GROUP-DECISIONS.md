# Decisões do grupo

O que o grupo já decidiu e o que ainda está em aberto. A fonte do escopo é
[`GROUP_SCOPE.md`](GROUP_SCOPE.md) com o complemento
[`GROUP_SCOPE_COMPLEMENT.md`](GROUP_SCOPE_COMPLEMENT.md), que vale onde os dois diferem; o registro
das decisões, em ordem e com os motivos, está em [`DECISIONS.md`](DECISIONS.md).

| Rótulo | Significado |
|---|---|
| **DECIDIDO (grupo)** | decidido pelo grupo, diretamente ou por delegação |
| **PENDENTE (grupo)** | ainda depende de discussão e decisão do grupo |
| **TÉCNICO (verificado)** | fato técnico verificado no repositório; não decide nada de design |

Regras:

1. Só entra em **Decidido** o que o grupo decidiu, com data.
2. Nada é preenchido por suposição: um campo sem resposta fica em branco.
3. Quando o documento do grupo é ambíguo ou contraditório, o ponto vira pendência, não resposta.

## Decidido

### 2026-09-25 — escopo do jogo (G-001)

Fonte: [`GROUP_SCOPE.md`](GROUP_SCOPE.md). Sujeito a alteração. Entra aqui só o que o documento
afirma sem ambiguidade, já com o que o complemento (G-004 a G-011) e as decisões finais (G-013 a
G-024) substituíram.

- jogo de subida vertical por plataformas até o céu
- derrota ao cair. A vitória ao atingir a altura final foi **substituída**: não existe vitória
  (G-006)
- salto automático
- plataformas fixas, móveis e instáveis (que quebram)
- poderes temporários: exatamente três, velocidade, pulo alto e escudo (G-017)
- score pela altura alcançada
- obstáculos e desafios cada vez mais difíceis
- cenários de fundo de Terra (Creta) até o Céu. As fases do documento original foram
  **substituídas**: não há fases, o jogo é contínuo (G-005)
- telas: inicial e HUD. A tela de vitória foi **substituída** pela cutscene final (G-006); a tela
  de derrota foi **substituída** por tela preta e reinício (G-020); as "interfaces específicas por
  fase" do documento original ficaram sem fases a que se referir (G-005)
- animações: quebra das plataformas, quebra das asas, queda de Ícaro ao errar um salto, efeitos de
  poder temporário
- sons: plataformas quebrando, pulo, poderes especiais, movimento das asas
- o trabalho se divide em três áreas: Arte, Programação e Design. A divisão por pessoa está em
  G-013

### 2026-09-25 — engine e linguagem (G-002)

- **Godot 4 + GDScript**, por delegação do grupo, versão **4.7.2** para todos. Substitui o trecho
  do documento de escopo que cita Python e "gamepy". Justificativa em
  [`DECISIONS.md`](DECISIONS.md#g-002--godot-4--gdscript). O complemento do grupo agora também
  registra essa decisão; os modelos 3D continuam no Blender.

### 2026-09-25 — complemento do grupo (G-004 a G-011)

Fonte: [`GROUP_SCOPE_COMPLEMENT.md`](GROUP_SCOPE_COMPLEMENT.md). Onde difere do documento
original, vale o complemento.

- **3D (G-004):** Ícaro, as plataformas e os inimigos são objetos 3D; os cenários de fundo são 2D
- **estrutura contínua (G-005):** não há fases; Ícaro sobe sem parar e o cenário de fundo muda ao
  longo da subida: Terra/Creta, Cidade, Subida para o céu, Nuvens, Céu
- **final (G-006):** não existe vitória; ao chegar ao céu, o jogo termina com uma cutscene em que
  o sol derrete as asas e Ícaro cai. Derrota: Ícaro cai das plataformas durante a subida
- **jump de impulso (G-007):** é uma plataforma do tipo pula-pula
- **flechas e inimigos (G-008):** Ícaro atira flechas com o clique do mouse; inimigo atingido
  morre ou sai da tela
- **controles (G-009):** A e D movem Ícaro para os lados; o salto é automático; o clique do mouse
  dispara as flechas
- **checkpoint (G-010):** não há checkpoint; a partida dura até chegar ao fim ou perder
- **organização (G-011):** cada integrante trabalha em uma branch separada no Git, para não quebrar
  a `main`

### 2026-09-25 — revisão de Pull Requests e Programação (G-012)

Confirmado por Gabriel em 2026-09-25.

- **revisão e aprovação:** Gabriel e Guilherme Falcucci revisam e aprovam os Pull Requests para a
  `main`. Responde a pendência "como as branches são juntadas na `main`" do complemento
- **Programação:** fica com Gabriel e Guilherme Falcucci. A divisão dos outros 4 integrantes
  ficou para G-013

### 2026-09-25 — decisões finais (G-013 a G-020)

Confirmado por Gabriel em 2026-09-25. O texto consolidado do grupo está no Google Doc "Guia 1 —
Icarus".

- **divisão de tarefas (G-013):**

  | Equipe | Quem | O quê |
  |---|---|---|
  | Modelos 3D (Blender) | Danilo e Luiz | Ícaro, plataformas (fixa, móvel, instável, pula-pula), inimigos, flecha |
  | Visual 2D | Diogo e Gabriela | os 5 fundos, o desenho da tela inicial e da tela final, os itens de poder |
  | Programação (Godot) | Gabriel e Guilherme Falcucci | movimento e salto, plataformas, flechas e inimigos, câmera, score e derrota, troca dos fundos, telas e HUD, cutscene final |
  | Sons | Gabriel | os sons do jogo (G-024) |

- **câmera (G-014):** perspectiva
- **modelos 3D (G-015):** exportados do Blender em `.glb` (File → Export → glTF 2.0, formato
  `.glb`); nome em minúsculo e sem espaço (ex.: `icaro.glb`); escala real, 1 unidade = 1 metro
- **duração (G-016):** sem limite de tempo; a partida dura até chegar ao céu ou cair
- **poderes temporários (G-017):** exatamente três. **Velocidade**: Ícaro se move mais rápido para
  os lados. **Pulo alto**: o salto fica mais alto. **Escudo**: o próximo inimigo que encostar em
  Ícaro não causa dano; o escudo some ao ser usado ou quando o tempo acaba. Os itens de poder são
  2D. A duração de cada poder é ajuste da Programação em teste
- **inimigo encosta em Ícaro (G-018):** Ícaro perde pontos do score, é empurrado para baixo e fica
  invulnerável por um instante (piscando). Não há barra de vida. Pontos e tempo são ajuste da
  Programação em teste
- **final (G-019):** cutscene final de Ícaro caindo de costas com as asas queimando, depois os
  créditos e o score do jogador. O final expressa a lição do mito (a arrogância leva à queda); não
  é vitória
- **cair (G-020):** tela preta e a partida reinicia. Não existe tela de derrota desenhada

### 2026-09-26 — estilo e assets (G-021 a G-024)

Confirmado por Gabriel em 2026-09-26.

- **estilo visual (G-021):** low poly cartoon, com referência no Mario antigo (estilo Mario 64):
  formas simples, cores fortes e saturadas, texturas simples. A referência é só de estilo: nenhum
  personagem, modelo ou textura da Nintendo entra no jogo
- **fundos e janela (G-022):** um fundo 2D por cenário (5 no total), em PNG, 1920×1080; a troca
  entre cenários é com fade. A janela do jogo é 1920×1080 (16:9), decisão da Programação
- **animações (G-023):** as de Ícaro (asas, queda de costas) e a da plataforma quebrando ficam com
  a equipe de Modelos 3D (Danilo e Luiz)
- **sons (G-024):** produzidos por Gabriel no FL Studio; autorais, sem licença de terceiros

### Pendências anteriores resolvidas

| Pendência anterior | Resolução |
|---|---|
| engine | Godot 4 + GDScript (G-002) |
| versão exata do Godot para todos | 4.7.2 (G-002) |
| fases × cenários | não há fases; 5 cenários de fundo ao longo da subida (G-005) |
| final: cutscene ou derrota | cutscene; não existe vitória (G-006) |
| "jump de impulso" | plataforma pula-pula (G-007) |
| flechas e inimigos | G-008; o dano a Ícaro em G-018 |
| checkpoints e controles | G-010 e G-009; duração e poderes em G-016 e G-017 |
| como os elementos 3D entram no jogo | G-004 |
| modelo de branches | uma branch por integrante (G-011) |
| como as branches são juntadas na `main` (quem revisa e aprova) | Gabriel e Guilherme Falcucci (G-012) |
| divisão das tarefas por pessoa | Modelos 3D, Visual 2D, Programação e Sons (G-013) |
| duração da partida | sem limite de tempo (G-016) |
| quais são os poderes temporários | velocidade, pulo alto e escudo (G-017) |
| o que aparece depois da cutscene final | créditos e o score do jogador (G-019) |
| o que acontece quando um inimigo atinge Ícaro | perde pontos, é empurrado para baixo e fica invulnerável por um instante (G-018) |
| câmera | perspectiva (G-014) |
| formato do modelo 3D | `.glb` (G-015) |

## Pendente

1. [ ] **Inimigos: tipo, quantidade e movimento** — decide a equipe de Modelos 3D (Danilo e Luiz).
   O que acontece quando um inimigo encosta em Ícaro já está decidido (G-018).

## Para levar ao grupo

Pontos técnicos de organização que o grupo ainda não discutiu. Não são decisões nem pendências
registradas pelo grupo; ficam aqui para não se perderem.

- licença do repositório
- colaboradores do GitHub e permissões
- proteção da `main` no GitHub (quem aprova já está definido em G-012)
- CI (validação automática no GitHub)
- padrão de mensagens de commit
- versão do Blender usada pelo grupo
- como evitar conflito em arquivo binário (`.blend` não tem merge) e em cenas `.tscn` editadas
  por duas pessoas ao mesmo tempo
- apoio a quem tem pouca experiência com Git (um guia inicial está em
  [`COMO-COMECAR.md`](COMO-COMECAR.md))
- entregáveis e cronograma

## Próxima reunião

| Campo | Valor |
|---|---|
| Data | |
| Participantes | |
| Pauta | |
| Decisões tomadas | |
