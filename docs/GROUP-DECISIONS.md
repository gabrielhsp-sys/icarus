# Decisões do grupo

Este é o **único** arquivo onde uma decisão do grupo vira fato. Enquanto algo estiver só em
`GDD.md`, `LEVEL_DESIGN.md`, `ASSETS.md`, `CUTSCENES.md`, `ROADMAP.md` ou `TECHNICAL_DESIGN.md`,
é proposta do Gabriel — não decisão coletiva.

## Como usar

| Categoria | Significado |
|---|---|
| **CONFIRMED** | fato realmente decidido pelo grupo, ou tecnicamente validado |
| **GABRIEL-PROPOSAL** | ideia ou proposta criada pelo Gabriel, ainda não discutida |
| **NEEDS-GROUP-APPROVAL** | precisa ser discutido com o grupo antes de virar decisão |

Regras:

1. Uma decisão só entra em **Confirmado** com **data** e quem estava presente.
2. Nada é preenchido por suposição. Campo sem resposta fica em branco — em branco é informação
   honesta; resposta inventada é desinformação.
3. Um GDD definitivo só é `APPROVED` por decisão explícita registrada aqui (ICR-015).
4. Decisões técnicas/infraestrutura do Gabriel continuam em [`DECISIONS.md`](DECISIONS.md).

## Confirmado

~~Nada ainda.~~ *(estado até 2026-09-21; ver a entrada de 2026-09-25 abaixo)*

Único ponto que o grupo já sabe:

- o projeto será **dividido entre os integrantes** — a divisão concreta ainda será discutida.

### 2026-09-25 — escopo do jogo (documento do grupo)

| Campo | Valor |
|---|---|
| Data | 2026-09-25 (data da confirmação; o documento não traz data própria) |
| Presentes | não registrado — o documento não traz autores nem ata |
| Procedência | **confirmado pelo Gabriel em 2026-09-25 como decisão do grupo; sujeito a alteração** |
| Fonte | transcrição fiel em [`GROUP_SCOPE.md`](GROUP_SCOPE.md) |
| Registro técnico | [`DECISIONS.md`](DECISIONS.md) ICR-016 |

Entra aqui **só o que o documento afirma sem ambiguidade**. Contradições e lacunas do próprio
documento estão em [A discutir](#a-discutir), e nenhuma `GABRIEL-PROPOSAL` anterior foi promovida
por tabela.

- **CONFIRMED** jogo de subida vertical por plataformas até o céu.
- **CONFIRMED** derrota ao cair; vitória ao atingir a altura final.
- **CONFIRMED** salto automático.
- **CONFIRMED** tipos de plataforma: fixas, móveis e instáveis/que quebram.
- **CONFIRMED** poderes temporários, incluindo velocidade e altura de salto.
- **CONFIRMED** score pela altura.
- **CONFIRMED** progressão temática de Terra (Creta) até o Céu, com dificuldade crescente.
- **CONFIRMED** Python na lógica; Blender nos elementos 3D; base 2D com elementos 3D.
- **CONFIRMED** telas: inicial, por fase, HUD, vitória e derrota.
- **CONFIRMED** animações listadas no documento: quebra das plataformas, quebra das asas, queda de
  Ícaro ao errar um salto, efeitos de poder temporário.
- **CONFIRMED** sons listados no documento: plataformas quebrando, pulo, poderes especiais,
  movimento das asas.
- **CONFIRMED** flechas e inimigos estão no escopo; o comportamento deles **ainda não foi definido**
  (pendência 5).
- **CONFIRMED** o trabalho se divide em três áreas: Arte, Programação e Design (quem faz cada uma é
  a pendência 6).

## A discutir

- [ ] escopo final do jogo
- [ ] gameplay
- [ ] mecânicas
- [ ] fases / regiões
- [ ] arte final e direção visual
- [ ] entregáveis finais
- [ ] cronograma
- [ ] critério para considerar o GDD aprovado
- [ ] o que fazer com os documentos de proposta já escritos: adotar, adaptar ou recomeçar

> 2026-09-25: parte de escopo, gameplay, mecânicas e fases foi respondida pelo documento do grupo
> (ver [Confirmado](#confirmado)). Os itens acima ficam como estavam; o que o documento deixou em
> aberto está logo abaixo.

### Pendências do documento de escopo (2026-09-25) — NEEDS-GROUP-APPROVAL

Contradições e lacunas do próprio documento do grupo ([`GROUP_SCOPE.md`](GROUP_SCOPE.md)).
Nenhuma foi respondida por suposição.

1. [ ] **Número de fases**: 5 temas, "quatro fases principais" ou 5 cenários de fundo? Fase e
       cenário são a mesma coisa?
2. [ ] **Final**: a queda pelo sol é uma cutscene depois da vitória, ou é a derrota?
3. [ ] **"Jump de impulso"** é o quê: plataforma-trampolim, salto carregado ou outra coisa? Como
       convive com o salto automático?
4. [ ] **Engine**: "gamepy" não existe com esse nome. Qual é a engine? *(nenhuma engine foi
       escolhida nem instalada por causa desta pendência)*
   > Nota (2026-09-25): engine: pendente de confirmação do grupo (ICR-016, pendência 4); pygame é a opção provável segundo o Gabriel em 2026-09-25; Panda3D foi proposta anterior do Gabriel. **Não é decisão**: a pendência continua aberta até o grupo
   > confirmar.
5. [ ] **Flechas e inimigos**: quem dispara, contra quem, e como isso afeta vitória e derrota?
6. [ ] **Quem faz cada área** (Arte, Programação, Design): divisão concreta entre integrantes.
7. [ ] **Checkpoints, duração-alvo, lista final de poderes e controles**: o documento não trata.

## Divisão de responsabilidades

A definir com o grupo. Ninguém está atribuído a nada até a reunião.

| Área | Responsável | Definido em |
|---|---|---|
| programação | | |
| Blender / modelagem | | |
| animação | | |
| level design | | |
| UI | | |
| áudio | | |
| documentação | | |
| testes | | |

## Workflow Git/GitHub

A definir com o grupo.

- [ ] remoto: onde fica, quem é dono, público ou privado
- [ ] modelo de branches
- [ ] `main` protegida? pull request obrigatório? quantas revisões?
- [ ] mensagens de commit: há padrão?
- [ ] Git LFS: quem precisa instalar e como validar que está funcionando
- [ ] **estratégia para integrantes com pouca experiência em Git** — decidir explicitamente:
      quem apoia, se haverá um guia curto do grupo, e o que fazer quando alguém travar
- [ ] o que fazer com conflito em arquivo binário (`.blend`), que não tem merge

> Observação técnica (não é decisão): o repositório local já usa Git LFS e `main` local
> (`DECISIONS.md` ICR-003). Isso **não** define o workflow do grupo.

## Escopo

A definir com o grupo.

- [ ] o que **entra** na entrega
- [ ] o que fica explicitamente **fora**
- [ ] qual é o mínimo aceitável se o tempo apertar
- [ ] duração-alvo de uma partida
- [ ] quantas fases/regiões de fato

> A proposta do Gabriel (cinco regiões, 10–15 min, subida vertical 2.5D) está em
> [`LEVEL_DESIGN.md`](LEVEL_DESIGN.md) e [`GDD.md`](GDD.md). É ponto de partida para a conversa,
> não escopo.

## Próxima reunião

| Campo | Valor |
|---|---|
| Data | |
| Participantes | |
| Pauta | |
| Decisões tomadas | |

Sugestão de pauta, se ajudar: escopo mínimo → divisão de tarefas → workflow Git (incluindo quem
precisa de apoio) → cronograma. Decidir escopo antes de dividir tarefas evita atribuir trabalho
que depois sai do jogo.
