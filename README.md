# Icarus

Jogo de plataforma vertical inspirado no mito de Ícaro, desenvolvido em grupo para a disciplina de
Computação Gráfica (UNIFAL-MG).

## O jogo

O jogador controla Ícaro e sobe pulando de plataforma em plataforma até alcançar o céu. O salto é
automático: A e D movem Ícaro para os lados, e o clique do mouse dispara flechas contra os
inimigos. No caminho há plataformas fixas, móveis e instáveis, que quebram ao serem pisadas;
plataformas pula-pula; itens que concedem poderes temporários, como mais velocidade ou mais altura
de salto; e obstáculos cada vez mais difíceis. O score é a altura alcançada.

Não há fases nem checkpoint: a subida é contínua, e o cenário de fundo muda ao longo dela — Terra
(Creta), Cidade, Subida para o céu, Nuvens e Céu. Cair das plataformas é derrota. Não existe
vitória: ao chegar ao céu, o jogo termina com uma cutscene em que o sol derrete as asas e Ícaro
cai. Ícaro, as plataformas e os inimigos são objetos 3D modelados no Blender; os cenários de fundo
são 2D.

O escopo, como o grupo escreveu, está em [`docs/GROUP_SCOPE.md`](docs/GROUP_SCOPE.md) e no
complemento [`docs/GROUP_SCOPE_COMPLEMENT.md`](docs/GROUP_SCOPE_COMPLEMENT.md), que vale onde os
dois diferem.

## Estado atual

**Projeto base.** O repositório tem um projeto Godot 4.7.2 mínimo: uma cena principal vazia que
fecha com ESC, validada sem janela. Nenhuma mecânica de jogo foi implementada. Detalhes em
[`docs/CURRENT_STATE.md`](docs/CURRENT_STATE.md).

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

A tabela repete o documento original. A tela de vitória foi substituída pelo complemento: não
existe vitória, e o jogo termina com a cutscene da queda de Ícaro ([`docs/DECISIONS.md`](docs/DECISIONS.md)
G-006).

## Como contribuir

O grupo decidiu que cada integrante trabalha na sua própria branch, para não quebrar a `main`
([`docs/DECISIONS.md`](docs/DECISIONS.md) G-011).

1. Atualize a `main` e crie a sua branch a partir dela:

   ```bash
   git switch main
   git pull
   git switch -c <nome-da-sua-branch>
   ```

2. Faça commits pequenos na sua branch e envie-a para o GitHub:

   ```bash
   git push -u origin <nome-da-sua-branch>
   ```

3. No GitHub, abra um **Pull Request** da sua branch para a `main`.

Não faça push direto na `main`. Quem revisa e aprova os Pull Requests, e como o merge é feito,
ainda está **pendente** ([Pendências do grupo](docs/GROUP-DECISIONS.md#pendente)).

## Documentação

| Documento | Conteúdo |
|---|---|
| [`docs/GROUP_SCOPE.md`](docs/GROUP_SCOPE.md) | escopo do jogo (transcrição do documento do grupo) |
| [`docs/GROUP_SCOPE_COMPLEMENT.md`](docs/GROUP_SCOPE_COMPLEMENT.md) | complemento do grupo ao escopo (transcrição); vale onde difere do original |
| [`docs/GROUP-DECISIONS.md`](docs/GROUP-DECISIONS.md) | o que está decidido e o que está **pendente** |
| [`docs/DECISIONS.md`](docs/DECISIONS.md) | registro cronológico das decisões |
| [`docs/CURRENT_STATE.md`](docs/CURRENT_STATE.md) | estado atual do projeto |
| [`docs/CHANGELOG.md`](docs/CHANGELOG.md) | histórico de mudanças |

As questões em aberto — divisão das tarefas por pessoa, duração da partida, poderes temporários,
o que aparece depois da cutscene final, o que acontece quando um inimigo atinge Ícaro e como as
branches são juntadas na `main` — estão em [Pendências do grupo](docs/GROUP-DECISIONS.md#pendente).
