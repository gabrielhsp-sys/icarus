# Registro de decisões

Registro do grupo, iniciado em 2026-09-25. O histórico anterior está no Git, no commit `04979aa` e
anteriores.

Rótulos: **DECIDIDO (grupo)** · **PENDENTE (grupo)** · **TÉCNICO (verificado)** — ver
[`GROUP-DECISIONS.md`](GROUP-DECISIONS.md).

Decisões novas entram no fim. Uma decisão não é reescrita: outra entrada a substitui e diz qual.

| ID | Data | Decisão | Status | Referência |
|---|---|---|---|---|
| G-001 | 2026-09-25 | Escopo do jogo aprovado pelo grupo, sujeito a alteração | **DECIDIDO (grupo)** | [`GROUP_SCOPE.md`](GROUP_SCOPE.md); o que ficou em aberto está em [`GROUP-DECISIONS.md`](GROUP-DECISIONS.md#pendente) |
| G-002 | 2026-09-25 | pygame é a engine atual, provisória. Versão fixada: `pygame==2.6.1` | provisória: o grupo pode alterar (pendência 4). Instalação e teste de fumaça headless: **TÉCNICO (verificado)** | [`GROUP-DECISIONS.md`](GROUP-DECISIONS.md#pendente), `requirements.txt`, `tests/test_smoke.py` |
| G-003 | 2026-09-25 | Infraestrutura: Python 3.12; Git LFS para `*.blend`, `*.glb`, `*.png`, `*.wav`, `*.ogg`; repositório privado no GitHub, branch `main` | **TÉCNICO (verificado)** | `.python-version`, `.gitattributes` |
