# Game feel — referências e o que cada uma ensina

Pesquisa feita em 2026-09-27, antes da camada de apresentação do protótipo (branch
`feat/vibe-indie`). As referências são de **técnica**: nenhuma arte, modelo, som ou texto delas
entra no jogo. O estilo continua o do grupo (G-021: low poly cartoon, com o Mario 64 só como
referência de estilo).

Onde cada técnica ficou no código e como desligá-la: [`ARQUITETURA.md`](ARQUITETURA.md#efeitos-e-como-desligar).

## Game feel e "juice"

**Juice it or lose it** — Martin Jonasson e Petri Purho, GDC Europe 2012
([vídeo](https://www.youtube.com/watch?v=Fy0aCDmgnxg)). Tipo: mecanismo.
- Usar: toda ação do jogador ganha uma resposta em cascata (escala, partícula, som, câmera), e a
  regra do jogo continua a mesma.
- Evitar: empilhar efeito até esconder o que está acontecendo. Existe até uma resposta crítica,
  "resist the urge to juice it or lose it"
  ([Game Developer](https://www.gamedeveloper.com/design/video-indies-resist-the-urge-to-juice-it-or-lose-it-)).
- No Icarus: cada efeito tem liga/desliga em `scripts/ajustes.gd`, e o grupo corta o que sobrar.

**The art of screenshake** — Jan Willem Nijman (Vlambeer), INDIGO Classes 2013
([vídeo](https://www.youtube.com/watch?v=AJdEqssNZ-U)). Tipo: mecanismo.
- Usar: truques pequenos, somados, mudam a sensação: tremor, hit stop (congelar alguns quadros no
  acerto), câmera que olha para onde o jogador vai, partículas que ficam um pouco na tela.
- Evitar: tremor em toda ação; ele perde o sentido e cansa.
- No Icarus: tremor só no dano e na plataforma quebrando; hit stop só quando a flecha acerta;
  câmera que antecipa a subida.

**Math for Game Programmers: Juicing Your Cameras With Math** — Squirrel Eiserloh, GDC 2016
([vídeo](https://www.youtube.com/watch?v=tu-Qe66AvtY),
[slides](http://www.mathforgameprogrammers.com/gdc2016/GDC2016_Eiserloh_Squirrel_JuicingYourCameras.pdf)).
Tipo: mecanismo.
- Usar: tremor por "trauma": um valor de 0 a 1 que sobe com o evento e cai sozinho; o tremor é o
  trauma ao quadrado, com ruído suave em vez de sorteio a cada quadro. Suavização da câmera por
  aproximação exponencial.
- Evitar: tremor que desloca a câmera sem voltar ao lugar.
- No Icarus: `Efeitos.tremer()` soma trauma; a câmera aplica trauma² com ruído e o trauma decai.

## Identidade visual (low poly, toon, contorno)

**A Short Hike** — Adam Robinson-Yu
([PlayStation Blog](https://blog.playstation.com/2021/08/05/crafting-a-tiny-open-world-a-look-behind-the-scenes-at-the-creation-of-a-short-hike/),
[postmortem](https://www.gamedeveloper.com/design/finding-smart-shortcuts-in-a-short-hike-postmortem-unlocking-the-vault-4)).
Tipo: visual.
- Usar: sombreamento plano e coeso, controlado por um shader próprio, mais um contorno suave para
  cada objeto se destacar do fundo. A paleta tirada de um lugar real dá unidade.
- Evitar: o visual pixelado e o tom de outono do jogo; não é o estilo do grupo.
- No Icarus: um shader toon próprio em todos os objetos 3D, contorno escuro e uma paleta por
  cenário (Terra/Creta, Cidade, Subida para o céu, Nuvens, Céu).

**Contorno por casco invertido (inverted hull)** — [Ronja's tutorials](https://www.ronja-tutorials.com/post/020-hull-outline/),
[toon-rp wiki](https://github.com/Delt06/toon-rp/wiki/Inverted-Hull-Outline). Tipo: mecanismo.
- Usar: desenhar o objeto uma segunda vez, inflado e só com as faces de trás, numa cor escura. É
  barato e funciona sem pós-processamento.
- Evitar: inflar pela normal em malha de faces planas; as quinas abrem buracos. No Icarus o casco
  cresce a partir do centro da peça, o que fecha as quinas nas formas convexas do low poly.

**Toon shading com a função `light()` do Godot** — [hexaquo](https://hexaquo.at/pages/understanding-godot-light-shaders-and-light-calculations-by-implementing-a-toon-light-shader/),
[gameidea](https://gameidea.org/2024/02/15/toon-cel-shader/). Tipo: mecanismo.
- Usar: trocar a luz suave por faixas (`step`/quantização de `dot(NORMAL, LIGHT)`), com uma borda
  de luz (rim) para separar o objeto do fundo.
- Evitar: shaders prontos de galeria; o do Icarus foi escrito do zero, curto, sem plugin.

## Vontade de jogar de novo (jogos de subida)

**Doodle Jump** — Lima Sky ([Wikipedia](https://en.wikipedia.org/wiki/Doodle_Jump)). Tipo: fluxo.
- Usar: subida sem fim cuja meta é bater o próprio recorde; dificuldade que cresce com plataformas
  móveis e quebradiças; molas e trampolins como resposta exagerada.
- `needs-verification`: sites de fãs dizem que o jogo mostra na tela a marca da altura dos
  recordes. A fonte primária consultada (Wikipedia) não confirma. A marca do Icarus é ideia
  própria, apoiada no princípio "mostrar o alvo logo acima".
- No Icarus: recorde salvo no computador, marcas no cenário na altura do recorde e da partida
  anterior, e o pula-pula com "boing".

**Icy Tower** — Free Lunch Design ([Wikipedia](https://en.wikipedia.org/wiki/Icy_Tower)).
Tipo: fluxo.
- Usar: a subida premia risco com retorno imediato e visível (os combos, com pontos que crescem ao
  quadrado).
- Evitar: combos. Seriam regra nova de score, e o score é decisão do grupo (G-001, G-018).
- No Icarus: só o retorno visível — contagem animada do score e aviso de "novo recorde!".

**Celeste** — Maddy Thorson e Noel Berry
([Wikipedia](https://en.wikipedia.org/wiki/Celeste_(video_game))). Tipo: fluxo.
- Usar: morrer custa um ou dois segundos e o jogo volta na hora, sem menu; o erro vira vontade de
  tentar de novo, não castigo.
- Evitar: checkpoint e contador de mortes; o Icarus não tem checkpoint (G-010).
- No Icarus: a tela preta ao cair (G-020) fica curta, com uma linha de texto (altura e recorde), e
  a partida recomeça sem menu.

## O que fazemos diferente das referências

Elas mostram como dar resposta a cada ação; o Icarus usa isso para contar o mito: a luz esquenta e
o brilho cresce conforme Ícaro sobe, as frases provocam a arrogância dele, e o fim continua sendo a
queda (G-019), não uma vitória.
