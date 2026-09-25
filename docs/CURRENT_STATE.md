# Estado atual

Atualizado em: 2026-09-25

> ## O grupo aprovou um documento de escopo em 2026-09-25 — com pendências abertas.
>
> Confirmado pelo Gabriel em 2026-09-25 como decisão do grupo; sujeito a alteração.
> Transcrição em [`GROUP_SCOPE.md`](GROUP_SCOPE.md); o que ficou `CONFIRMED` e as 7 pendências
> `NEEDS-GROUP-APPROVAL` estão em [`GROUP-DECISIONS.md`](GROUP-DECISIONS.md); o cruzamento com as
> propostas anteriores está em [`DECISIONS.md`](DECISIONS.md) ICR-016.
>
> Os documentos de design do Gabriel (GDD, level design, assets, cutscenes, roadmap, arquitetura)
> **continuam `GABRIEL-PROPOSAL`**: só mudou de estado o que o documento do grupo afirma, e ele
> contraria parte deles (sequência de regiões). Não é um GDD `APPROVED` (ICR-015).
>
> A infraestrutura técnica (ambiente, repositório, esqueleto de código) está pronta e verificada
> localmente. Nenhum código de gameplay foi escrito.

## Escopo — CONFIRMED pelo grupo (2026-09-25, sujeito a alteração)

Resumo; a lista integral está em [`GROUP-DECISIONS.md`](GROUP-DECISIONS.md#confirmado).

- subida vertical por plataformas até o céu; derrota ao cair, vitória ao atingir a altura final
- salto automático; plataformas fixas, móveis e instáveis/que quebram
- poderes temporários (velocidade, altura de salto); score pela altura
- progressão temática de Terra (Creta) até o Céu, com dificuldade crescente
- Python na lógica, Blender nos elementos 3D, base 2D com elementos 3D
- telas inicial, por fase, HUD, vitória e derrota; animações e sons listados no documento
- flechas e inimigos no escopo, comportamento não definido
- trabalho dividido em Arte, Programação e Design

## Escopo — pendências do documento (NEEDS-GROUP-APPROVAL)

1. número de fases (5 temas × "quatro fases principais" × 5 cenários)
2. o final pelo sol: cutscene depois da vitória ou derrota?
3. o que é "jump de impulso" e como convive com o salto automático
4. **engine** — "gamepy" não existe; nenhuma engine foi escolhida ou instalada por isso
5. flechas e inimigos: quem dispara, contra quem, efeito em vitória/derrota
6. quem faz cada área
7. checkpoints, duração-alvo, lista final de poderes e controles

A pendência 4 afeta a base técnica: o esqueleto atual usa Panda3D, validado localmente mas não
escolhido pelo grupo.

## O que existe — CONFIRMED (verificado localmente)

- repositório Git local (`main`), sem remoto
- Git LFS configurado para `*.blend`, `*.glb`, `*.png`, `*.wav`, `*.ogg` (nenhum binário versionado ainda)
- documentos de design copiados da pré-produção e do pacote de migração (`docs/SOURCES.md`)
- esqueleto de código: `main.py`, `game/app.py` (janela + câmera ortográfica), `game/camera.py`
- `requirements.txt` / `requirements-dev.txt` com versões fixadas para Python 3.12
- ambiente local validado (2026-09-19):
  - Python 3.12.14 do Fedora (`python3.12-3.12.14-1.fc44`), `.venv` criado com `python3.12 -m venv .venv`
  - dependências instaladas exatamente nas versões fixadas; `pip check` sem problemas
  - imports OK: `panda3d` (1.10.16), `gltf` (pacote `panda3d-gltf`; loaders `glb`/`gltf` registrados), `simplepbr`, `pytest`
  - todos os módulos do projeto compilam e importam sem erro (sem abrir janela)
  - ainda não há testes: `pytest` não coleta nada

## O que ainda NÃO existe / não foi testado — técnico

- o esqueleto nunca abriu janela (teste de fumaça pendente)
- física, controlador, graybox
- teste de pipeline com material
- CI e remoto GitHub (também depende do grupo — ICR-014)

## O que ainda NÃO foi decidido — NEEDS-GROUP-APPROVAL

Nada disto tem resposta hoje, e **nenhuma resposta foi inventada** nos documentos
(além das 7 pendências de escopo acima):

- entregáveis finais
- detalhes de gameplay e mecânicas que o documento do grupo não trata
- arte final e direção visual
- quem responde por cada área (o grupo definiu as áreas Arte, Programação e Design, não os
  responsáveis) e por Blender, animação, level design, UI, áudio, documentação e testes
- workflow Git/GitHub do grupo
- estratégia para integrantes com pouca experiência em Git
- cronograma

## Laboratórios de referência (não alterar)

- `~/Dev/tests/icarus-lab` — Python/Panda3D/2.5D/Git/CI/Icarus Sync (repo privado `icarus-lab-test`)
- `~/Dev/tests/icarus-blender-test` — teste Blender → GLB (geometria validada; material não)
