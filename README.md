# Icarus

Jogo de plataforma vertical inspirado no mito de Ícaro, desenvolvido em grupo para a disciplina de
Computação Gráfica (UNIFAL-MG).

**Primeira vez aqui?** Siga o guia [Como começar](docs/COMO-COMECAR.md): ele mostra como instalar
o Git e o Godot, baixar o projeto, abrir no Godot e enviar a sua primeira mudança.

## O jogo

O jogador controla Ícaro e sobe pulando de plataforma em plataforma até alcançar o céu. O salto é
automático: A e D movem Ícaro para os lados, e o clique do mouse dispara flechas contra os
inimigos.

No caminho há plataformas fixas, móveis e instáveis, que quebram ao serem pisadas; plataformas
pula-pula; itens que dão poderes temporários, como mais velocidade ou mais altura de salto; e
obstáculos cada vez mais difíceis. O score (pontuação) é a altura alcançada.

Não há fases nem checkpoint: a subida é contínua, e o cenário de fundo muda ao longo dela — Terra
(Creta), Cidade, Subida para o céu, Nuvens e Céu. Cair das plataformas é derrota. Não existe
vitória: ao chegar ao céu, o jogo termina com uma cutscene (cena animada) em que o sol derrete as
asas e Ícaro cai. Ícaro, as plataformas e os inimigos são objetos 3D modelados no Blender; os
cenários de fundo são 2D.

O texto do grupo, como foi escrito, está em [`docs/GROUP_SCOPE.md`](docs/GROUP_SCOPE.md) e no
complemento [`docs/GROUP_SCOPE_COMPLEMENT.md`](docs/GROUP_SCOPE_COMPLEMENT.md). Onde os dois
diferem, vale o complemento.

## Estado atual

**Projeto base.** O repositório tem um projeto Godot 4.7.2 mínimo: uma cena principal sem nada
do jogo, que só fecha com ESC. Nenhuma mecânica do jogo foi implementada, e a divisão das tarefas por pessoa só
está feita para a Programação (G-012). Detalhes em [`docs/CURRENT_STATE.md`](docs/CURRENT_STATE.md).

## Onde está cada coisa

| Pergunta | Onde |
|---|---|
| Como instalo e começo a contribuir? | [`docs/COMO-COMECAR.md`](docs/COMO-COMECAR.md) |
| O que o grupo já decidiu e o que falta decidir? | [`docs/GROUP-DECISIONS.md`](docs/GROUP-DECISIONS.md) |
| Por que cada decisão foi tomada, em ordem? | [`docs/DECISIONS.md`](docs/DECISIONS.md) |
| O que já existe no projeto? | [`docs/CURRENT_STATE.md`](docs/CURRENT_STATE.md) |
| O que mudou e quando? | [`docs/CHANGELOG.md`](docs/CHANGELOG.md) |
| O texto original do grupo | [`docs/GROUP_SCOPE.md`](docs/GROUP_SCOPE.md) e [`docs/GROUP_SCOPE_COMPLEMENT.md`](docs/GROUP_SCOPE_COMPLEMENT.md) |
| Regras para agentes de IA (Claude Code) | [`CLAUDE.md`](CLAUDE.md) |

O que ainda falta o grupo decidir: a divisão das tarefas dos outros 4 integrantes, duração da
partida, quais são os poderes temporários, o que aparece depois da cutscene final, o que acontece
quando um inimigo atinge Ícaro, a câmera e o formato do modelo 3D. A lista fica em
[Pendências do grupo](docs/GROUP-DECISIONS.md#pendente).

### Como ler os documentos

- **DECIDIDO (grupo)**: o grupo já decidiu.
- **PENDENTE (grupo)**: ainda falta o grupo decidir.
- **TÉCNICO (verificado)**: fato técnico conferido no próprio repositório, como "o projeto abre no
  Godot 4.7.2". Não decide nada sobre o jogo.
- **G-001, G-002…**: o número de cada decisão do grupo, na ordem em que foi registrada. A lista
  completa está em [`docs/DECISIONS.md`](docs/DECISIONS.md).

## Áreas de trabalho

O documento de escopo divide o trabalho em três áreas. A Programação fica com Gabriel e Guilherme
Falcucci (G-012); a divisão dos outros 4 integrantes ainda está **pendente**.

| Área | Responsabilidades (documento do grupo) | Responsáveis |
|---|---|---|
| Arte | personagem Ícaro; plataformas fixas, móveis e instáveis; jump de impulso (plataforma pula-pula, G-007); fundo das fases (não há fases: são os cenários de fundo, G-005) | pendente |
| Programação | jump automático; disparo de flechas; score pela altura; ~~tela de vitória ao chegar à altura final~~ (não existe vitória: o jogo termina com a cutscene da queda, G-006); queda de Ícaro ao errar | Gabriel e Guilherme Falcucci (G-012) |
| Design | design das plataformas, do personagem e dos inimigos; tela inicial; tela final | pendente |

## Como contribuir

O grupo decidiu que cada integrante trabalha na sua própria branch, para não quebrar a `main`
(G-011). O caminho é: atualizar a `main`, criar uma branch, fazer commits, enviar a branch (push)
e abrir um Pull Request para a `main`. O passo a passo, com os comandos, está em
[Como começar → O dia a dia](docs/COMO-COMECAR.md#6-o-dia-a-dia).

Não faça push direto na `main`. Quem revisa e aprova os Pull Requests: Gabriel e Guilherme
Falcucci (G-012).

## Estrutura de pastas

```text
project.godot     configuração do projeto Godot
scenes/           cenas (.tscn); main.tscn é a cena principal
scripts/          scripts GDScript (.gd)
assets/models/    modelos 3D do Blender (.blend, .glb) — Git LFS
assets/textures/  texturas (.png) — Git LFS
assets/audio/     sons (.wav, .ogg) — Git LFS
docs/             guia, escopo, decisões e estado do projeto
```

O Godot cria arquivos `.import` e `.uid` ao lado dos recursos: eles vão para o Git junto com o
recurso. A pasta `.godot/` é cache local e fica fora do Git.

## Ferramentas

| Ferramenta | Uso |
|---|---|
| [Godot 4.7.2](https://godotengine.org/) | engine do jogo; todos usam esta mesma versão |
| GDScript | linguagem dos scripts |
| [Blender](https://www.blender.org/) | modelagem dos elementos 3D |
| [Git LFS](https://git-lfs.com/) | guarda os arquivos grandes: `.blend`, `.glb`, `.png`, `.wav` e `.ogg` |

A escolha da engine e os motivos estão em [`docs/DECISIONS.md`](docs/DECISIONS.md) (G-002). Use
exatamente o Godot 4.7.2: abrir o projeto em outra versão 4.x faz o Godot avisar e regravar
arquivos do projeto.

## Para quem usa o terminal

No Linux (Fedora), o Godot 4.7.2 pode vir do Flathub (`org.godotengine.Godot`). Confira a versão
com `flatpak run org.godotengine.Godot --version`.

```bash
git lfs install
git clone https://github.com/gabrielhsp-sys/icarus.git
cd icarus
godot --path . --editor            # abre o editor
godot --path .                     # roda o jogo
godot --headless --path . --import # importa recursos e gera .uid/.import
godot --headless --path . --quit   # validação sem janela (deve sair com código 0)
```

Com o Godot do Flathub, troque `godot` por `flatpak run org.godotengine.Godot`.
