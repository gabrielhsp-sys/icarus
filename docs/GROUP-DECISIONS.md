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

Nada ainda.

Único ponto que o grupo já sabe:

- o projeto será **dividido entre os integrantes** — a divisão concreta ainda será discutida.

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
