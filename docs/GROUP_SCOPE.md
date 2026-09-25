# Escopo do grupo — transcrição

> ## Procedência
>
> | Campo | Valor |
> |---|---|
> | Origem | documento de escopo escrito pelo grupo num Google Doc |
> | Status | **confirmado pelo Gabriel em 2026-09-25 como decisão do grupo; sujeito a alteração** |
> | Data do documento | não consta no documento |
> | Autores / presentes | não constam no documento |
> | Ata | não existe |
> | Transcrito em | 2026-09-25 |
>
> O texto abaixo é **transcrição fiel** do documento do grupo: não foi reescrito, corrigido nem
> interpretado. O próprio documento diz que pode haver alteração.
>
> A leitura do documento — o que ficou **CONFIRMED** e o que ficou **NEEDS-GROUP-APPROVAL** por
> contradição ou lacuna — está em [`GROUP-DECISIONS.md`](GROUP-DECISIONS.md). O cruzamento com as
> propostas anteriores do Gabriel está em [`DECISIONS.md`](DECISIONS.md) (ICR-016).
> Nenhuma `GABRIEL-PROPOSAL` foi promovida por este documento além do que ele afirma.

## Documento do grupo

```text
O que o jogador faz? Controla Ícaro e deve movimentá-lo para que suba pelas plataformas sem
cair. Durante a escalada: plataformas que quebram ao serem pisadas e itens especiais que concedem
poderes temporários (aumento de velocidade, maior altura de salto e outros bônus).
Objetivo: subir pulando de plataforma em plataforma até o limite máximo de altura, representado
pelo céu, sem deixar o personagem cair.
Vitória: completar todos os cenários e fases, alcançando o céu.
Derrota: Ícaro cair das plataformas durante a subida.
Mecânica principal: saltos precisos e automáticos entre as plataformas; obstáculos e desafios
cada vez mais difíceis.
Partida/fase: começa na terra e atravessa fases/temas: 1. Terra (Creta) 2. Cidade 3. Subida
para o céu 4. Nuvens 5. Céu (objetivo final). Cada fase é mais difícil que a anterior.
Término: Ícaro alcança o limite da subida, chega ao céu e, dominado pela arrogância, o sol
derrete suas asas e ele cai.
Engine: "gamepy", recursos 2D com alguns elementos 3D. Engine 2D; elementos 3D complementam o
visual dos cenários.
Modelos: Ícaro, plataformas, cenários/fundos de cada fase, itens de poder temporário.
Animações: quebra das plataformas, quebra das asas, queda de Ícaro ao errar um salto, efeitos de
poder temporário.
Sons: plataformas quebrando, pulo, poderes especiais, movimento das asas.
Programação: Python (movimentação, controle de fases, colisões, mecânicas). 3D: Blender.
Interfaces: tela inicial, interfaces específicas por fase, HUD de jogo, telas de vitória e derrota.
Fases do Jogo: quatro fases principais — Terra, Cidade, transição ao céu, Céu — cada uma com
identidade visual, novos desafios e dificuldade crescente.
Quantidade de Fases: mecânica de jumping até o céu, com 5 cenários (planos de fundo).
Divisão por área:
  Arte: personagem Ícaro; plataformas fixas, móveis e instáveis; jump de impulso; fundo das fases.
  Programação: jump automático; disparo de flechas; score pela altura alcançada; ao chegar a uma
    altura delimitada, conclui e mostra a tela de vitória; ao cometer erro, Ícaro cai.
  Design: design das plataformas, do personagem e dos inimigos; tela inicial; tela final.
```
