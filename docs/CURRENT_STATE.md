# Estado atual

Atualizado em: 2026-09-21

> ## A infraestrutura técnica foi preparada, mas o escopo e o design do jogo ainda não foram aprovados pelo grupo.
>
> O que está pronto é **ambiente, repositório e esqueleto de código** — verificado localmente.
> Tudo que é **design** (GDD, level design, assets, cutscenes, roadmap, arquitetura) é
> `GABRIEL-PROPOSAL` e depende de discussão coletiva.
>
> Ainda **não** foram definidos com o grupo: escopo final, gameplay, mecânicas, fases, arte final,
> divisão de tarefas, responsáveis por programação/Blender/animação/level design/UI/áudio/
> documentação/testes, workflow Git/GitHub, estratégia para integrantes com pouca experiência em
> Git, cronograma e entregáveis finais.
>
> O grupo sabe apenas que o projeto será dividido entre os integrantes. A divisão concreta ainda
> será discutida. Ver [`GROUP-DECISIONS.md`](GROUP-DECISIONS.md).

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

Nada disto tem resposta hoje, e **nenhuma resposta foi inventada** nos documentos:

- escopo final do jogo e o que conta como entregável
- gameplay, mecânicas e fases
- arte final e direção visual
- divisão de tarefas e quem responde por programação, Blender, animação, level design, UI,
  áudio, documentação e testes
- workflow Git/GitHub do grupo
- estratégia para integrantes com pouca experiência em Git
- cronograma

O grupo sabe apenas que o projeto será dividido entre os integrantes.

## Laboratórios de referência (não alterar)

- `~/Dev/tests/icarus-lab` — Python/Panda3D/2.5D/Git/CI/Icarus Sync (repo privado `icarus-lab-test`)
- `~/Dev/tests/icarus-blender-test` — teste Blender → GLB (geometria validada; material não)
