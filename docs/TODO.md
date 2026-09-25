# TODO

> Lista **técnica**, do Gabriel. Não é backlog do grupo e não atribui tarefa a ninguém.
> Itens marcados `NEEDS-GROUP-APPROVAL` não devem ser executados antes da reunião —
> ver [`GROUP-DECISIONS.md`](GROUP-DECISIONS.md).

## Próximo

- [x] instalar Python 3.12 no Fedora (`python3.12-3.12.14-1.fc44`)
- [x] criar `.venv` com Python 3.12 e instalar `requirements-dev.txt`; rodar `pip check`
- [ ] teste de fumaça: `python main.py` abre a janela
- [ ] primeiro teste automatizado (hoje `pytest` não coleta nada)
- [ ] copiar `tests/icarus-blender-test/blender/coluna-teste.blend` para `blender/_pipeline-test/`
- [ ] reexportar o GLB seguindo `docs/ASSET_PIPELINE.md` e confirmar o material no Panda3D — depende da engine: pendente de confirmação do grupo (ICR-016, pendência 4); pygame é a opção provável segundo o Gabriel em 2026-09-25; Panda3D foi proposta anterior do Gabriel
- [ ] adaptar `tests/icarus-lab/test_blender_import.py` para `tools/view_model.py` (caminho do GLB por argumento)
- [ ] fixar o preset de exportação em `docs/ASSET_PIPELINE.md`
- [ ] `NEEDS-GROUP-APPROVAL` criar CI mínimo em `.github/workflows/` (Python 3.12, sintaxe + pytest)
- [x] criar remoto privado `gabrielhsp-sys/icarus` (2026-09-25, autorização explícita do Gabriel; ver `CURRENT_STATE.md`)
- [ ] `NEEDS-GROUP-APPROVAL` proteger `main`, adicionar colaboradores — depende do workflow Git do grupo (ICR-014)

## Depois

- [ ] `NEEDS-GROUP-APPROVAL` física e controlador do Ícaro — depende do gameplay, que o grupo ainda não definiu (ver `docs/ROADMAP.md` Fase 1, que é proposta)
- [ ] revisar e portar o Icarus Sync sem `git add -A` e sem merge automático
- [ ] confirmar se `sprit.blend` pertence ao Icarus
