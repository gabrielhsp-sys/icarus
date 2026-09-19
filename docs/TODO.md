# TODO

## Próximo

- [ ] instalar Python 3.12 no Fedora (pacote de sistema — pedir aprovação)
- [ ] criar `.venv` com Python 3.12 e instalar `requirements-dev.txt`; rodar `pip check`
- [ ] teste de fumaça: `python main.py` abre a janela
- [ ] copiar `tests/icarus-blender-test/blender/coluna-teste.blend` para `blender/_pipeline-test/`
- [ ] reexportar o GLB seguindo `docs/ASSET_PIPELINE.md` e confirmar o material no Panda3D
- [ ] adaptar `tests/icarus-lab/test_blender_import.py` para `tools/view_model.py` (caminho do GLB por argumento)
- [ ] fixar o preset de exportação em `docs/ASSET_PIPELINE.md`
- [ ] criar CI mínimo em `.github/workflows/` (Python 3.12, sintaxe + pytest)
- [ ] criar remoto privado `icarus`, proteger `main`, adicionar colaboradores (etapa com aprovação)

## Depois

- [ ] física e controlador do Ícaro (ver `docs/ROADMAP.md` Fase 1)
- [ ] revisar e portar o Icarus Sync sem `git add -A` e sem merge automático
- [ ] confirmar se `sprit.blend` pertence ao Icarus
