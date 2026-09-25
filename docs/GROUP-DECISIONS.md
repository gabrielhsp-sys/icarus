# Decisões do grupo

O que o grupo já decidiu e o que ainda está em aberto. A fonte do escopo é
[`GROUP_SCOPE.md`](GROUP_SCOPE.md); o registro cronológico das decisões está em
[`DECISIONS.md`](DECISIONS.md).

| Rótulo | Significado |
|---|---|
| **DECIDIDO (grupo)** | decidido pelo grupo |
| **PENDENTE (grupo)** | ainda depende de discussão e decisão do grupo |
| **TÉCNICO (verificado)** | fato técnico verificado no repositório; não decide nada de design |

Regras:

1. Só entra em **Decidido** o que o grupo decidiu, com data.
2. Nada é preenchido por suposição: um campo sem resposta fica em branco.
3. Quando o documento do grupo é ambíguo ou contraditório, o ponto vira pendência, não resposta.

## Decidido

### 2026-09-25 — escopo do jogo

Fonte: [`GROUP_SCOPE.md`](GROUP_SCOPE.md). Sujeito a alteração. Entra aqui só o que o documento
afirma sem ambiguidade.

- jogo de subida vertical por plataformas até o céu
- derrota ao cair; vitória ao atingir a altura final
- salto automático
- plataformas fixas, móveis e instáveis (que quebram)
- poderes temporários, incluindo velocidade e altura de salto
- score pela altura alcançada
- progressão temática de Terra (Creta) até o Céu, com dificuldade crescente
- Python na lógica do jogo; Blender nos elementos 3D; base 2D com elementos 3D
- telas: inicial, por fase, HUD, vitória e derrota
- animações: quebra das plataformas, quebra das asas, queda de Ícaro ao errar um salto, efeitos de
  poder temporário
- sons: plataformas quebrando, pulo, poderes especiais, movimento das asas
- flechas e inimigos estão no escopo; o comportamento deles é a pendência 5
- o trabalho se divide em três áreas: Arte, Programação e Design; quem faz cada uma é a pendência 6

## Pendente

1. [ ] **Fases × cenários**: o documento cita 5 temas, "quatro fases principais" e 5 cenários de
       fundo. Quantas fases existem? Fase e cenário são a mesma coisa?
2. [ ] **Final**: a queda de Ícaro pelo sol é uma cutscene depois da vitória ou é uma derrota?
3. [ ] **"Jump de impulso"**: o que é, e como convive com o salto automático?
4. [ ] **Engine**: pygame é a engine atual (definida em 2026-09-25, provisória); o grupo pode alterar.
5. [ ] **Flechas e inimigos**: quem dispara, contra quem, e como isso afeta vitória e derrota?
6. [ ] **Divisão por pessoa**: quem faz Arte, Programação e Design.
7. [ ] **Checkpoints, duração, poderes e controles**: o documento não trata; falta a lista final de
       poderes e o esquema de controles.
8. [ ] **Elementos 3D num jogo pygame**: como os elementos 3D do Blender entram no jogo
       (ex.: renderizados como sprites).

### Organização do trabalho — pendente

- [ ] licença do repositório
- [ ] colaboradores do GitHub e permissões
- [ ] modelo de branches; proteção da `main`; pull request e revisão obrigatórios
- [ ] CI (testes automáticos no GitHub)
- [ ] padrão de mensagens de commit
- [ ] versão do Blender usada pelo grupo
- [ ] como evitar conflito em arquivo binário (`.blend` não tem merge)
- [ ] apoio a quem tem pouca experiência com Git
- [ ] entregáveis e cronograma

## Próxima reunião

| Campo | Valor |
|---|---|
| Data | |
| Participantes | |
| Pauta | |
| Decisões tomadas | |
