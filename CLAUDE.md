# Icarus — roteador para Claude

Projeto oficial do jogo Icarus (Python 3.12 — engine: pendente de confirmação do grupo (ICR-016, pendência 4); pygame é a opção provável segundo o Gabriel em 2026-09-25; Panda3D foi proposta anterior do Gabriel). Leia só o que a tarefa pedir.

> ## ⚠️ O design ainda NÃO foi aprovado pelo grupo
>
> A infraestrutura técnica foi preparada, mas **escopo e design não foram aprovados**.
> `GDD.md`, `LEVEL_DESIGN.md`, `ASSETS.md`, `CUTSCENES.md`, `ROADMAP.md` e a arquitetura em
> `TECHNICAL_DESIGN.md` são **`GABRIEL-PROPOSAL`** — ideias do Gabriel, não decisões coletivas.
>
> Não trate nada desses documentos como escopo fechado e não escreva código de gameplay
> assumindo que estão aprovados. Decisões reais do grupo ficam em `docs/GROUP-DECISIONS.md`.
>
> Categorias: **CONFIRMED** (decidido ou tecnicamente validado) · **GABRIEL-PROPOSAL**
> (proposta do Gabriel) · **NEEDS-GROUP-APPROVAL** (depende do grupo).

## Onde está cada coisa

- estado atual e próximos passos: `docs/CURRENT_STATE.md`, `docs/TODO.md`, `docs/ROADMAP.md`
- visão do jogo: `docs/GDD.md`
- level design **vigente**: `docs/LEVEL_DESIGN.md` (prevalece sobre qualquer outro doc de níveis)
- assets e cutscenes: `docs/ASSETS.md`, `docs/CUTSCENES.md`
- pipeline Blender → GLB → Panda3D (GABRIEL-PROPOSAL; engine pendente — ICR-016, pendência 4): `docs/ASSET_PIPELINE.md`
- arquitetura do código: `docs/TECHNICAL_DESIGN.md`
- decisões técnicas/infra: `docs/DECISIONS.md` (registre decisões novas aqui)
- **decisões do grupo: `docs/GROUP-DECISIONS.md`** — só ali algo vira decisão coletiva
- escopo aprovado pelo grupo (transcrição fiel, 2026-09-25): `docs/GROUP_SCOPE.md`
- procedência dos docs: `docs/SOURCES.md`
- `docs/archive/` é histórico: consultar, não seguir como regra

## Regras

0. **Nada de design é decisão.** Escopo, gameplay, mecânicas, fases, arte, divisão de tarefas, workflow Git e cronograma dependem do grupo. Se uma tarefa exigir uma dessas definições, parar e dizer que falta decisão do grupo — não escolher pelo grupo.
1. Ordem de produção: física → graybox de Creta → teste → graybox das 5 regiões → arte. Não pular para arte final. *(proposta, ver `docs/ROADMAP.md`)*
2. Valores de física, distâncias e temperatura são tuning: implementar, jogar, ajustar. Não inventar números "finais" nos docs.
3. Binários (`*.blend`, `*.glb`, `*.png`, `*.wav`, `*.ogg`) só via Git LFS. Nunca commitar `.blend1`, renders ou `.venv`.
4. Não instalar pacotes de sistema, skills, MCPs ou serviços; não criar remoto, fazer push, autenticar ou gastar dinheiro sem pedido explícito. Dependências Python só no `.venv` do projeto e registradas nos `requirements*.txt`.
5. `~/Dev/tests/icarus-lab` e `~/Dev/tests/icarus-blender-test` são laboratórios históricos: consultar, nunca alterar.
6. `docs/archive/CLAUDE_ICARUS_START_HERE.md` é referência histórica; sua política antiga de autonomia/instalação **não** vale.
7. Ao fim de uma sessão relevante, atualize `docs/CURRENT_STATE.md` e `docs/CHANGELOG.md`.
