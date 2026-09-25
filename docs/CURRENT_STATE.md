# Estado atual

Atualizado em: 2026-09-25

## Escopo

**DECIDIDO (grupo)** em 2026-09-25, sujeito a alteração: [`GROUP_SCOPE.md`](GROUP_SCOPE.md).
Resumo do que está decidido e a lista das 8 pendências em
[`GROUP-DECISIONS.md`](GROUP-DECISIONS.md).

## Código — TÉCNICO (verificado)

- bootstrap mínimo em pygame 2.6.1 (`game/app.py`): janela 1280×720, loop a 60 FPS, fecha com ESC
  ou pelo botão da janela
- `tests/test_smoke.py`: abre o bootstrap sem tela (`SDL_VIDEODRIVER=dummy`), roda 10 quadros e
  confere o código de saída 0; confere também que ESC e o fechamento da janela encerram o jogo
- `pytest`: 2 testes, todos passando
- nenhuma mecânica de jogo implementada

## Ambiente — TÉCNICO (verificado)

- Python 3.12.14, `.venv` criado com `python3.12 -m venv .venv`
- `requirements.txt` e `requirements-dev.txt` com versões fixadas; `pip check` sem problemas
- Git LFS configurado para `*.blend`, `*.glb`, `*.png`, `*.wav` e `*.ogg`; nenhum binário
  versionado ainda
- repositório privado no GitHub, branch `main`

## Próximos passos

Dependem do grupo — ver [Pendências](GROUP-DECISIONS.md#pendente):

- responder às pendências de escopo, principalmente fases × cenários (1) e integração dos
  elementos 3D num jogo pygame (8), que afetam a estrutura do código
- definir quem faz cada área (6)
- definir a organização do trabalho no repositório (licença, colaboradores, branches, CI)
