# Changelog

## 2026-09-28 — vibe indie: apresentação, game feel e recorde (provisório)

- correção de G-018: por um instante depois do dano (`TEMPO_SEM_QUIQUE_DEPOIS_DO_DANO`), Ícaro não
  quica nas plataformas, então o empurrão leva ele para baixo de verdade
- identidade visual: toon shading e contorno próprios (sem plugin), paleta por cenário no fundo
  provisório, na luz, na névoa e na saturação, sol mais quente e forte na subida, bloom perto do
  céu, vinheta, partículas ao fundo
- formas provisórias novas em `.glb`, feitas por script no Blender: Ícaro com asas de penas, as
  quatro plataformas chanfradas, inimigo genérico com olhos e flecha
- game feel: squash & stretch, inclinação e virada de Ícaro, rastro e aura dos poderes, poeira e
  afundada no pouso, "boing" do pula-pula, instável que treme e se parte, câmera que antecipa a
  subida, tremor por trauma, FOV no impulso, rastro da flecha, hit stop, inimigo que estoura,
  flash vermelho e "-50" no dano, "pop" na coleta, barra de tempo do poder
- vontade de jogar de novo: recorde de score e de altura salvo no computador, marcas no cenário na
  altura do recorde e da partida anterior, faixa com o nome do cenário, aviso de novo recorde,
  reinício rápido depois da tela preta com texto de altura e recorde (provisório, para o grupo
  aprovar)
- interface e texto: fonte Lilita One (OFL), tema com botões que respondem ao mouse, tela inicial
  com título animado, Ícaro em loop e recorde, score em contagem animada, créditos rolando, frases
  curtas do mito num arquivo só (`scripts/textos.gd`)
- cutscene final: câmera lenta, clarão do sol, chamas maiores, câmera acompanhando a queda e uma
  frase final
- sons: ganchos novos (`pula_pula`, `acerto`, `recorde`, `clique`) e música de fundo em loop
  (`musica`), todos em silêncio sem arquivo
- cada camada tem liga/desliga em `scripts/ajustes.gd`, incluindo reduzir tremor e reduzir flashes
- testes: 14 novos de regra (janela sem quique, recorde, arquivo do recorde, marcas, contagem do
  score), 32 no total; o teste de fumaça confere também o empurrão, o recorde salvo e a marca
- `docs/GAME-FEEL.md` novo (referências e o que cada uma ensina); `ARQUITETURA.md` com a tabela de
  efeitos e como desligar, textos, fonte, tema e onde fica o recorde
- este registro restaura as entradas "protótipo base" e "guia de instalação", que tinham saído do
  arquivo na resolução do conflito do merge do PR #5

## 2026-09-27 — protótipo base

- protótipo jogável com arte provisória, com tudo o que o grupo decidiu: tela inicial com "Jogar",
  Ícaro com A e D e salto automático, plataformas fixa, móvel, instável e pula-pula geradas até o
  céu com dificuldade crescente, flecha com o clique do mouse, inimigo provisório, contato com
  perda de pontos, empurrão e invulnerabilidade, três poderes em itens 2D, HUD com score e poder,
  5 fundos com fade, tela preta e reinício ao cair, cutscene final, créditos com o score
- `project.godot`: janela 1920×1080, autoloads, Input Map, nomes das camadas de física, cena
  principal na tela inicial; `scenes/main.tscn` e `scripts/main.gd` removidos
- `scripts/ajustes.gd`: todos os números de ajuste num lugar só
- `scripts/logica/` com testes de regra em `scripts/testes/` (18) e um teste de fumaça do fluxo
  inteiro (24 etapas), todos sem janela
- `assets/models/_provisorio/icaro_provisorio.glb`: Ícaro provisório low poly feito no Blender por
  script
- `docs/ARQUITETURA.md` novo; README, `CLAUDE.md` e `CURRENT_STATE.md` apontam para ele

## 2026-09-27 — guia de instalação

- `COMO-COMECAR.md`: o guia do Windows que o grupo recebeu virou a parte principal (GitHub Desktop
  ou Git Bash, Godot 4.7.2, abrir o projeto, dia a dia em branch); ficaram o convite do GitHub e o
  passo que aponta para a tabela do README; quem aprova os Pull Requests: Gabriel e Guilherme
  Falcucci (G-012)
- `README.md`: "Para quem usa o terminal" dividido em Linux (Flathub, comandos completos,
  conferidos em 2026-09-27) e Windows (Git Bash, pelo caminho do `.exe`, opcional)
- `README.md`: "Guia rápido → Todo dia" passou a só apontar para o passo a passo do
  `COMO-COMECAR.md`, com as mesmas três regras

## 2026-09-27 — decisões finais do grupo (G-013 a G-024)

- `DECISIONS.md`: G-013 a G-024 — divisão de tarefas, câmera em perspectiva, modelos em `.glb`,
  sem limite de tempo, três poderes (velocidade, pulo alto, escudo), inimigo que encosta em Ícaro,
  cutscene final com créditos e score, tela preta e reinício ao cair, estilo low poly cartoon,
  fundos PNG 1920×1080 com fade, animações com a equipe de Modelos 3D, sons autorais. Marcado o que
  foi substituído: os "outros bônus" e a tela de derrota do documento original
- `GROUP-DECISIONS.md`: as decisões foram para Decidido; Pendente ficou só com os inimigos (tipo,
  quantidade e movimento), que a equipe de Modelos 3D decide
- `README.md`: "Guia rápido" no topo (primeira vez, uso diário no GitHub Desktop e no Git Bash,
  onde colocar cada coisa, estilo visual, quem faz o quê); saíram "Áreas de trabalho" e "Como
  contribuir", que o guia substitui; resumo do jogo atualizado
- `COMO-COMECAR.md`: passo 7 aponta para a tabela de pastas e padrões no README
- `CURRENT_STATE.md` e `CLAUDE.md`: resumo das decisões e a única pendência

## 2026-09-25 — base técnica e revisores de Pull Request

- `project.godot` e `scenes/main.tscn` salvos pelo Godot 4.7.2 (sem janela, `ResourceSaver.save` e
  `ProjectSettings.save`): `config/features=PackedStringArray("4.7")` gravado e `load_steps`
  retirado da cena. Validação `--headless --quit`: código 0, sem ERROR/WARNING
- `.gitattributes`: Git LFS também para `*.jpg`, `*.jpeg`, `*.mp3`, `*.ttf`, `*.otf` e `*.fbx`
- `.gitignore`: sem a sobra de Python (`.venv/`); exports `*.exe`, `*.x86_64`, `*.apk`, `*.aab`,
  `*.dmg` e `/*.zip` ignorados
- `DECISIONS.md`: G-012 (Gabriel e Guilherme Falcucci revisam e aprovam os Pull Requests e ficam
  com a Programação); a nota de G-002 não cita mais uma "pendência 7" inexistente
- `GROUP-DECISIONS.md`: "como as branches são juntadas na `main`" foi para Decidido (G-012); divisão
  por pessoa parcialmente decidida; câmera e formato do modelo 3D entraram em Pendente, com as
  propostas marcadas como propostas
- `README.md`, `COMO-COMECAR.md`, `CLAUDE.md` e `CURRENT_STATE.md`: revisores de Pull Request
  (G-012) no lugar de "pendente"

## 2026-09-25 — auditoria de usabilidade da documentação

- `COMO-COMECAR.md` novo: guia para quem nunca usou Git nem Godot (acesso ao repositório privado,
  GitHub Desktop ou Git para Windows, nome e e-mail noreply, clone fora do OneDrive, Godot 4.7.2
  normal e não "mono", branch, commit, push e Pull Request)
- `README.md` reorganizado para quem chega: link para o guia no topo, tabela "Onde está cada
  coisa", explicação dos rótulos e dos IDs G-00N, clone por HTTPS em vez de SSH, e a tabela de
  áreas marcando o que o complemento substituiu (fases, tela de vitória, jump de impulso)
- `GROUP-DECISIONS.md`: a fonte do escopo passa a citar também o complemento
- `CURRENT_STATE.md`: tipo do nó raiz e câmera descritos como ainda não definidos
- `CLAUDE.md`: pendências apontadas para `GROUP-DECISIONS.md` em vez de repetidas; regra de
  branch e Pull Request (G-011); "fases" trocado por "cenários"

## 2026-09-25 — complemento de decisões do grupo

- complemento do grupo ao documento de escopo transcrito em `GROUP_SCOPE_COMPLEMENT.md`;
  `GROUP_SCOPE.md` ganhou só uma nota no cabeçalho apontando para ele
- `DECISIONS.md`: G-004 a G-011 (3D, estrutura contínua, final, pula-pula, flechas e inimigos,
  controles, checkpoint, branches); fases, vitória e tela de vitória do documento original marcadas
  como substituídas; nota em G-002 de que o documento do grupo agora também registra a engine
- `GROUP-DECISIONS.md`: respostas movidas para Decidido; Pendente reduzido aos 6 itens que o grupo
  deixou em aberto; os pontos técnicos de organização ainda não discutidos foram para "Para levar ao
  grupo"
- `README.md` e `CURRENT_STATE.md`: resumo do jogo sem fases e sem vitória; README ganhou a seção
  "Como contribuir" (branch, Pull Request, sem push direto na `main`)
- `CLAUDE.md`: lista de pendências e regra sobre 2D/3D atualizadas

## 2026-09-25 — Godot 4.7.2 fixado e projeto base validado

- versão do projeto fixada em Godot 4.7.2 para todos (README, `DECISIONS.md` G-002,
  `GROUP-DECISIONS.md`)
- projeto base validado sem janela no Godot 4.7.2: `--import`, `--quit` e `--check-only` com código 0
- `scripts/main.gd.uid` gerado pelo Godot e versionado

## 2026-09-25 — Godot 4 + GDScript

- engine e linguagem decididas por delegação do grupo: Godot 4 + GDScript (`DECISIONS.md` G-002,
  com a justificativa); substituem o trecho do documento de escopo que citava Python e "gamepy"
- bootstrap Python removido; novo projeto base Godot: `project.godot`, `scenes/main.tscn` vazia e
  `scripts/main.gd` (ESC fecha), pastas `scenes/`, `scripts/` e `assets/{models,textures,audio}/`
- `.gitignore` do Godot 4 e `.gitattributes` com LF e Git LFS para os binários
- `DECISIONS.md` recomeçado; pendência da engine fechada em `GROUP-DECISIONS.md`; a pendência sobre
  o 3D passa a ser "como os elementos 3D entram no jogo"
- `README.md` e `CLAUDE.md` reescritos

## 2026-09-25 — repositório reorganizado como projeto do grupo

- documentação reduzida ao escopo aprovado pelo grupo e a fatos técnicos verificados; documentos
  de pré-produção que o grupo não aprovou foram removidos (continuam no histórico do Git, até o
  commit `04979aa`)
- `DECISIONS.md` recomeçado como registro do grupo; `GROUP-DECISIONS.md` reescrito com os rótulos
  DECIDIDO (grupo), PENDENTE (grupo) e TÉCNICO (verificado)
- engine provisória em Python, substituída no mesmo dia pela entrada acima
- `README.md` e `CLAUDE.md` reescritos

As entradas anteriores estão no histórico do Git, até o commit `04979aa`.
