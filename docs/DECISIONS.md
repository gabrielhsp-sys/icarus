# Decisões

> ## Três categorias — leia antes de usar qualquer linha deste arquivo
>
> | Categoria | Significado |
> |---|---|
> | **CONFIRMED** | fato realmente decidido ou tecnicamente validado. Infraestrutura local do Gabriel e verificações executadas entram aqui. |
> | **GABRIEL-PROPOSAL** | ideia ou proposta criada pelo Gabriel. Não foi discutida com o grupo. |
> | **NEEDS-GROUP-APPROVAL** | precisa ser discutido com o grupo antes de virar decisão. |
>
> As entradas `ICR-*` abaixo foram registradas pelo Gabriel sozinho, no bootstrap do projeto.
> A tabela **não foi reescrita** (regra deste arquivo: decisões antigas não se alteram); a
> classificação de cada uma está na seção [Classificação](#classificação-2026-09-21), e as
> correções necessárias entraram como decisões novas no fim.
>
> Decisões reais do grupo vão para [`GROUP-DECISIONS.md`](GROUP-DECISIONS.md), não para cá.

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
| ICR-012 | 2026-09-21 | Todo o **design** do Icarus (GDD, level design, assets, cutscenes, roadmap, arquitetura) tem status `GABRIEL-PROPOSAL` até que o grupo decida. Nenhum documento de design é decisão aprovada | os documentos foram escritos a partir das ideias e suposições do Gabriel, antes de qualquer discussão coletiva |
| ICR-013 | 2026-09-21 | Corrige a redação de **ICR-002**: o Python 3.12 está `CONFIRMED` como **validação técnica local** (venv, `pip check`, imports), mas "versão aprovada para o grupo" era suposição. Adotar 3.12 como padrão do grupo é `NEEDS-GROUP-APPROVAL` | a validação aconteceu; a aprovação coletiva não |
| ICR-014 | 2026-09-21 | **ICR-004** (remoto privado `icarus` no GitHub) passa a `NEEDS-GROUP-APPROVAL` | remoto, proteção de branch, colaboradores e workflow Git dependem do grupo — inclusive da estratégia para quem tem pouca experiência com Git |
| ICR-015 | 2026-09-21 | Um GDD definitivo só é `APPROVED` mediante **decisão explícita do grupo**, registrada em `GROUP-DECISIONS.md` com data | evita que a proposta vire escopo por inércia |

## Classificação (2026-09-21)

| ID | Categoria | Observação |
|---|---|---|
| ICR-001 | **CONFIRMED** | onde o repositório mora; espaço de trabalho do Gabriel, sem impacto no grupo |
| ICR-002 | **CONFIRMED** (parcial) | validação técnica do Python 3.12 é fato; ser o padrão **do grupo** → `NEEDS-GROUP-APPROVAL`. Ver ICR-013 |
| ICR-003 | **CONFIRMED** | Git LFS configurado e verificado localmente |
| ICR-004 | **NEEDS-GROUP-APPROVAL** | remoto, colaboradores e proteção de branch. Ver ICR-014 |
| ICR-005 | **CONFIRMED** como gestão de documento | qual arquivo é a versão viva. O **conteúdo** do level design é `GABRIEL-PROPOSAL` |
| ICR-006 | **CONFIRMED** | evita duas fontes de verdade; não decide nada de design |
| ICR-007 | **CONFIRMED** | laboratórios preservados |
| ICR-008 | **CONFIRMED** | segurança; não herdar política antiga de autonomia |
| ICR-009 | **CONFIRMED** | nada foi incorporado |
| ICR-010 | **CONFIRMED** | Icarus Sync fora do bootstrap |
| ICR-011 | **CONFIRMED** | identidade Git local |
| ICR-012 … ICR-015 | **CONFIRMED** | registram esta própria correção de status |

Resumo: o que está `CONFIRMED` é **infraestrutura e verificação técnica**. Nenhuma decisão de
**design ou de organização do grupo** está confirmada.

## Decisões de design herdadas (congeladas em `docs/LEVEL_DESIGN.md` §25)

> ### ⚠️ GABRIEL-PROPOSAL · NEEDS-GROUP-APPROVAL
>
> "Congeladas" descreve o quanto a proposta amadureceu, **não** aprovação do grupo.
> Nenhum item da lista abaixo foi decidido coletivamente. Nada aqui foi removido: a lista
> continua íntegra como proposta.

Cinco regiões; subida vertical; 10–15 min; câmera 2.5D ortográfica; elementos 3D reais;
asa automática; planar; impulso especial; temperatura/cera; vento; score; sem checkpoints;
morte reinicia a tentativa; final clássico; cutscene inicial e final.
