# Estado atual

Atualizado em: 2026-09-19

## O que existe

- repositório Git local (`main`), sem remoto
- Git LFS configurado para `*.blend`, `*.glb`, `*.png`, `*.wav`, `*.ogg` (nenhum binário versionado ainda)
- documentos de design copiados da pré-produção e do pacote de migração (`docs/SOURCES.md`)
- esqueleto de código: `main.py`, `game/app.py` (janela + câmera ortográfica), `game/camera.py`
- `requirements.txt` / `requirements-dev.txt` com versões fixadas para Python 3.12

## O que ainda NÃO existe / não foi testado

- ambiente virtual e dependências instaladas
- **Python 3.12 não está instalado neste Fedora** (só 3.14) — precisa ser instalado antes do `.venv`
- o esqueleto nunca foi executado
- física, controlador, graybox
- teste de pipeline com material
- CI e remoto GitHub

## Laboratórios de referência (não alterar)

- `~/Dev/tests/icarus-lab` — Python/Panda3D/2.5D/Git/CI/Icarus Sync (repo privado `icarus-lab-test`)
- `~/Dev/tests/icarus-blender-test` — teste Blender → GLB (geometria validada; material não)
