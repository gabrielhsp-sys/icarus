# Icarus

Jogo de plataforma vertical inspirado no mito de Ícaro, desenvolvido em grupo para a disciplina de
Computação Gráfica (UNIFAL-MG).

## O jogo

O jogador controla Ícaro e sobe pulando de plataforma em plataforma, com saltos automáticos, até
alcançar o céu. No caminho há plataformas fixas, móveis e instáveis, que quebram ao serem pisadas;
itens que concedem poderes temporários, como mais velocidade ou mais altura de salto; e obstáculos
cada vez mais difíceis. O score é a altura alcançada.

A subida atravessa fases temáticas, da Terra (Creta) até o Céu, cada uma mais difícil que a
anterior. Cair das plataformas é derrota; alcançar o céu completa o jogo. O jogo tem elementos 3D
modelados no Blender.

O escopo completo, como o grupo escreveu, está em [`docs/GROUP_SCOPE.md`](docs/GROUP_SCOPE.md).

## Estado atual

**Projeto base.** O repositório tem um projeto Godot 4.7.2 mínimo: uma cena principal vazia que
fecha com ESC, validada sem janela. Nenhuma mecânica de jogo foi implementada, e ainda não está decidido como os elementos 3D
entram no jogo. Detalhes em [`docs/CURRENT_STATE.md`](docs/CURRENT_STATE.md).

## Stack

| Item | Uso |
|---|---|
| [Godot 4.7.2](https://godotengine.org/) | engine do jogo; todos usam esta mesma versão |
| GDScript | linguagem dos scripts |
| [Blender](https://www.blender.org/) | modelagem dos elementos 3D |
| Git LFS | versionamento de `.blend`, `.glb`, `.png`, `.wav` e `.ogg` |

A escolha e os motivos estão em [`docs/DECISIONS.md`](docs/DECISIONS.md) (G-002).

## Como abrir o projeto

Pré-requisitos: Git, [Git LFS](https://git-lfs.com/) e **Godot 4.7.2**
([site oficial](https://godotengine.org/download) ou Flathub, `org.godotengine.Godot`). Use exatamente
essa versão: o formato dos arquivos do projeto muda entre versões 4.x.

```bash
git lfs install
git clone git@github.com:gabrielhsp-sys/icarus.git
```

No Godot, em **Gerenciador de Projetos → Importar**, selecione o arquivo `project.godot` da pasta
clonada. Com o projeto aberto, **F5** roda o jogo; ESC fecha.

Pelo terminal:

```bash
godot --path . --editor          # abre o editor
godot --path .                   # roda o jogo
godot --headless --path . --import # importa recursos e gera .uid/.import
godot --headless --path . --quit # validação sem janela (deve sair com código 0)
```

Com a instalação pelo Flathub, troque `godot` por `flatpak run org.godotengine.Godot`.

## Estrutura

```text
project.godot     configuração do projeto Godot
scenes/           cenas (.tscn); main.tscn é a cena principal
scripts/          scripts GDScript (.gd)
assets/models/    modelos do Blender (.blend, .glb) — Git LFS
assets/textures/  texturas (.png) — Git LFS
assets/audio/     sons (.wav, .ogg) — Git LFS
docs/             escopo, decisões e estado do projeto
```

O Godot gera arquivos `.import` e `.uid` ao lado dos recursos: eles vão para o Git. A pasta
`.godot/` é cache local e fica fora do Git.

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
pessoa, como o 3D entra no jogo, entre outras — estão em
[Pendências do grupo](docs/GROUP-DECISIONS.md#pendente).
