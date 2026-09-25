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
| ICR-016 | 2026-09-25 | O **grupo aprovou um documento de escopo** do jogo — confirmado pelo Gabriel em 2026-09-25 como decisão do grupo; sujeito a alteração. Transcrição fiel em [`GROUP_SCOPE.md`](GROUP_SCOPE.md); itens `CONFIRMED` e 7 pendências `NEEDS-GROUP-APPROVAL` em `GROUP-DECISIONS.md`. Só muda de estado o que o documento afirma; o cruzamento com as propostas anteriores está em [ICR-016 — propostas anteriores × documento do grupo](#icr-016--propostas-anteriores--documento-do-grupo-2026-09-25). Não é um GDD `APPROVED` (ICR-015): o documento tem contradições internas abertas | o documento do grupo não traz data, autores nem ata; a procedência é a declaração do Gabriel, registrada literalmente |

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

## ICR-016 — propostas anteriores × documento do grupo (2026-09-25)

Base: a lista de "Decisões de design herdadas" acima e o [`GDD.md`](GDD.md), todos
`GABRIEL-PROPOSAL`. Critério: uma proposta só muda de estado se o documento do grupo
([`GROUP_SCOPE.md`](GROUP_SCOPE.md)) **afirmar** a mesma coisa (confirmada) ou outra coisa
incompatível (contrariada). Silêncio ou ambiguidade do documento mantém a proposta pendente.
Os documentos de proposta **não foram editados**; esta tabela é o único registro da mudança.

### Confirmadas pelo documento do grupo

| Proposta anterior | O que o grupo afirma |
|---|---|
| subida vertical | subida por plataformas até o céu |
| score (GDD §12) | só a parte **pela altura**; os demais componentes (penas, tempo, regiões, conclusão) seguem pendentes |
| Creta como início (GDD §4) | 1ª fase "Terra (Creta)" |
| plataformas normal, móvel e quebrável (GDD §8) | plataformas fixas, móveis e instáveis/que quebram |
| existência de inimigos (GDD §10) | inimigos no escopo; comportamento não definido |
| Python e Blender (GDD §16) | Python na lógica; Blender no 3D |

### Contrariadas pelo documento do grupo

| Proposta anterior | O que o grupo afirma |
|---|---|
| sequência de regiões Creta → Mar Egeu → Nuvens Altas → Tempestade → Região Solar (GDD §4) | Terra (Creta) → Cidade → Subida para o céu → Nuvens → Céu. Só Creta coincide; **quantas** fases existem é a pendência 1 |

### Seguem pendentes (`GABRIEL-PROPOSAL` / `NEEDS-GROUP-APPROVAL`)

| Proposta anterior | Por quê |
|---|---|
| cinco regiões | o documento diz 5 temas, "quatro fases principais" e 5 cenários — pendência 1 |
| final clássico | a narrativa do documento coincide (o sol derrete as asas e Ícaro cai), mas não diz se isso é cutscene após a vitória ou derrota — pendência 2 |
| impulso especial (`Shift`) | o documento cita "jump de impulso" sem definir — pendência 3 |
| Panda3D como engine; câmera 2.5D ortográfica; "elementos 3D reais" | o documento pede engine 2D com elementos 3D e nomeia "gamepy", que não existe — pendência 4. As dependências Panda3D já fixadas em `requirements*.txt` são validação técnica local (ICR-013), **não** escolha do grupo |
| inimigos como obstáculos, "sem sistema complexo de combate" (GDD §10) | o documento inclui disparo de flechas sem dizer por quem — pendência 5 |
| 10–15 min; sem checkpoints; controles provisórios | o documento não trata — pendência 7 |
| asa automática (bater asas como impulso periódico) | o documento confirma **salto** automático, não a asa automática da proposta |
| planar | o documento não trata |
| temperatura/cera | o documento não trata como mecânica; só cita o sol derretendo as asas no término |
| vento; plataformas de vento, quente, estreita, nuvem temporária | o documento não trata |
| morte reinicia a tentativa | o documento define a derrota, não o que acontece depois dela |
| coletáveis (penas, fragmentos de cera, relíquias) | o documento traz itens de poder temporário, que não estavam na proposta; os coletáveis da proposta não aparecem |
| cutscene inicial e final | o documento lista animações e telas, não cutscenes |
| ordem de produção (física → graybox → arte) | o documento não trata |
