# Decisões

Formato: ID · data · decisão · motivo. Decisões novas entram no fim; não reescrever as antigas.

| ID | Data | Decisão | Motivo |
|---|---|---|---|
| ICR-001 | 2026-09-19 | Projeto oficial em `~/Dev/projects/academic/icarus`, fora do repositório `faculdade-bcc` | projeto próprio, com assets pesados e colaboradores |
| ICR-002 | 2026-09-19 | Python 3.12 | versão aprovada para o grupo; dependências conferidas com wheels cp312 |
| ICR-003 | 2026-09-19 | Git LFS para `*.blend`, `*.glb`, `*.png`, `*.wav`, `*.ogg` desde o primeiro commit | migrar binários para LFS depois exigiria reescrever histórico |
| ICR-004 | 2026-09-19 | Remoto futuro: GitHub `icarus`, privado (ainda não criado) | trabalho acadêmico de grupo |
| ICR-005 | 2026-09-19 | `docs/LEVEL_DESIGN.md` (cópia do `ICARUS_LEVEL_DESIGN_FINAL.md`) é o level design vigente; `LEVELS.md` da pré-produção fica em `docs/archive/` | o final congela as decisões e é o mais recente |
| ICR-006 | 2026-09-19 | Os documentos em `docs/` são as versões vivas; `~/Dev/projects/academic/icarus-planning` fica congelado como original | evitar duas fontes de verdade; procedência em `docs/SOURCES.md` |
| ICR-007 | 2026-09-19 | `tests/icarus-lab` e `tests/icarus-blender-test` permanecem como laboratórios históricos, sem alteração | preservar evidência dos testes de Git/CI/Blender |
| ICR-008 | 2026-09-19 | A política de autonomia/instalação do handoff antigo (`docs/archive/CLAUDE_ICARUS_START_HERE.md`) não é herdada | valem as regras de segurança atuais do ecossistema (ver `CLAUDE.md`) |
| ICR-009 | 2026-09-19 | `sprit.blend` (em `faculdade-bcc/.../trabalhos/Game/`) não entra agora | relação com o Icarus não confirmada |
| ICR-010 | 2026-09-19 | Icarus Sync não entra no bootstrap; será portado depois de revisado | o protótipo usa `git add -A`, merge automático e push, arriscados com assets pesados |
| ICR-011 | 2026-09-19 | Identidade Git local do repositório usa o e-mail noreply do GitHub | mesmo padrão do `icarus-lab`; não expor e-mail pessoal |

## Decisões de design herdadas (congeladas em `docs/LEVEL_DESIGN.md` §25)

Cinco regiões; subida vertical; 10–15 min; câmera 2.5D ortográfica; elementos 3D reais;
asa automática; planar; impulso especial; temperatura/cera; vento; score; sem checkpoints;
morte reinicia a tentativa; final clássico; cutscene inicial e final.
