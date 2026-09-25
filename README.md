# Icarus

Jogo de plataforma vertical inspirado no mito de Ícaro, desenvolvido em grupo para a disciplina de
Computação Gráfica (UNIFAL-MG).

## O jogo

O jogador controla Ícaro e sobe pulando de plataforma em plataforma, com saltos automáticos, até
alcançar o céu. No caminho há plataformas fixas, móveis e instáveis, que quebram ao serem pisadas;
itens que concedem poderes temporários, como mais velocidade ou mais altura de salto; e obstáculos
cada vez mais difíceis. O score é a altura alcançada.

A subida atravessa fases temáticas, da Terra (Creta) até o Céu, cada uma mais difícil que a
anterior. Cair das plataformas é derrota; alcançar o céu completa o jogo. A base é 2D, com
elementos 3D modelados no Blender complementando o visual dos cenários.

O escopo completo, como o grupo escreveu, está em [`docs/GROUP_SCOPE.md`](docs/GROUP_SCOPE.md).

## Estado atual

**Bootstrap.** O repositório tem uma janela pygame que abre, roda o loop e fecha com ESC, e um teste
de fumaça automatizado. Nenhuma mecânica de jogo foi implementada. Detalhes em
[`docs/CURRENT_STATE.md`](docs/CURRENT_STATE.md).

## Stack

| Item | Uso |
|---|---|
| Python 3.12 | linguagem do jogo (ver `.python-version`) |
| pygame 2.6.1 | engine atual, provisória: o grupo pode alterar |
| Blender | modelagem dos elementos 3D; como eles entram no jogo ainda está pendente |
| pytest | testes automatizados |
| Git LFS | versionamento de `.blend`, `.glb`, `.png`, `.wav` e `.ogg` |

## Como instalar

Pré-requisitos: Python 3.12, Git e [Git LFS](https://git-lfs.com/).

```bash
git lfs install
git clone git@github.com:gabrielhsp-sys/icarus.git
cd icarus
python3.12 -m venv .venv
.venv/bin/pip install -r requirements-dev.txt
```

No Windows, use `py -3.12 -m venv .venv` e troque `.venv/bin/` por `.venv\Scripts\` nos comandos.

## Como rodar

```bash
.venv/bin/python main.py
```

ESC ou o botão de fechar encerra o jogo.

Testes:

```bash
.venv/bin/python -m pytest
```

## Estrutura

```text
main.py          ponto de entrada
game/app.py      bootstrap pygame: janela, loop e saída com ESC
tests/           testes automatizados (pytest)
assets/models/   arquivos usados pelo jogo (via Git LFS)
blender/         arquivos-fonte .blend (via Git LFS)
docs/            escopo, decisões e estado do projeto
```

## Áreas de trabalho

O grupo divide o trabalho em três áreas, conforme o documento de escopo. Quem faz cada área
ainda está **pendente**.

| Área | Responsabilidades (documento do grupo) | Responsáveis |
|---|---|---|
| Arte | personagem Ícaro; plataformas fixas, móveis e instáveis; jump de impulso; fundo das fases | pendente |
| Programação | jump automático; disparo de flechas; score pela altura; tela de vitória ao chegar à altura final; queda de Ícaro ao errar | pendente |
| Design | design das plataformas, do personagem e dos inimigos; tela inicial; tela final | pendente |

## Documentação

| Documento | Conteúdo |
|---|---|
| [`docs/GROUP_SCOPE.md`](docs/GROUP_SCOPE.md) | escopo do jogo (transcrição do documento do grupo) |
| [`docs/GROUP-DECISIONS.md`](docs/GROUP-DECISIONS.md) | o que está decidido e o que está **pendente** |
| [`docs/DECISIONS.md`](docs/DECISIONS.md) | registro cronológico das decisões |
| [`docs/CURRENT_STATE.md`](docs/CURRENT_STATE.md) | estado atual do projeto |
| [`docs/CHANGELOG.md`](docs/CHANGELOG.md) | histórico de mudanças |

As questões em aberto — número de fases, final, jump de impulso, flechas e inimigos, divisão por
pessoa, integração dos elementos 3D, entre outras — estão em
[Pendências do grupo](docs/GROUP-DECISIONS.md#pendente).
