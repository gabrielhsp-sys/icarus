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

- **protótipo jogável** com arte provisória: tela inicial → partida → cutscene final → créditos →
  tela inicial; mapa das cenas, números de ajuste e como trocar cada peça em
  [`ARQUITETURA.md`](ARQUITETURA.md)
- `project.godot`: cena principal `res://scenes/telas/tela_inicial.tscn`; janela 1920×1080 (G-022),
  escala `canvas_items`, proporção mantida; autoloads `Partida`, `Sons` e `Telas`; ações
  `mover_esquerda` (A), `mover_direita` (D) e `atirar` (botão esquerdo **e** direito do mouse);
  nomes das camadas de física
- mundo 3D travado no plano do jogo (z = 0), câmera em perspectiva que só sobe (G-014)
- uma cena por elemento; cada elemento 3D tem um nó `Visual` com a forma provisória
- todos os números de ajuste da jogabilidade em `scripts/ajustes.gd` — valores iniciais, para
  testar e mudar; as animações provisórias têm os números no próprio script
- regras sem cena em `scripts/logica/`, com testes em `scripts/testes/`
- Ícaro usa um modelo provisório low poly feito por script no Blender:
  `assets/models/_provisorio/icaro_provisorio.glb` (1,62 m, origem nos pés, Git LFS)
- sons: 6 nomes prontos para arquivos em `assets/audio/`; nenhum som ainda (o jogo fica em silêncio)
- fundos: 5 nomes prontos para PNG em `assets/textures/`; nenhum PNG ainda (cores provisórias)
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

## Validação — TÉCNICO (verificado)

Em 2026-09-27, com Godot 4.7.2 (Flathub), sem janela:

- `--headless --path . --import` e `--headless --path . --quit`: código 0, sem ERROR/WARNING
- `--script res://scripts/testes/rodar_testes.gd`: 18 testes de regra, 0 falhas, código 0
- `--script res://scripts/testes/fumaca_fluxo.gd`: 24 etapas, 0 falhas, código 0, em 3 execuções
  seguidas
- jogo, cutscene e tela inicial rodados com janela por alguns segundos: código 0, sem ERROR/WARNING
- cada cena rodada com `--quit-after 600`: código 0, sem ERROR/WARNING
- o `.glb` provisório importado sem erro; medido no Godot: 1,62 m de altura, pés em y = 0

Só dá para conferir jogando: a sensação do salto e do movimento, a dificuldade, o visual (cores,
câmera, fundo atrás do 3D) e a leitura do HUD. Um caso conhecido para testar jogando: se Ícaro leva
dano logo acima de uma plataforma, o empurrão para baixo o põe nela e o salto automático o joga
para cima de novo.

## Próximos passos

- equipe de Modelos 3D: decidir os inimigos (a única [pendência](GROUP-DECISIONS.md#pendente)) e
  trocar as formas provisórias pelos `.glb`
- equipe de Visual 2D: os 5 fundos, as telas e os itens de poder
- Sons: os 6 arquivos de som
- Programação: ajustar os números jogando
