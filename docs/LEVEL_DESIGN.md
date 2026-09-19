# Icarus — Level Design Final v1

> Status: **fechado para iniciar implementação**.
>
> Este documento congela as decisões de level design. Valores numéricos de física, distância, velocidade e temperatura continuam sendo parâmetros de tuning e serão definidos por playtest no graybox.

# 1. Visão do level design

**Icarus** é um jogo de plataforma vertical 2.5D com duração-alvo de **10 a 15 minutos por partida completa**.

A progressão deve transmitir uma única subida contínua, dividida em cinco regiões:

1. Creta / Penhascos
2. Mar Egeu / Ventos
3. Nuvens Altas
4. Tempestade
5. Região Solar

O jogo começa acessível e termina exigindo domínio de todas as mecânicas.

# 2. Regras globais

- Gameplay principal em câmera ortográfica 2.5D.
- Mundo e cenário com profundidade real em 3D.
- Ícaro sobe por impulsos automáticos de asa.
- O jogador controla movimento horizontal, planar e um impulso especial.
- Não há checkpoints durante a partida.
- Ao morrer, a tentativa reinicia do começo.
- Uma nova mecânica deve ser ensinada antes de ser combinada com outras.
- Todo perigo deve ser visualmente legível antes de causar dano ou morte.
- Não usar obstáculos aleatórios impossíveis de prever.
- O caminho principal deve ser sempre identificável.
- Rotas de maior risco podem oferecer score maior.
- O jogador deve perceber visualmente que está ficando cada vez mais alto.
- O Sol deve funcionar como objetivo visual constante e crescer ao longo da partida.

# 3. Loop principal

    subir
      ↓
    pousar
      ↓
    ler o próximo trecho
      ↓
    escolher trajetória
      ↓
    desviar de perigos
      ↓
    controlar temperatura
      ↓
    coletar score opcional
      ↓
    alcançar próxima região

# 4. Movimento

## Bater asas

Ícaro recebe um impulso vertical automático periódico.

O objetivo é manter a sensação de plataforma vertical sem transformar o jogo em voo livre.

## Movimento horizontal

O jogador controla esquerda e direita no ar.

O controle deve ser responsivo, mas preservar uma pequena sensação de inércia.

## Planar

Segurar o comando de planar reduz a velocidade da queda e melhora a correção horizontal.

Ele serve para:

- corrigir trajetórias;
- alcançar plataformas;
- sobreviver a erros pequenos.

## Impulso especial

Um pequeno boost aéreo de emergência.

Regras planejadas:

- uma carga por salto;
- recarrega ao tocar em uma plataforma;
- não substitui o domínio do movimento;
- serve para correção e jogadas arriscadas.

# 5. Temperatura e cera

A temperatura será a mecânica narrativa central.

Ela aparece gradualmente e se torna dominante no final.

## A temperatura aumenta com

- altitude;
- exposição direta ao Sol;
- zonas solares;
- plataformas quentes;
- permanência prolongada em regiões expostas.

## A temperatura diminui com

- nuvens;
- sombra;
- correntes frias;
- chuva;
- áreas protegidas.

## Estados

1. Normal
2. Aquecido
3. Quente
4. Crítico
5. Colapso

## Feedback

A temperatura deve ser comunicada por mais de um canal:

- HUD;
- aparência das asas;
- partículas;
- som;
- iluminação;
- comportamento do personagem.

No estado crítico:

- cera começa a escorrer;
- penas se desprendem;
- o controle pode ficar levemente mais difícil;
- efeitos visuais aumentam.

# 6. Score

Score incentiva replay e risco sem criar sistemas complexos.

Pode considerar:

- altura;
- penas douradas;
- tempo;
- conclusão;
- rotas de risco.

Coletáveis devem ser opcionais.

O jogador nunca deve ser obrigado a pegar um coletável para continuar.

# 7. Estrutura temporal

Alvo inicial:

- Creta: 2–3 min
- Mar Egeu: 2–3 min
- Nuvens: 2–3 min
- Tempestade: 2–3 min
- Região Solar: 2–3 min

Tempo total típico desejado: aproximadamente **12 minutos**, com teto próximo de 15.

# 8. Região 1 — Creta / Penhascos

## Função

Tutorial orgânico.

## Ensina

- salto automático;
- movimento horizontal;
- pouso;
- planar;
- impulso especial.

## Visual

- céu azul;
- mar;
- penhascos;
- colunas;
- ruínas;
- vegetação mediterrânea;
- Sol pequeno ao longe.

## Estrutura

### Beat A — Primeiro movimento

Plataformas largas e próximas.

Ensina esquerda/direita e pouso.

### Beat B — Controle no ar

Plataformas um pouco mais deslocadas horizontalmente.

Apresenta planar.

### Beat C — Primeiro risco

Uma distância exige uso de impulso ou bom controle.

### Beat D — Saída de Creta

Primeiras plataformas móveis simples.

A câmera abre e mostra Creta ficando para trás.

## Perigos

- queda;
- pequenos pássaros;
- erro de trajetória.

Nada agressivo demais.

# 9. Região 2 — Mar Egeu / Ventos

## Função

Transformar movimento simples em navegação.

## Mecânica nova

**Vento.**

## Tipos

- lateral;
- ascendente;
- descendente.

## Visual

- mar predominante;
- ilhas distantes;
- barcos;
- rochas;
- destroços;
- correntes visíveis;
- Creta distante.

## Estrutura

### Beat A — Corrente favorável

Primeiro vento ajuda o jogador.

### Beat B — Vento lateral

Jogador aprende correção de trajetória.

### Beat C — Plataformas móveis

Vento + plataforma móvel.

### Beat D — Rota de risco

Pena dourada posicionada em caminho mais difícil.

### Beat E — Entrada nas nuvens

O cenário fica mais branco e o Sol cresce.

# 10. Região 3 — Nuvens Altas

## Função

Introduzir temperatura sem pressão extrema.

## Mecânica nova

**Calor/cera.**

## Visual

- nuvens grandes;
- várias camadas de profundidade;
- céu claro;
- Sol maior;
- mundo terrestre distante.

## Estrutura

### Beat A — Primeiro aquecimento

O jogador entra em uma área exposta.

HUD e asas indicam aumento de temperatura.

### Beat B — Primeiro resfriamento

Uma nuvem/sombra reduz a temperatura.

### Beat C — Escolha de rota

Rota curta e quente versus rota longa e fria.

### Beat D — Nuvens temporárias

Plataformas que desaparecem após pouco tempo.

### Beat E — Prenúncio da tempestade

Escurecimento gradual, trovões distantes e mudança da música.

# 11. Região 4 — Tempestade

## Função

Combinar as mecânicas anteriores e aumentar a pressão.

## Visual

- nuvens escuras;
- chuva;
- raios;
- vento forte;
- iluminação dramática.

## Regra especial

A tempestade é fria e ajuda a temperatura, mas é mecanicamente perigosa.

## Estrutura

### Beat A — Entrada

Vento forte, mas sem raio imediato.

### Beat B — Primeiro raio

O raio possui telegraph claro:

    clarão
      ↓
    pequeno atraso
      ↓
    impacto

### Beat C — Combinação

Vento + plataforma móvel + raio.

### Beat D — Inimigo

Harpia ou pássaro maior atravessa a rota.

Não há combate: o jogador desvia.

### Beat E — Clímax da tempestade

Trecho curto e intenso combinando os sistemas.

### Beat F — Ruptura

Ícaro atravessa o topo das nuvens.

Chuva para.

O som abre.

O Sol domina a cena.

# 12. Região 5 — Região Solar

## Função

Clímax mecânico, visual e narrativo.

## Visual

- dourado;
- laranja;
- branco;
- Sol enorme;
- brilho crescente;
- poucas nuvens;
- partículas;
- sensação de vazio.

## Regra principal

A temperatura sobe muito mais rápido.

## Estrutura

### Beat A — Falso alívio

Trecho curto e visualmente belo após a tempestade.

### Beat B — Calor dominante

Temperatura passa a exigir planejamento de rota.

### Beat C — Poucas áreas frias

Nuvens e sombras tornam-se raras.

### Beat D — Degradação

As asas começam a mudar:

1. alteração visual;
2. cera;
3. penas;
4. controle mais difícil;
5. falha.

### Beat E — Última subida

Trecho final exige domínio de:

- movimento;
- planar;
- impulso;
- vento;
- leitura de plataforma;
- temperatura.

### Beat F — Colapso

O jogador ainda controla Ícaro por alguns segundos durante a falha.

Depois as asas entram em colapso.

Transição para a cutscene final.

# 13. Plataformas finais

Tipos aprovados:

- normal;
- móvel horizontal;
- móvel vertical;
- quebrável;
- estreita;
- nuvem temporária;
- plataforma influenciada pelo vento;
- plataforma quente.

Não adicionar novos tipos sem necessidade real de level design.

# 14. Inimigos finais

Inimigos servem como perigos móveis.

Aprovados:

- pássaros;
- harpia ou equivalente.

Sem combate complexo.

Sem sistema de vida de inimigos.

Sem armas.

# 15. Coletáveis

## Pena dourada

Principal coletável de score.

## Fragmento de cera

Pode reduzir temperatura, mas deve ser raro para não anular a mecânica.

## Relíquia grega

Opcional / nice-to-have.

Pode ficar escondida em rotas de risco.

# 16. Câmera

## Gameplay

Ortográfica.

A câmera:

- acompanha verticalmente;
- mantém espaço visível acima de Ícaro;
- evita mostrar perigos tarde demais;
- não deve causar enjoo;
- pode usar suavização moderada.

## Momentos cinematográficos

Perspectiva 3D pode aparecer em:

- saída de Creta;
- ruptura da tempestade;
- entrada da Região Solar;
- colapso das asas;
- cutscenes.

# 17. Profundidade 3D

Apesar do movimento ser 2.5D:

- cenário possui profundidade real;
- objetos ficam atrás e à frente;
- nuvens atravessam diferentes planos;
- ruínas, ilhas e partículas reforçam profundidade;
- iluminação e perspectiva devem evidenciar o 3D.

# 18. Verticalidade visual

A subida deve ser percebida sem precisar de texto.

Indicadores:

- Creta encolhe;
- mar fica distante;
- nuvens mudam;
- cor do céu muda;
- Sol aumenta;
- iluminação fica mais intensa;
- som ambiente muda.

# 19. Risco versus recompensa

Sempre que possível:

## Rota segura

- plataformas maiores;
- percurso mais longo;
- menos score.

## Rota arriscada

- saltos difíceis;
- exposição ao calor;
- obstáculos;
- penas douradas;
- score maior.

Isso aumenta replay sem criar sistemas adicionais.

# 20. Telegraphs

Todo perigo importante deve avisar o jogador.

Exemplos:

- raio: clarão antes do impacto;
- plataforma quebrável: rachadura/animação;
- nuvem temporária: dissipação visual;
- vento: partículas e direção clara;
- área quente: brilho e distorção;
- inimigo rápido: entrada previsível no enquadramento.

# 21. Regras de justiça

Não fazer:

- morte por elemento que aparece fora da tela sem aviso;
- salto obrigatório impossível de avaliar;
- plataforma escondida necessária para progresso;
- ataque sem telegraph;
- câmera que esconde a próxima plataforma;
- aumento brusco de dificuldade sem preparação.

# 22. Graybox

Antes de qualquer cenário final:

- cubos;
- planos;
- formas simples;
- personagem placeholder.

O graybox precisa validar:

- gravidade;
- impulso automático;
- velocidade horizontal;
- planar;
- boost;
- tempo no ar;
- largura de plataforma;
- distância horizontal;
- distância vertical;
- velocidade da câmera;
- força do vento;
- velocidade de plataformas;
- ritmo de temperatura.

# 23. Critério para aprovar uma região

Uma região só avança para arte quando:

- pode ser terminada;
- nenhuma rota obrigatória parece injusta;
- sua mecânica nova é compreensível;
- câmera funciona;
- duração está adequada;
- física está consistente;
- possui início, desenvolvimento e conclusão claros.

# 24. Ordem de produção

    física
      ↓
    graybox de Creta
      ↓
    testar
      ↓
    graybox das cinco regiões
      ↓
    testar jogo inteiro
      ↓
    arte 3D
      ↓
    iluminação
      ↓
    VFX
      ↓
    áudio
      ↓
    cutscenes
      ↓
    polimento

# 25. Decisões congeladas

Para iniciar desenvolvimento, considerar fechados:

- cinco regiões;
- subida vertical;
- duração de 10–15 min;
- câmera 2.5D ortográfica;
- elementos 3D reais;
- salto/asa automático;
- planar;
- impulso especial;
- temperatura/cera;
- vento;
- plataformas variadas;
- inimigos como obstáculos;
- score;
- sem checkpoints;
- morte reinicia a tentativa;
- final clássico de Ícaro;
- cutscene inicial e final.

# 26. O que NÃO está congelado

Estes itens serão definidos por playtest, não por discussão:

- números de física;
- distâncias exatas;
- velocidade exata;
- cooldowns;
- duração precisa de cada trecho;
- quantidade final de plataformas;
- força de vento;
- taxa de aquecimento;
- taxa de resfriamento;
- quantidade de inimigos.

Esses parâmetros são tuning.

# 27. Estado

**Level design conceitual fechado.**

Próxima etapa:

**implementar física + graybox, medir, testar e ajustar.**
