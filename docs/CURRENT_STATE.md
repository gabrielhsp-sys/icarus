# Estado atual

Atualizado em: 2026-09-28

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

- **protótipo jogável** com arte provisória: tela inicial → partida → cutscene final → créditos →
  tela inicial; mapa das cenas, números de ajuste e como trocar cada peça em
  [`ARQUITETURA.md`](ARQUITETURA.md)
- `project.godot`: cena principal `res://scenes/telas/tela_inicial.tscn`; janela 1920×1080 (G-022),
  escala `canvas_items`, proporção mantida; autoloads `Partida`, `Sons`, `Telas` e `Efeitos`; tema
  da interface `assets/interface/tema.tres`; ações
  `mover_esquerda` (A), `mover_direita` (D) e `atirar` (botão esquerdo **e** direito do mouse);
  nomes das camadas de física
- mundo 3D travado no plano do jogo (z = 0), câmera em perspectiva que só sobe (G-014)
- uma cena por elemento; cada elemento 3D tem um nó `Visual` com a forma provisória
- todos os números de ajuste da jogabilidade em `scripts/ajustes.gd` — valores iniciais, para
  testar e mudar; as animações provisórias têm os números no próprio script
- regras sem cena em `scripts/logica/`, com testes em `scripts/testes/`
- formas provisórias low poly feitas por script no Blender, em `assets/models/_provisorio/` (Git
  LFS): Ícaro (1,61 m, origem nos pés), as quatro plataformas chanfradas (topo em y = 0), o
  inimigo genérico com olhos e a flecha
- **apresentação provisória** (branch `feat/vibe-indie`): toon shading e contorno, paleta por
  cenário, luz e bloom na subida, game feel (squash, poeira, boing, tremor, hit stop, partículas),
  recorde salvo, marcas de altura, faixa de cenário, fonte Lilita One (OFL), frases do mito e
  cutscene com câmera lenta. Cada camada tem liga/desliga em `scripts/ajustes.gd`; a tabela está
  em [`ARQUITETURA.md`](ARQUITETURA.md#efeitos-e-como-desligar) e as referências em
  [`GAME-FEEL.md`](GAME-FEEL.md)
- recorde em `user://recorde.cfg` (onde fica em cada sistema:
  [`ARQUITETURA.md`](ARQUITETURA.md#onde-fica-o-recorde))
- sons: 10 nomes e a música prontos para arquivos em `assets/audio/`; nenhum som ainda (silêncio)
- fundos: 5 nomes prontos para PNG em `assets/textures/`; nenhum PNG ainda (degradê provisório)
- `.gitignore` do Godot 4 (`.godot/`, `/android/`, saídas de exportação: `/build/`, `/export/`,
  `*.pck`, `*.exe`, `*.x86_64`, `*.apk`, `*.aab`, `*.dmg`, `/*.zip`), backups do Blender,
  `renders/`, `tmp/`, `*.log`, editores e `.env`
- Git LFS para `*.blend`, `*.glb`, `*.png`, `*.jpg`, `*.jpeg`, `*.wav`, `*.ogg`, `*.mp3`, `*.ttf`,
  `*.otf` e `*.fbx`, verificado com `git check-attr`

### Padrões provisórios da Programação

O grupo não decidiu estes pontos. Estão implementados para o protótipo funcionar e podem mudar:

- inimigo genérico: um tipo só, andando de um lado para o outro (tipo, quantidade e movimento são
  a pendência da equipe de Modelos 3D)
- atirar com o botão esquerdo e com o direito do mouse; segurar o botão atira de novo a cada
  intervalo; a flecha vai na direção do cursor
- plataformas atravessáveis por baixo; Ícaro não passa das bordas laterais
- um poder por vez: pegar outro item substitui o poder ativo
- cada inimigo causa um contato por encontro (ao começar a encostar), não um por quadro
- o score nunca fica abaixo de zero
- os 5 cenários dividem a subida em trechos iguais
- o som `asas` toca quando Ícaro começa a andar para o lado e no início da cutscene final
- os créditos listam a divisão de tarefas (G-013); "Voltar ao início" volta à tela inicial
- ESC fecha o jogo em qualquer tela
- nomes dos arquivos de fundo (`fundo_1_terra_creta.png` …) e de som (`pulo.ogg` …)
- todos os números de `scripts/ajustes.gd`
- depois do dano, Ícaro atravessa as plataformas por um instante (`TEMPO_SEM_QUIQUE_DEPOIS_DO_DANO`),
  para o empurrão de G-018 ter efeito
- toda a apresentação e a meta da branch `feat/vibe-indie` (tabela em `ARQUITETURA.md`)

### Para o grupo aprovar

- o texto curto sobre a tela preta ao cair (altura e recorde); G-020 fala só de tela preta e
  reinício. Desliga com `TEXTO_NA_TELA_PRETA = false`
- as frases do mito em `scripts/textos.gd` (desliga com `FRASES = false`)
- a fonte Lilita One (OFL) e o estilo toon com contorno

## Validação — TÉCNICO (verificado)

Em 2026-09-28, com Godot 4.7.2 (Flathub):

- `--headless --path . --import` e `--headless --path . --quit`: código 0, sem ERROR/WARNING
- `--script res://scripts/testes/rodar_testes.gd`: 33 testes de regra, 0 falhas, código 0
- `--script res://scripts/testes/fumaca_fluxo.gd`: 29 etapas, 0 falhas, código 0, em 10 execuções
  seguidas
- recorde salvo numa execução e lido igual numa segunda execução separada
- 7 `.glb` provisórios validados (`validate_glb.py`), importados sem erro e medidos no Godot
- com janela, todos os efeitos ligados, numa AMD Radeon RX 580 com monitor de 180 Hz e V-Sync: jogo
  entre 171 e 180 FPS, cutscene com mínimo de 177, tela inicial em 180

Só dá para conferir jogando: a sensação do salto e do movimento, a dificuldade, se os efeitos
ajudam ou cansam, a leitura do HUD e das faixas, e o desempenho em computadores mais fracos.

## Próximos passos

- equipe de Modelos 3D: decidir os inimigos (a única [pendência](GROUP-DECISIONS.md#pendente)) e
  trocar as formas provisórias pelos `.glb`
- equipe de Visual 2D: os 5 fundos, as telas e os itens de poder
- Sons: os 10 arquivos de som e a música
- Programação: ajustar os números jogando
