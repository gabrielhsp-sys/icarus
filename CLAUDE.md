# Icarus — roteador para Claude

Projeto oficial do jogo Icarus (Python 3.12 + Panda3D). Leia só o que a tarefa pedir.

## Onde está cada coisa

- estado atual e próximos passos: `docs/CURRENT_STATE.md`, `docs/TODO.md`, `docs/ROADMAP.md`
- visão do jogo: `docs/GDD.md`
- level design **vigente**: `docs/LEVEL_DESIGN.md` (prevalece sobre qualquer outro doc de níveis)
- assets e cutscenes: `docs/ASSETS.md`, `docs/CUTSCENES.md`
- Blender → GLB → Panda3D: `docs/ASSET_PIPELINE.md`
- arquitetura do código: `docs/TECHNICAL_DESIGN.md`
- decisões: `docs/DECISIONS.md` (registre decisões novas aqui)
- procedência dos docs: `docs/SOURCES.md`
- `docs/archive/` é histórico: consultar, não seguir como regra

## Regras

1. Ordem de produção: física → graybox de Creta → teste → graybox das 5 regiões → arte. Não pular para arte final.
2. Valores de física, distâncias e temperatura são tuning: implementar, jogar, ajustar. Não inventar números "finais" nos docs.
3. Binários (`*.blend`, `*.glb`, `*.png`, `*.wav`, `*.ogg`) só via Git LFS. Nunca commitar `.blend1`, renders ou `.venv`.
4. Não instalar pacotes de sistema, skills, MCPs ou serviços; não criar remoto, fazer push, autenticar ou gastar dinheiro sem pedido explícito. Dependências Python só no `.venv` do projeto e registradas nos `requirements*.txt`.
5. `~/Dev/tests/icarus-lab` e `~/Dev/tests/icarus-blender-test` são laboratórios históricos: consultar, nunca alterar.
6. `docs/archive/CLAUDE_ICARUS_START_HERE.md` é referência histórica; sua política antiga de autonomia/instalação **não** vale.
7. Ao fim de uma sessão relevante, atualize `docs/CURRENT_STATE.md` e `docs/CHANGELOG.md`.
