# Icarus — instruções para agentes

Jogo do grupo em Python 3.12 com pygame (engine atual, provisória). Leia só o que a tarefa pedir.

## Onde está cada coisa

- escopo do jogo (fonte única): `docs/GROUP_SCOPE.md`
- o que está decidido e o que está pendente: `docs/GROUP-DECISIONS.md`
- registro de decisões: `docs/DECISIONS.md` (decisões novas entram no fim)
- estado atual e mudanças: `docs/CURRENT_STATE.md`, `docs/CHANGELOG.md`
- instalação, execução e estrutura: `README.md`

Rótulos usados nos docs: **DECIDIDO (grupo)** · **PENDENTE (grupo)** · **TÉCNICO (verificado)**.

## Regras

1. O escopo vem só de `GROUP_SCOPE.md` e da seção Decidido de `GROUP-DECISIONS.md`. Se uma tarefa
   depender de uma pendência (número de fases, final, jump de impulso, flechas e inimigos,
   integração dos elementos 3D, controles etc.), pare e diga que falta decisão do grupo.
2. Não decida pelo grupo: mecânicas, fases, arte, divisão de tarefas, workflow Git e cronograma são
   decisões do grupo.
3. Valores de física, distâncias e tempos são tuning: implementar, testar, ajustar. Não registrar
   números "finais" nos docs.
4. Binários (`*.blend`, `*.glb`, `*.png`, `*.wav`, `*.ogg`) só via Git LFS. Nunca commitar
   `.blend1`, renders, `.venv` ou `.env`.
5. Dependências Python só no `.venv` do projeto, fixadas com `==` em `requirements*.txt`. Não
   instalar pacotes de sistema nem serviços.
6. Não criar remoto, fazer push, alterar configurações do GitHub nem reescrever histórico sem pedido
   explícito.
7. Antes de concluir uma mudança de código, rode os testes (abaixo).
8. Ao fim de uma mudança relevante, atualize `docs/CURRENT_STATE.md` e `docs/CHANGELOG.md`.

## Comandos

```bash
python3.12 -m venv .venv && .venv/bin/pip install -r requirements-dev.txt   # ambiente
.venv/bin/python main.py                                                    # rodar (ESC fecha)
.venv/bin/python -m pytest                                                  # testes
```

Sem tela (CI, terminal remoto): `SDL_VIDEODRIVER=dummy`.
