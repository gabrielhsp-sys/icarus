# Estado atual

Atualizado em: 2026-09-27

## Escopo e engine

- escopo: **DECIDIDO (grupo)** em 2026-09-25, sujeito a alteração — [`GROUP_SCOPE.md`](GROUP_SCOPE.md)
  e o complemento [`GROUP_SCOPE_COMPLEMENT.md`](GROUP_SCOPE_COMPLEMENT.md), que vale onde os dois
  diferem ([`DECISIONS.md`](DECISIONS.md) G-004 a G-011)
- o jogo: subida vertical contínua, **sem fases** e sem checkpoint; o cenário de fundo muda ao
  longo da subida (Terra/Creta, Cidade, Subida para o céu, Nuvens, Céu). Salto automático; A e D
  movem Ícaro; clique do mouse dispara flechas; câmera em perspectiva (G-014); sem limite de tempo
  (G-016). Três poderes temporários: velocidade, pulo alto e escudo (G-017). Inimigo que encosta
  tira pontos, empurra Ícaro para baixo e o deixa invulnerável por um instante; sem barra de vida
  (G-018). Cair leva a uma tela preta e ao reinício, sem tela de derrota (G-020). **Não existe
  vitória**: ao chegar ao céu, cutscene final de Ícaro caindo de costas com as asas queimando,
  depois créditos e score (G-019)
- 3D: Ícaro, plataformas e inimigos são objetos 3D; os cenários de fundo são 2D (G-004)
- estilo visual: low poly cartoon, referência Mario 64, só de estilo (G-021)
- assets: modelos em `.glb`, nome minúsculo sem espaço, 1 unidade = 1 metro (G-015); um fundo PNG
  1920×1080 por cenário, troca com fade (G-022); sons autorais de Gabriel, no FL Studio (G-024).
  Pastas e resumo de uso: [README → Guia rápido](../README.md#guia-rápido)
- engine e linguagem: **Godot 4 + GDScript**, DECIDIDO (grupo) por delegação — [`DECISIONS.md`](DECISIONS.md) G-002;
  o complemento do grupo também a registra
- versão do projeto: **Godot 4.7.2**, a mesma para todos
- trabalho em branch por integrante (G-011); Gabriel e Guilherme Falcucci revisam e aprovam os
  Pull Requests (G-012)
- equipes (G-013, G-023): Modelos 3D (Danilo e Luiz, com as animações de Ícaro e da plataforma
  quebrando), Visual 2D (Diogo e Gabriela), Programação (Gabriel e Guilherme Falcucci), Sons
  (Gabriel)
- 1 pendência do grupo: inimigos (tipo, quantidade e movimento), que a equipe de Modelos 3D decide
  — [`GROUP-DECISIONS.md`](GROUP-DECISIONS.md#pendente)
- guia para integrantes novos (Windows, Git, Godot 4.7.2, branch e Pull Request):
  [`COMO-COMECAR.md`](COMO-COMECAR.md)

## Projeto — TÉCNICO

- `project.godot`: nome "Icarus", cena principal `res://scenes/main.tscn`,
  `config/features=PackedStringArray("4.7")`; projeto e cena já salvos pelo Godot 4.7.2, então o
  primeiro salvamento de um integrante não gera diff nesses dois arquivos
- `scenes/main.tscn`: nó raiz `Node` (nem 2D nem 3D), com `scripts/main.gd`, que fecha o jogo com ESC;
  `scripts/main.gd.uid` gerado pelo Godot e versionado
- pastas `scenes/`, `scripts/`, `assets/models/`, `assets/textures/`, `assets/audio/`
- `.gitignore` do Godot 4 (`.godot/`, `/android/`, saídas de exportação: `/build/`, `/export/`,
  `*.pck`, `*.exe`, `*.x86_64`, `*.apk`, `*.aab`, `*.dmg`, `/*.zip`), backups do Blender,
  `renders/`, `tmp/`, `*.log`, editores e `.env`
- Git LFS para `*.blend`, `*.glb`, `*.png`, `*.jpg`, `*.jpeg`, `*.wav`, `*.ogg`, `*.mp3`, `*.ttf`,
  `*.otf` e `*.fbx`, verificado com `git check-attr`;
  nenhum binário versionado ainda
- nenhuma mecânica de jogo implementada

## Validação — TÉCNICO (verificado)

Em 2026-09-25, com Godot 4.7.2 (Flathub), sem janela:

- `godot --headless --path . --import`: código 0; gerou `scripts/main.gd.uid`
- `godot --headless --path . --quit`: código 0, sem erros nem avisos na saída
- `godot --headless --path . --check-only --script res://scripts/main.gd`: código 0
- `.godot/` criado pelo editor e ignorado pelo Git (`git check-ignore`)

## Próximos passos

- equipe de Modelos 3D: decidir os inimigos (a única [pendência](GROUP-DECISIONS.md#pendente))
- Programação, ao começar: configurar a janela 1920×1080 (G-022) no `project.godot`, que ainda não
  a define

Ainda não definido: a cena principal tem nó raiz `Node`, que não é 2D nem 3D. O tipo do nó raiz
ainda não foi definido.
