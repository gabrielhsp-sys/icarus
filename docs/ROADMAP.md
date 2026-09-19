# Roadmap

Ordem de produção (de `docs/LEVEL_DESIGN.md` §24, detalhada com o handoff histórico).
Uma etapa só começa quando a anterior está validada.

## Fase 0 — Ambiente e pipeline

1. ambiente Python 3.12 reproduzível (`.venv` + `requirements-dev.txt`)
2. teste de fumaça: janela abre com câmera ortográfica
3. teste de pipeline Blender → GLB → Panda3D **com material** e regras de `docs/ASSET_PIPELINE.md`
4. CI mínimo (sintaxe + testes) e remoto privado `icarus`

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
