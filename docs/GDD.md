# Icarus — Game Design Document

> Documento de pré-produção.
> O projeto oficial ainda não foi iniciado.

## 1. Conceito

**Icarus** será um jogo de plataforma vertical 2.5D inspirado no mito de Ícaro.

A proposta é ter a sensação de progressão vertical de jogos como Doodle Jump, sem copiar diretamente sua estrutura. O jogador controla Ícaro enquanto sobe por diferentes regiões, usando suas asas, desviando de obstáculos e inimigos e lidando com o aumento da temperatura que começa a derreter a cera das asas.

O jogo deve equilibrar:

- gameplay;
- narrativa;
- direção visual;
- música e efeitos;
- elementos 3D;
- apresentação cinematográfica.

## 2. Objetivo

Subir cada vez mais alto até alcançar a região do Sol.

O final seguirá o mito clássico de Ícaro.

## 3. Duração

Uma partida completa deverá durar aproximadamente:

**10 a 15 minutos.**

O jogo será curto, rejogável e com ritmo arcade.

## 4. Estrutura

O jogo será dividido em cinco regiões durante uma subida contínua:

1. Creta / Penhascos
2. Mar Egeu / Ventos
3. Nuvens Altas
4. Tempestade
5. Região Solar

Cada região introduzirá ou combinará novas mecânicas.

## 5. Gameplay principal

Ícaro bate as asas automaticamente, funcionando como um impulso ou salto periódico.

O jogador controla principalmente:

- movimento horizontal;
- direção durante o voo;
- planar;
- impulso especial.

### Controles provisórios

- `A / D` ou setas: movimento horizontal
- `Espaço`: planar
- `Shift`: impulso especial
- `Esc`: pause

Os controles ainda serão refinados durante a prototipação.

## 6. Habilidades

### Bater asas

É o movimento principal e acontece automaticamente.

### Planar

Permite cair mais lentamente e controlar melhor a trajetória.

### Impulso

Pequeno boost aéreo utilizado para:

- corrigir trajetória;
- alcançar plataformas;
- escapar de perigos.

A carga é recuperada ao tocar em uma plataforma.

## 7. Mecânica de temperatura e cera

A temperatura será uma das mecânicas centrais do jogo.

Quanto mais perto Ícaro chega do Sol, maior será o risco de a cera de suas asas derreter.

### A temperatura aumenta com

- altitude;
- exposição direta ao Sol;
- zonas de calor;
- plataformas quentes;
- regiões próximas ao Sol.

### A temperatura diminui com

- nuvens;
- sombras;
- correntes frias;
- chuva;
- regiões menos expostas ao Sol.

### Estados de temperatura

1. Normal
2. Aquecido
3. Quente
4. Crítico
5. Colapso das asas

Conforme a temperatura aumenta:

- surgem efeitos visuais;
- a cera começa a derreter;
- partículas podem aparecer;
- o controle pode ficar mais difícil;
- no limite, as asas falham.

## 8. Plataformas

Tipos planejados:

- normal;
- móvel;
- quebrável;
- nuvem temporária;
- plataforma de vento;
- plataforma quente;
- plataforma estreita.

As mecânicas serão apresentadas gradualmente.

## 9. Obstáculos

Possíveis obstáculos:

- rajadas de vento;
- raios;
- tempestades;
- nuvens perigosas;
- zonas de calor;
- plataformas instáveis;
- passagens estreitas.

## 10. Inimigos

Os inimigos funcionarão principalmente como obstáculos móveis.

Não haverá sistema complexo de combate.

Possíveis inimigos:

- pássaros;
- harpias;
- criaturas mitológicas simples.

O foco será desviar e continuar subindo.

## 11. Coletáveis

### Penas douradas

Aumentam o score.

### Fragmentos de cera

Podem reduzir levemente a temperatura.

### Relíquias gregas

Coletáveis opcionais e escondidos.

## 12. Score

A pontuação poderá considerar:

- altura alcançada;
- penas coletadas;
- tempo;
- regiões alcançadas;
- conclusão da partida.

A tela final poderá mostrar:

- score;
- tempo;
- altura;
- coletáveis.

## 13. Morte

Não haverá checkpoints durante a partida.

Ao morrer:

**o jogador volta ao começo.**

Isso faz parte da proposta arcade e da curta duração de cada tentativa.

## 14. Final

O final seguirá o mito clássico.

Ícaro chega perto demais do Sol.

A temperatura aumenta.

A cera derrete.

As asas começam a falhar.

Ícaro cai.

O gameplay será seguido por uma cutscene final.

## 15. Direção visual

Estilo planejado:

**3D estilizado, low-poly detalhado ou semi-cartoon.**

Não buscamos hiper-realismo.

O objetivo é criar uma identidade visual própria, consistente e marcante.

## 16. Tecnologia planejada

- Python
- Panda3D
- Blender
- editor de vídeo para cutscenes e trailer
- Git
- GitHub

## 17. Estrutura gráfica

O gameplay principal utilizará:

**2.5D com câmera ortográfica.**

O mundo terá profundidade real em 3D.

Momentos cinematográficos poderão utilizar câmera em perspectiva.

## 18. Elementos 3D

Elementos planejados em 3D:

- Ícaro;
- asas;
- plataformas;
- colunas;
- ruínas;
- pedras;
- penhascos;
- nuvens;
- Sol;
- mar;
- pássaros;
- objetos gregos.

## 19. Áudio

O jogo terá:

- música;
- efeitos sonoros;
- som ambiente;
- identidade sonora diferente por região.

Efeitos importantes:

- asas;
- vento;
- pouso;
- mar;
- pássaros;
- raios;
- chuva;
- cera;
- calor;
- interface.

## 20. Cutscenes

Teremos:

- cutscene inicial;
- cutscene final.

A abordagem inicial será:

**Blender + edição de vídeo.**

## 21. Trailer

Quando o jogo estiver praticamente finalizado, será produzido um trailer de aproximadamente:

**30 a 60 segundos.**

## 22. MUST HAVE

O projeto só será considerado completo se tiver:

1. gameplay funcional do começo ao fim;
2. progressão pelas regiões;
3. elementos 3D relevantes;
4. mecânica de temperatura e cera;
5. áudio básico;
6. cutscene inicial;
7. cutscene final;
8. score;
9. estabilidade suficiente para apresentação.

## 23. SHOULD HAVE

- partículas;
- inimigos variados;
- coletáveis secretos;
- música dinâmica;
- transições entre regiões;
- VFX de calor;
- iluminação diferenciada.

## 24. NICE TO HAVE

- distorção de calor;
- câmera cinematográfica durante gameplay;
- modo de demonstração de Computação Gráfica;
- relíquias escondidas;
- interface altamente animada;
- cenas adicionais.

## 25. Fora do escopo

Não planejamos:

- multiplayer;
- ranking online;
- mundo aberto;
- inventário;
- crafting;
- árvore complexa de habilidades;
- combate profundo;
- vários finais;
- geração procedural infinita;
- sistemas online complexos.

## 26. Objetivo de qualidade

Queremos que o projeto pareça mais do que apenas uma demonstração acadêmica.

A meta é produzir algo curto, funcional, estilizado e suficientemente bem acabado para ser lembrado pela apresentação, gameplay e identidade visual.
