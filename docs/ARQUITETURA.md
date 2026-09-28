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
| `scenes/telas/creditos.tscn` | créditos rolando, score e recorde; "Voltar ao início" | `scripts/telas/creditos.gd` |
| `scenes/efeitos/marca_de_altura.tscn` | linha no cenário na altura do recorde ou da partida anterior | `scripts/efeitos/marca_de_altura.gd` |
| `scenes/efeitos/vinheta.tscn` | vinheta nas bordas e flash vermelho de dano | `scripts/efeitos/vinheta.gd` |

A câmera (`scripts/jogo/camera_da_subida.gd`), o gerador de plataformas
(`scripts/jogo/gerador_de_plataformas.gd`) e o clima da subida
(`scripts/efeitos/ambiente_da_subida.gd`, no nó `Ambiente`) são nós da cena do jogo.

### O que roda sempre (autoloads)

| Nome | Para quê | Script |
|---|---|---|
| `Partida` | score e poder ativo da partida em andamento | `scripts/autoload/partida.gd` |
| `Sons` | toca um som pelo nome | `scripts/autoload/sons.gd` |
| `Telas` | troca de tela com tela preta no meio; ESC fecha o jogo | `scripts/autoload/telas.gd` |
| `Efeitos` | efeitos de resposta: tremor, hit stop, estouro, poeira, anel, número flutuante | `scripts/autoload/efeitos.gd` |

A `Partida` também guarda o recorde (veja [Onde fica o recorde](#onde-fica-o-recorde)).

### As regras do jogo (sem cenas)

As regras ficam em `scripts/logica/`, separadas das cenas, e têm testes: `placar.gd` (score),
`poderes.gd` (os três poderes), `contato.gd` (inimigo que encosta, escudo, invulnerabilidade),
`dificuldade.gd` (curva de dificuldade), `cenarios.gd` (qual cenário em cada altura),
`recorde.gd` e `arquivo_de_recorde.gd` (recorde e o arquivo onde ele fica), `marcas.gd` (marcas a
superar, cada uma avisa uma vez) e `contador_animado.gd` (score subindo aos poucos no HUD).

## Onde mudar os números

Todos os números de ajuste da jogabilidade estão num arquivo só: **`scripts/ajustes.gd`**. Cada
linha tem um comentário dizendo o que ela muda. Ali estão as velocidades, a altura do salto, a
força da pula-pula, os pontos perdidos, o tempo dos poderes e da invulnerabilidade, a distância
entre plataformas, a altura total até o céu, a curva de dificuldade, a câmera e os tempos de tela
preta, de fade e da cutscene. Mude, salve e rode o jogo (F5).

As animações provisórias (a plataforma instável caindo, a pula-pula afundando, Ícaro piscando, a
queda na cutscene) têm os números no próprio script, porque vão ser trocadas pela arte.

## Efeitos e como desligar

Tudo o que é apresentação (visual, game feel, recorde, textos) é provisório da Programação e não
muda nenhuma regra do grupo. Cada camada tem um liga/desliga em `scripts/ajustes.gd`, na parte
"APRESENTAÇÃO E META": `true` liga, `false` desliga. As referências de cada técnica estão em
[`GAME-FEEL.md`](GAME-FEEL.md).

| Camada | Liga/desliga em `ajustes.gd` | Onde fica |
|---|---|---|
| toon shading e contorno nos objetos 3D | `TOON_E_CONTORNO` | `scripts/efeitos/estilo_toon.gd`, `assets/shaders/toon.gdshader`, `assets/shaders/contorno.gdshader` |
| paleta por cenário (fundo provisório, luz, névoa, saturação) | `PALETA_POR_CENARIO` | `scripts/efeitos/ambiente_da_subida.gd`, `scripts/fundo/fundo.gd` |
| sol mais quente e forte na subida | `LUZ_ESQUENTA_NA_SUBIDA` | `scripts/efeitos/ambiente_da_subida.gd` |
| bloom perto do céu | `BLOOM_PERTO_DO_CEU` | `scripts/efeitos/ambiente_da_subida.gd` |
| vinheta | `VINHETA` | `scenes/efeitos/vinheta.tscn`, `assets/shaders/vinheta.gdshader` |
| partículas ao fundo | `PARTICULAS_AMBIENTE` | nó `Camera/ParticulasAmbiente` de `scenes/jogo/jogo.tscn` |
| inimigo genérico balançando | `ANIMACAO_DO_INIMIGO` | `scripts/inimigos/inimigo.gd` |
| squash & stretch de Ícaro | `SQUASH_E_STRETCH` | `scripts/icaro/icaro.gd` |
| inclinação e virada de Ícaro | `INCLINACAO_E_VIRADA` | `scripts/icaro/icaro.gd` |
| rastro no poder de velocidade | `RASTRO_NA_VELOCIDADE` | nó `Rastro` de `scenes/icaro/icaro.tscn` |
| aura na cor do poder | `AURA_DO_PODER` | nó `Aura` de `scenes/icaro/icaro.tscn` |
| poeira e afundada no pouso | `POEIRA_NO_POUSO`, `PLATAFORMA_AFUNDA` | `scripts/plataformas/plataforma.gd` |
| "boing" do pula-pula | `BOING_DO_PULA_PULA` | `scripts/plataformas/plataforma_pula_pula.gd` |
| instável treme e se parte em pedaços | `INSTAVEL_TREME_E_QUEBRA` | `scripts/plataformas/plataforma_instavel.gd` |
| câmera que antecipa a subida | `ANTECIPACAO_DA_CAMERA` | `scripts/jogo/camera_da_subida.gd` |
| tremor de tela (dano e quebra) | `TREMOR_DE_TELA`; mais fraco: `REDUZIR_TREMOR_DE_TELA` | `scripts/jogo/camera_da_subida.gd`, `Efeitos.tremer()` |
| campo de visão maior no impulso | `FOV_NO_IMPULSO` | `scripts/jogo/camera_da_subida.gd` |
| rastro na flecha | `RASTRO_NA_FLECHA` | nó `Rastro` de `scenes/flecha/flecha.tscn` |
| hit stop no acerto | `HIT_STOP` | `Efeitos.hit_stop()` |
| inimigo estoura em partículas | `ESTOURO_DO_INIMIGO` | `scripts/inimigos/inimigo.gd` |
| flash vermelho no dano | `FLASH_DE_DANO`; mais fraco: `REDUZIR_FLASHES` | `scripts/efeitos/vinheta.gd` |
| "-50" flutuando | `NUMERO_FLUTUANTE` | `Efeitos.numero_flutuante()` |
| "pop" na coleta do item | `POP_NA_COLETA` | `scripts/itens/item_de_poder.gd` |
| barra de tempo do poder | `BARRA_DO_PODER` | `scripts/hud/hud.gd` |
| recorde salvo e mostrado | `RECORDE` | `scripts/autoload/partida.gd` |
| marcas de altura no cenário | `MARCAS_DE_ALTURA` | `scripts/jogo/jogo.gd`, `scenes/efeitos/marca_de_altura.tscn` |
| faixa com o nome do cenário | `FAIXA_DO_CENARIO` | `scripts/hud/hud.gd` |
| aviso de "novo recorde!" | `AVISO_DE_NOVO_RECORDE` | `scripts/jogo/jogo.gd` |
| texto sobre a tela preta (**para o grupo aprovar**) | `TEXTO_NA_TELA_PRETA` | `scripts/autoload/telas.gd`, `Textos.tela_preta()` |
| frases do mito | `FRASES` | `scripts/textos.gd` |
| score em contagem animada | `CONTAGEM_DO_SCORE` | `scripts/hud/hud.gd` |
| créditos rolando | `CREDITOS_ROLANDO` | `scripts/telas/creditos.gd` |
| botões que respondem ao mouse | `BOTOES_VIVOS` | `scripts/interface/botao_vivo.gd` |
| título e Ícaro animados na tela inicial | `TELA_INICIAL_ANIMADA` | `scripts/telas/tela_inicial.gd` |
| música de fundo | `MUSICA` | `scripts/autoload/sons.gd` |
| câmera lenta, clarão, sol crescendo e câmera que acompanha a queda na cutscene | `CAMERA_LENTA_NA_CUTSCENE` (1 = sem câmera lenta), `CLARAO_DO_SOL`, `SOL_CRESCE_NA_CUTSCENE`, `CAMERA_ACOMPANHA_A_QUEDA` | `scripts/cutscene/cutscene_final.gd` |

Os `.glb` que a equipe 3D mandar também ganham o toon e o contorno sozinhos: o estilo lê a cor e a
textura do material de cada peça. Malha com `material_override` fica com o material dela.

A antecipação e o tremor da câmera só deslocam a imagem: a altura da câmera que decide a queda e
gera as plataformas é a mesma com ou sem esses efeitos. Na cutscene, a câmera lenta faz a queda
durar `DURACAO_DA_CUTSCENE_FINAL / CAMERA_LENTA_NA_CUTSCENE` segundos reais, mais a frase final.

## Textos, fonte e tema

- **Textos:** todas as frases e rótulos do jogo estão em **`scripts/textos.gd`** (tela inicial,
  entrada de cada cenário, perto do sol, frase final, HUD, créditos, texto da tela preta). Edite
  ali. `FRASES = false` tira as frases do mito; o texto da tela preta tem o próprio liga/desliga,
  `TEXTO_NA_TELA_PRETA`.
- **Fonte:** Lilita One, de Juan Montoreano, licença SIL Open Font License 1.1
  (`assets/fonts/LilitaOne-Regular.ttf` e `assets/fonts/OFL.txt`). Veio do repositório
  `google/fonts` (pasta `ofl/lilitaone`, commit `b9f4a43`). Está nos créditos.
- **Tema da interface:** `assets/interface/tema.tres` (fonte, botões, barra). É o tema padrão do
  projeto; mude pelo editor do Godot.

## Onde fica o recorde

O recorde (melhor score, melhor altura e a altura da partida anterior) fica num arquivo do
computador de quem joga, `user://recorde.cfg`:

- Linux, Godot do Flathub: `~/.var/app/org.godotengine.Godot/data/godot/app_userdata/Icarus/recorde.cfg`
- Windows: `%APPDATA%\Godot\app_userdata\Icarus\recorde.cfg`

Apagar o arquivo zera o recorde. Os testes usam arquivos próprios e não mexem no recorde de quem
joga.

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

Todas as formas provisórias já são `.glb` low poly feitos por script no Blender, em
`assets/models/_provisorio/`: Ícaro (`icaro_provisorio.glb`), as quatro plataformas
(`plataforma_fixa.glb`, `plataforma_movel.glb`, `plataforma_instavel.glb`,
`plataforma_pula_pula.glb`), o inimigo genérico (`inimigo_provisorio.glb`) e a flecha
(`flecha_provisoria.glb`). A cutscene final usa o modelo de Ícaro e pinta de cor de fogo as malhas
cujo nome começa com `asa_`. No modelo novo de Ícaro, comece o nome das asas com `asa_`; com outros
nomes, a cutscene roda, mas as asas não ficam cor de fogo.

### A cor provisória do fundo por um PNG

Salve cada fundo (PNG, 1920×1080, G-022) em `assets/textures/` com exatamente este nome:

| Cenário | Arquivo |
|---|---|
| Terra (Creta) | `fundo_1_terra_creta.png` |
| Cidade | `fundo_2_cidade.png` |
| Subida para o céu | `fundo_3_subida_para_o_ceu.png` |
| Nuvens | `fundo_4_nuvens.png` |
| Céu | `fundo_5_ceu.png` |

O jogo usa o PNG quando ele existe e, quando não, um degradê provisório com a paleta do cenário
(`FUNDO_EM_CIMA` e `FUNDO_EMBAIXO` em `ajustes.gd`). Não precisa mudar código.

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
| `pula_pula` | Ícaro pisa numa plataforma pula-pula |
| `acerto` | a flecha acerta um inimigo |
| `recorde` | Ícaro passa uma marca de altura |
| `clique` | um botão é apertado |
| `musica` | música de fundo, em loop, na tela inicial e no jogo |

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
