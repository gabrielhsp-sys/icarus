# Estado atual

Atualizado em: 2026-09-25

## Escopo e engine

- escopo: **DECIDIDO (grupo)** em 2026-09-25, sujeito a alteração — [`GROUP_SCOPE.md`](GROUP_SCOPE.md)
- engine e linguagem: **Godot 4 + GDScript**, DECIDIDO (grupo) por delegação — [`DECISIONS.md`](DECISIONS.md) G-002
- 7 pendências de escopo e a organização do trabalho em [`GROUP-DECISIONS.md`](GROUP-DECISIONS.md#pendente)

## Projeto — TÉCNICO

- `project.godot`: nome "Icarus", cena principal `res://scenes/main.tscn`
- `scenes/main.tscn`: nó raiz `Node` (nem 2D nem 3D), com `scripts/main.gd`, que fecha o jogo com ESC
- pastas `scenes/`, `scripts/`, `assets/models/`, `assets/textures/`, `assets/audio/`
- `.gitignore` do Godot 4 (`.godot/`, `/android/`, saídas de exportação)
- Git LFS para `*.blend`, `*.glb`, `*.png`, `*.wav` e `*.ogg`, verificado com `git check-attr`;
  nenhum binário versionado ainda
- nenhuma mecânica de jogo implementada

## Não verificado

- **abertura do projeto no Godot**: o Godot não estava instalado na máquina onde o projeto base foi
  criado, então `godot --headless --path . --quit` ainda não foi executado. Até alguém rodar esse
  comando e obter código 0, o projeto base conta como não validado.

## Próximos passos

Dependem do grupo — ver [Pendências](GROUP-DECISIONS.md#pendente):

- decidir como os elementos 3D entram no jogo (7): isso define o tipo do nó raiz e da câmera
- responder às pendências de escopo, principalmente fases × cenários (1)
- definir quem faz cada área (5) e a versão exata do Godot 4 que todos vão usar
