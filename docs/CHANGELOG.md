# Changelog

## 2026-09-19 — ambiente Python 3.12 validado

- Python 3.12.14 (pacote Fedora `python3.12`) e `.venv` local criados
- `requirements-dev.txt` instalado nas versões fixadas; `pip check` limpo
- imports validados: `panda3d`, `gltf` (`panda3d-gltf`), `simplepbr`, `pytest`
- código do projeto compila e importa sem erro; ainda sem testes automatizados

## 2026-09-19 — bootstrap

- repositório criado com Git LFS, `.gitignore`, `.python-version` (3.12) e requirements fixados
- documentos de design importados (procedência em `docs/SOURCES.md`)
- esqueleto de código com janela e câmera ortográfica (não executado)
- docs novos: pipeline de assets, design técnico, decisões, roadmap, estado, TODO
