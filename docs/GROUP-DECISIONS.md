# Decisões do grupo

O que o grupo já decidiu e o que ainda está em aberto. A fonte do escopo é
[`GROUP_SCOPE.md`](GROUP_SCOPE.md); o registro cronológico das decisões está em
[`DECISIONS.md`](DECISIONS.md).

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
afirma sem ambiguidade.

- jogo de subida vertical por plataformas até o céu
- derrota ao cair; vitória ao atingir a altura final
- salto automático
- plataformas fixas, móveis e instáveis (que quebram)
- poderes temporários, incluindo velocidade e altura de salto
- score pela altura alcançada
- progressão temática de Terra (Creta) até o Céu, com dificuldade crescente
- o jogo tem elementos 3D modelados no Blender; o documento descreve uma base 2D em que o 3D
  complementa o visual dos cenários. Como o 3D entra no jogo é a pendência 7
- telas: inicial, por fase, HUD, vitória e derrota
- animações: quebra das plataformas, quebra das asas, queda de Ícaro ao errar um salto, efeitos de
  poder temporário
- sons: plataformas quebrando, pulo, poderes especiais, movimento das asas
- flechas e inimigos estão no escopo; o comportamento deles é a pendência 4
- o trabalho se divide em três áreas: Arte, Programação e Design; quem faz cada uma é a pendência 5

### 2026-09-25 — engine e linguagem (G-002)

- **Godot 4 + GDScript**, por delegação do grupo. Substitui o trecho do documento de escopo que
  cita Python e "gamepy". Justificativa em [`DECISIONS.md`](DECISIONS.md#g-002--godot-4--gdscript).

## Pendente

1. [ ] **Fases × cenários**: o documento cita 5 temas, "quatro fases principais" e 5 cenários de
       fundo. Quantas fases existem? Fase e cenário são a mesma coisa?
2. [ ] **Final**: a queda de Ícaro pelo sol é uma cutscene depois da vitória ou é uma derrota?
3. [ ] **"Jump de impulso"**: o que é, e como convive com o salto automático?
4. [ ] **Flechas e inimigos**: quem dispara, contra quem, e como isso afeta vitória e derrota?
5. [ ] **Divisão por pessoa**: quem faz Arte, Programação e Design.
6. [ ] **Checkpoints, duração, poderes e controles**: o documento não trata; falta a lista final de
       poderes e o esquema de controles.
7. [ ] **Como os elementos 3D entram no jogo**: personagem e plataformas em 3D com câmera lateral,
       ou 3D só nos cenários?

Resolvida: **engine** — Godot 4 + GDScript (G-002, 2026-09-25).

### Organização do trabalho — pendente

- [ ] licença do repositório
- [ ] colaboradores do GitHub e permissões
- [ ] modelo de branches; proteção da `main`; pull request e revisão obrigatórios
- [ ] CI (validação automática no GitHub)
- [ ] padrão de mensagens de commit
- [ ] versão exata do Godot 4 usada por todos (o formato dos arquivos muda entre versões 4.x)
- [ ] versão do Blender usada pelo grupo
- [ ] como evitar conflito em arquivo binário (`.blend` não tem merge) e em cenas `.tscn` editadas
      por duas pessoas ao mesmo tempo
- [ ] apoio a quem tem pouca experiência com Git
- [ ] entregáveis e cronograma

## Próxima reunião

| Campo | Valor |
|---|---|
| Data | |
| Participantes | |
| Pauta | |
| Decisões tomadas | |
