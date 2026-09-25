# Procedência dos documentos

Cópias feitas em 2026-09-19 no bootstrap do projeto. As origens **não** foram alteradas.
Os hashes abaixo são do momento da cópia: os documentos **vigentes** podem evoluir daqui em diante;
os **históricos** (`docs/archive/`) não devem ser editados.

Legenda de status:
- **vigente** — versão viva, mantida neste repositório
- **histórico** — referência congelada; consultar, não seguir como regra

| Cópia | Origem | SHA-256 original | SHA-256 cópia | Conferência | Status |
|---|---|---|---|---|---|
| `docs/GDD.md` | `~/Dev/projects/academic/icarus-planning/GDD.md` | `05bdc0a4805335762d508cb514b2d8a0a67e81e09dbf4bf9eff7136a229ca1ed` | `05bdc0a4805335762d508cb514b2d8a0a67e81e09dbf4bf9eff7136a229ca1ed` | ✅ idêntico | **vigente** |
| `docs/ASSETS.md` | `~/Dev/projects/academic/icarus-planning/ASSETS.md` | `81dc7242482e718c8b8493212370a180a24b948447fd694bb3230767c23d57ac` | `81dc7242482e718c8b8493212370a180a24b948447fd694bb3230767c23d57ac` | ✅ idêntico | **vigente** |
| `docs/CUTSCENES.md` | `~/Dev/projects/academic/icarus-planning/CUTSCENES.md` | `ee6810dedcb8a7d1b2ae06a3518b59671ecc0b65b4d3857a7b1c96d165034771` | `ee6810dedcb8a7d1b2ae06a3518b59671ecc0b65b4d3857a7b1c96d165034771` | ✅ idêntico | **vigente** |
| `docs/LEVEL_DESIGN.md` | `~/Dev/ai/migrations/chatgpt-to-claude/sources/library-selected/ICARUS_LEVEL_DESIGN_FINAL.md` | `a6cc84b08564e61468a1691fb32caadbf0548e8f697e1be2d3804af532f739ad` | `a6cc84b08564e61468a1691fb32caadbf0548e8f697e1be2d3804af532f739ad` | ✅ idêntico | **vigente** — prevalece em level design |
| `docs/archive/LEVELS-preproducao.md` | `~/Dev/projects/academic/icarus-planning/LEVELS.md` | `ff8153969d63163693549ce20727078953125011dba5eb87bf9e06ec087728a4` | `ff8153969d63163693549ce20727078953125011dba5eb87bf9e06ec087728a4` | ✅ idêntico | histórico — substituído por `LEVEL_DESIGN.md` |
| `docs/archive/CLAUDE_ICARUS_START_HERE.md` | `~/Dev/ai/migrations/chatgpt-to-claude/sources/library-selected/CLAUDE_ICARUS_START_HERE.md` | `1a092acfad6fdd6e98589b2ba0d5f91f6024c6e5d7bfee626cfc49714791e8e7` | `1a092acfad6fdd6e98589b2ba0d5f91f6024c6e5d7bfee626cfc49714791e8e7` | ✅ idêntico | histórico — política antiga de autonomia **não** vale (ver ICR-008) |

## Notas de procedência

- `icarus-planning/*.md`: pré-produção escrita em 2026-09-18 (16:22–16:26), sem Git. A pasta fica congelada como original.
- `ICARUS_LEVEL_DESIGN_FINAL.md`: item da ChatGPT Library `libfile_2ecae046f5788191ac7e164bda45097a`, preservado no pacote
  de migração v1.2.0 e idêntico nas baselines v1.0.0 e v1.1.0 (`history/`). Status original: "fechado para iniciar implementação".
- `CLAUDE_ICARUS_START_HERE.md`: item da ChatGPT Library `libfile_6710252a705c81919195922979f435cf`, handoff mestre do projeto
  (pacote de migração v1.2.0).
- Documentos criados do zero no bootstrap (sem origem externa): `ASSET_PIPELINE.md`, `TECHNICAL_DESIGN.md`, `DECISIONS.md`,
  `ROADMAP.md`, `CURRENT_STATE.md`, `TODO.md`, `CHANGELOG.md`, `SOURCES.md`.
- `GROUP_SCOPE.md` (2026-09-25): transcrição fiel do documento de escopo escrito pelo grupo num Google Doc.
  O documento não traz data, autores nem ata; procedência: "confirmado pelo Gabriel em 2026-09-25 como
  decisão do grupo; sujeito a alteração". Não é cópia de arquivo local, por isso não tem SHA-256 de origem.
