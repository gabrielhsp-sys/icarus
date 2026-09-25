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
afirma sem ambiguidade, já com o que o complemento (G-004 a G-011) substituiu.

- jogo de subida vertical por plataformas até o céu
- derrota ao cair. A vitória ao atingir a altura final foi **substituída**: não existe vitória
  (G-006)
- salto automático
- plataformas fixas, móveis e instáveis (que quebram)
- poderes temporários, incluindo velocidade e altura de salto; a lista final é pendente
- score pela altura alcançada
- obstáculos e desafios cada vez mais difíceis
- cenários de fundo de Terra (Creta) até o Céu. As fases do documento original foram
  **substituídas**: não há fases, o jogo é contínuo (G-005)
- telas: inicial, HUD e derrota. A tela de vitória foi **substituída** pela cutscene final
  (G-006); as "interfaces específicas por fase" do documento original ficaram sem fases a que se
  referir (G-005)
- animações: quebra das plataformas, quebra das asas, queda de Ícaro ao errar um salto, efeitos de
  poder temporário
- sons: plataformas quebrando, pulo, poderes especiais, movimento das asas
- o trabalho se divide em três áreas: Arte, Programação e Design; quem faz cada uma é pendente

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

### Pendências anteriores resolvidas

| Pendência anterior | Resolução |
|---|---|
| engine | Godot 4 + GDScript (G-002) |
| versão exata do Godot para todos | 4.7.2 (G-002) |
| fases × cenários | não há fases; 5 cenários de fundo ao longo da subida (G-005) |
| final: cutscene ou derrota | cutscene; não existe vitória (G-006) |
| "jump de impulso" | plataforma pula-pula (G-007) |
| flechas e inimigos | G-008; o dano a Ícaro continua pendente (item 5 abaixo) |
| checkpoints e controles | G-010 e G-009; duração e poderes continuam pendentes (itens 2 e 3) |
| como os elementos 3D entram no jogo | G-004 |
| modelo de branches | uma branch por integrante (G-011); o merge na `main` continua pendente (item 6) |

## Pendente

O que o próprio grupo listou como "Ainda em aberto" no complemento:

1. [ ] **Divisão das tarefas por pessoa.**
2. [ ] **Duração da partida.**
3. [ ] **Quais são os poderes temporários.**
4. [ ] **O que aparece depois da cutscene final** (ex.: tela com o score).
5. [ ] **O que acontece quando um inimigo atinge Ícaro.**
6. [ ] **Como as branches são juntadas na `main`** (quem revisa e aprova).

## Para levar ao grupo

Pontos técnicos de organização que o grupo ainda não discutiu. Não são decisões nem pendências
registradas pelo grupo; ficam aqui para não se perderem.

- licença do repositório
- colaboradores do GitHub e permissões
- proteção da `main` no GitHub (depende do item 6 acima)
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
