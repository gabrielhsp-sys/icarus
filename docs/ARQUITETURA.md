# Arquitetura do protótipo

Como o protótipo está montado e onde mexer para trocar cada peça. As formas, as cores e os números
são provisórios: a ideia é que a Arte, os Sons e o ajuste fino substituam uma peça de cada vez, sem
mexer no resto.

## Idioma do código

Nomes de arquivos, cenas, nós, variáveis e funções em **português, sem acento**, com as mesmas
palavras do README: `plataforma_pula_pula`, `plataforma_instavel`, `item_de_poder`,
`cutscene_final`, `tela_inicial`, `creditos`. Comentários em português normal. O que vem do Godot
(`CharacterBody3D`, `_physics_process`…) continua em inglês.

## Mapa das cenas

Cada elemento tem a sua cena, para duas pessoas não editarem a mesma cena ao mesmo tempo.

| Cena | O que é | Script |
|---|---|---|
| `scenes/telas/tela_inicial.tscn` | tela inicial com "Jogar"; é a primeira cena do jogo | `scripts/telas/tela_inicial.gd` |
| `scenes/jogo/jogo.tscn` | a partida: junta Ícaro, câmera, plataformas, fundo e HUD, e decide o fim | `scripts/jogo/jogo.gd` |
| `scenes/icaro/icaro.tscn` | Ícaro: A e D, salto automático, flechas | `scripts/icaro/icaro.gd` |
| `scenes/plataformas/plataforma_fixa.tscn` | plataforma fixa | `scripts/plataformas/plataforma.gd` |
| `scenes/plataformas/plataforma_movel.tscn` | plataforma móvel (vai e volta) | `scripts/plataformas/plataforma_movel.gd` |
| `scenes/plataformas/plataforma_instavel.tscn` | plataforma instável (quebra depois de pisada) | `scripts/plataformas/plataforma_instavel.gd` |
| `scenes/plataformas/plataforma_pula_pula.tscn` | plataforma pula-pula (salto mais forte) | `scripts/plataformas/plataforma_pula_pula.gd` |
| `scenes/inimigos/inimigo.tscn` | inimigo genérico provisório | `scripts/inimigos/inimigo.gd` |
| `scenes/flecha/flecha.tscn` | flecha | `scripts/flecha/flecha.gd` |
| `scenes/itens/item_de_poder.tscn` | item de poder (velocidade, pulo alto ou escudo) | `scripts/itens/item_de_poder.gd` |
| `scenes/hud/hud.tscn` | HUD: score e poder ativo | `scripts/hud/hud.gd` |
| `scenes/fundo/fundo.tscn` | fundo 2D dos 5 cenários, com fade | `scripts/fundo/fundo.gd` |
| `scenes/cutscene/cutscene_final.tscn` | cutscene final provisória: Ícaro caindo de costas, asas queimando | `scripts/cutscene/cutscene_final.gd` |
| `scenes/telas/creditos.tscn` | créditos e score; "Voltar ao início" | `scripts/telas/creditos.gd` |

A câmera (`scripts/jogo/camera_da_subida.gd`) e o gerador de plataformas
(`scripts/jogo/gerador_de_plataformas.gd`) são nós da cena do jogo.

### O que roda sempre (autoloads)

| Nome | Para quê | Script |
|---|---|---|
| `Partida` | score e poder ativo da partida em andamento | `scripts/autoload/partida.gd` |
| `Sons` | toca um som pelo nome | `scripts/autoload/sons.gd` |
| `Telas` | troca de tela com tela preta no meio; ESC fecha o jogo | `scripts/autoload/telas.gd` |

### As regras do jogo (sem cenas)

As regras ficam em `scripts/logica/`, separadas das cenas, e têm testes: `placar.gd` (score),
`poderes.gd` (os três poderes), `contato.gd` (inimigo que encosta, escudo, invulnerabilidade),
`dificuldade.gd` (curva de dificuldade) e `cenarios.gd` (qual cenário em cada altura).

## Onde mudar os números

Todos os números de ajuste estão num arquivo só: **`scripts/ajustes.gd`**. Cada linha tem um
comentário dizendo o que ela muda. Ali estão as velocidades, a altura do salto, a força da
pula-pula, os pontos perdidos, o tempo dos poderes e da invulnerabilidade, a distância entre
plataformas, a altura total até o céu, a curva de dificuldade, a câmera e os tempos de tela preta,
de fade e da cutscene. Mude, salve e rode o jogo (F5).

## Como trocar as peças provisórias

### Uma forma provisória por um modelo `.glb`

Todo elemento 3D tem um nó filho chamado **`Visual`** com a forma provisória. Trocar pela arte é
trocar só esse nó:

1. Exporte o modelo do Blender em `.glb` (G-015) e salve em `assets/models/` (ex.:
   `assets/models/plataforma_fixa.glb`).
2. Abra a cena do elemento (ex.: `scenes/plataformas/plataforma_fixa.tscn`).
3. Apague o nó `Visual`.
4. Arraste o `.glb` do painel FileSystem para a raiz da cena e renomeie o nó novo para `Visual`.
5. Salve a cena e rode o jogo.

A origem do modelo tem de ficar onde a forma provisória estava: **nos pés** de Ícaro e **no topo**
das plataformas. A colisão (nó `Colisao`) continua a mesma; se o modelo novo tiver outro tamanho,
ajuste também a forma dela.

Ícaro já usa um modelo `.glb` provisório, feito por script no Blender
(`assets/models/_provisorio/icaro_provisorio.glb`), que prova o caminho Blender → `.glb` → Godot. A
cutscene final usa o mesmo modelo.

### A cor provisória do fundo por um PNG

Salve cada fundo (PNG, 1920×1080, G-022) em `assets/textures/` com exatamente este nome:

| Cenário | Arquivo |
|---|---|
| Terra (Creta) | `fundo_1_terra_creta.png` |
| Cidade | `fundo_2_cidade.png` |
| Subida para o céu | `fundo_3_subida_para_o_ceu.png` |
| Nuvens | `fundo_4_nuvens.png` |
| Céu | `fundo_5_ceu.png` |

O jogo usa o PNG quando ele existe e a cor provisória quando não. Não precisa mudar código.

### O silêncio por um som

Salve o som em `assets/audio/` com um destes nomes, em `.ogg`, `.wav` ou `.mp3`:

| Nome | Quando toca |
|---|---|
| `pulo` | cada salto |
| `plataforma_quebrando` | a plataforma instável quebra |
| `flecha` | Ícaro atira |
| `asas` | Ícaro começa a andar para o lado; início da cutscene final |
| `poder` | Ícaro pega um item de poder; o escudo absorve um inimigo |
| `dano` | um inimigo encosta em Ícaro |

Exemplo: `assets/audio/pulo.ogg`. Sem o arquivo, o jogo fica em silêncio, sem erro. Um som novo
precisa entrar também na lista `NOMES` de `scripts/autoload/sons.gd`.

### As imagens dos itens de poder

O item de poder é 2D (G-017): um quadrado de frente para a câmera, com cor e letra provisórias
(V, P, E). Para usar um PNG, troque o nó `Visual` de `scenes/itens/item_de_poder.tscn` por um
`Sprite3D` com a imagem e **Billboard** ligado.

## Como rodar os testes

Dois testes, os dois sem janela. Cada um deve terminar com código 0.

```bash
# regras do jogo (score, poderes, contato, dificuldade, cenários)
flatpak run org.godotengine.Godot --headless --path . --script res://scripts/testes/rodar_testes.gd

# fumaça: joga pelas cenas de verdade (tela inicial → jogo → céu → créditos → queda e reinício)
flatpak run org.godotengine.Godot --headless --path . --script res://scripts/testes/fumaca_fluxo.gd
```

No Windows, troque `flatpak run org.godotengine.Godot` pelo caminho do Godot, como no
[README](../README.md#para-quem-usa-o-terminal). Depois de criar um script novo com `class_name`, rode antes
`--headless --path . --import`.

Um teste de regra é uma função `teste_...` num arquivo `scripts/testes/teste_*.gd`. O executor
acha sozinho os arquivos novos.
