# Estado atual

Atualizado em: 2026-09-19

## O que existe

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

## O que ainda NÃO existe / não foi testado

- o esqueleto nunca abriu janela (teste de fumaça pendente)
- física, controlador, graybox
- teste de pipeline com material
- CI e remoto GitHub

## Laboratórios de referência (não alterar)

- `~/Dev/tests/icarus-lab` — Python/Panda3D/2.5D/Git/CI/Icarus Sync (repo privado `icarus-lab-test`)
- `~/Dev/tests/icarus-blender-test` — teste Blender → GLB (geometria validada; material não)
