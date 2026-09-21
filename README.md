# Icarus

Jogo de plataforma vertical 2.5D inspirado no mito de Ícaro — projeto de Computação Gráfica (UNIFAL-MG).
Python + Panda3D, com cenário 3D real modelado no Blender e importado como GLB.

> Estado: **bootstrap**. Ainda não há jogo jogável. Veja [`docs/CURRENT_STATE.md`](docs/CURRENT_STATE.md).
>
> **A infraestrutura técnica foi preparada, mas o escopo e o design do jogo ainda não foram
> aprovados pelo grupo.** Os documentos de design são propostas do Gabriel
> (`GABRIEL-PROPOSAL`); decisões coletivas ficam em
> [`docs/GROUP-DECISIONS.md`](docs/GROUP-DECISIONS.md).

## Requisitos

- Python **3.12** (ver `.python-version`)
- Git + **Git LFS** (`.blend`, `.glb`, `.png`, `.wav`, `.ogg` são versionados via LFS)
- Blender 5.2.x para editar os arquivos em `blender/`

## Preparar o ambiente

```bash
git lfs install --local
python3.12 -m venv .venv
.venv/bin/pip install -r requirements-dev.txt
```

## Rodar

```bash
.venv/bin/python main.py
```

## Estrutura

- `main.py` — ponto de entrada
- `game/` — código do jogo (`app.py`, `camera.py`, `core/`, `player/`, `world/`, `levels/`)
- `assets/models/` — GLBs exportados do Blender
- `blender/` — arquivos-fonte `.blend`
- `tools/` — utilitários de desenvolvimento
- `tests/` — testes automatizados
- `docs/` — design, pipeline, decisões e estado do projeto

## Documentação

| Documento | Conteúdo |
|---|---|
| [`docs/GDD.md`](docs/GDD.md) | visão geral do jogo |
| [`docs/LEVEL_DESIGN.md`](docs/LEVEL_DESIGN.md) | **level design vigente** (congelado para implementação) |
| [`docs/ASSETS.md`](docs/ASSETS.md) | lista de assets |
| [`docs/CUTSCENES.md`](docs/CUTSCENES.md) | cutscenes e trailer |
| [`docs/ASSET_PIPELINE.md`](docs/ASSET_PIPELINE.md) | regras Blender → GLB → Panda3D |
| [`docs/TECHNICAL_DESIGN.md`](docs/TECHNICAL_DESIGN.md) | arquitetura técnica |
| [`docs/ROADMAP.md`](docs/ROADMAP.md) | ordem de produção |
| [`docs/DECISIONS.md`](docs/DECISIONS.md) | decisões e motivos |
| [`docs/SOURCES.md`](docs/SOURCES.md) | procedência dos documentos |
