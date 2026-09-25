# Estado atual

Atualizado em: 2026-09-25

## Escopo e engine

- escopo: **DECIDIDO (grupo)** em 2026-09-25, sujeito a alteração — [`GROUP_SCOPE.md`](GROUP_SCOPE.md)
  e o complemento [`GROUP_SCOPE_COMPLEMENT.md`](GROUP_SCOPE_COMPLEMENT.md), que vale onde os dois
  diferem ([`DECISIONS.md`](DECISIONS.md) G-004 a G-011)
- o jogo: subida vertical contínua, **sem fases** e sem checkpoint; o cenário de fundo muda ao
  longo da subida (Terra/Creta, Cidade, Subida para o céu, Nuvens, Céu). Salto automático; A e D
  movem Ícaro; clique do mouse dispara flechas. Cair é derrota; **não existe vitória**: ao chegar
  ao céu, cutscene em que o sol derrete as asas e Ícaro cai
- 3D: Ícaro, plataformas e inimigos são objetos 3D; os cenários de fundo são 2D (G-004)
- engine e linguagem: **Godot 4 + GDScript**, DECIDIDO (grupo) por delegação — [`DECISIONS.md`](DECISIONS.md) G-002;
  o complemento do grupo também a registra
- versão do projeto: **Godot 4.7.2**, a mesma para todos
- trabalho em branch por integrante (G-011); como as branches entram na `main` é pendente
- 6 pendências do grupo em [`GROUP-DECISIONS.md`](GROUP-DECISIONS.md#pendente)
- guia para integrantes novos (Windows, Git, Godot 4.7.2, branch e Pull Request):
  [`COMO-COMECAR.md`](COMO-COMECAR.md)

## Projeto — TÉCNICO

- `project.godot`: nome "Icarus", cena principal `res://scenes/main.tscn`
- `scenes/main.tscn`: nó raiz `Node` (nem 2D nem 3D), com `scripts/main.gd`, que fecha o jogo com ESC;
  `scripts/main.gd.uid` gerado pelo Godot e versionado
- pastas `scenes/`, `scripts/`, `assets/models/`, `assets/textures/`, `assets/audio/`
- `.gitignore` do Godot 4 (`.godot/`, `/android/`, saídas de exportação)
- Git LFS para `*.blend`, `*.glb`, `*.png`, `*.wav` e `*.ogg`, verificado com `git check-attr`;
  nenhum binário versionado ainda
- nenhuma mecânica de jogo implementada

## Validação — TÉCNICO (verificado)

Em 2026-09-25, com Godot 4.7.2 (Flathub), sem janela:

- `godot --headless --path . --import`: código 0; gerou `scripts/main.gd.uid`
- `godot --headless --path . --quit`: código 0, sem erros nem avisos na saída
- `godot --headless --path . --check-only --script res://scripts/main.gd`: código 0
- `.godot/` criado pelo editor e ignorado pelo Git (`git check-ignore`)

## Próximos passos

Dependem do grupo — ver [Pendências](GROUP-DECISIONS.md#pendente):

- dividir as tarefas por pessoa (1)
- definir quem revisa e aprova os Pull Requests na `main` (6)
- definir os poderes temporários (3), a duração da partida (2), o que aparece depois da cutscene
  final (4) e o que acontece quando um inimigo atinge Ícaro (5)

Ainda não definido: a cena principal tem nó raiz `Node`, que não é 2D nem 3D. O tipo do nó raiz
e a câmera do jogo ainda não foram definidos.
