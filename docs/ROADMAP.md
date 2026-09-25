# Roadmap

> ## ⚠️ GABRIEL-PROPOSAL · NEEDS-GROUP-APPROVAL
>
> Esta ordem de produção é **proposta do Gabriel**, derivada de `docs/LEVEL_DESIGN.md` §24 — que
> também é proposta. **Não** é cronograma aprovado.
>
> Faltam ao grupo: escopo final, quais fases entram, o que é entregável, prazos e quem faz o quê.
> Não há datas aqui **de propósito**: inventar cronograma antes da reunião seria fabricar
> compromisso que ninguém assumiu. Ver [`GROUP-DECISIONS.md`](GROUP-DECISIONS.md).
>
> **Exceção — CONFIRMED:** os itens 1 e 2 da Fase 0 são infraestrutura local já executada ou em
> execução pelo Gabriel, sem impacto no design. O item 4 (remoto e CI) depende do grupo.

Ordem de produção (de `docs/LEVEL_DESIGN.md` §24, detalhada com o handoff histórico).
Uma etapa só começa quando a anterior está validada.

## Fase 0 — Ambiente e pipeline

1. ambiente Python 3.12 reproduzível (`.venv` + `requirements-dev.txt`) — **CONFIRMED** (feito e validado em 2026-09-19)
2. teste de fumaça: janela abre com câmera ortográfica — **CONFIRMED** como tarefa técnica; ainda pendente
3. teste de pipeline Blender → GLB → Panda3D **com material** e regras de `docs/ASSET_PIPELINE.md` — **CONFIRMED** como tarefa técnica; ainda pendente. O destino Panda3D depende da engine — engine: pendente de confirmação do grupo (ICR-016, pendência 4); pygame é a opção provável segundo o Gabriel em 2026-09-25; Panda3D foi proposta anterior do Gabriel
4. CI mínimo (sintaxe + testes) e remoto privado `icarus` — **NEEDS-GROUP-APPROVAL** (workflow Git/GitHub do grupo ainda não definido)

## Fase 1 — Física e controle

5. física básica (gravidade, impulso automático de asa)
6. controlador do Ícaro (horizontal com inércia, planar, impulso especial)
7. câmera acompanhando a subida
8. colisão com plataformas, queda/morte e reinício da tentativa

## Fase 2 — Graybox

9. graybox de Creta
10. playtest e tuning
11. graybox das cinco regiões
12. testar o jogo inteiro (duração alvo ~12 min, teto ~15)

## Fase 3 — Sistemas

13. temperatura/cera
14. score e coletáveis opcionais
15. inimigos e perigos

## Fase 4 — Arte e apresentação

16. arte 3D por região aprovada (critério em `docs/LEVEL_DESIGN.md` §23)
17. materiais e iluminação
18. VFX
19. áudio
20. UI
21. cutscenes (abertura e final)
22. polimento
23. trailer
24. build de entrega
