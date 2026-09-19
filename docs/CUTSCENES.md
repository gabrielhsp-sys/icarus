# Icarus — Cutscenes e Trailer

> Documento de pré-produção.
> As cenas finais ainda poderão mudar durante a produção.

# 1. Objetivo das Cutscenes

As cutscenes terão duas funções principais:

1. apresentar a história sem interromper demais o ritmo;
2. dar mais impacto ao começo e ao final do jogo.

Não queremos cutscenes longas.

A proposta é usar cenas curtas, visuais e fáceis de entender.

# 2. Cutscene Inicial

## Duração

Aproximadamente:

**30 a 60 segundos.**

## Objetivo

Apresentar:

- Ícaro;
- Dédalo;
- Creta;
- asas;
- Sol;
- risco da jornada.

# 3. Storyboard da Cutscene Inicial

## Plano 1 — Abertura

Tela preta.

Som de:

- vento;
- mar;
- ambiente distante.

Fade in.

## Plano 2 — Creta

Plano geral de Creta.

Mostrar:

- penhascos;
- ruínas;
- mar;
- céu;
- arquitetura grega.

Objetivo:

situar o jogador.

## Plano 3 — Dédalo

Dédalo aparece trabalhando nas asas.

Close em:

- penas;
- cera;
- estrutura das asas;
- mãos trabalhando.

## Plano 4 — Ícaro

Ícaro observa.

A cena deve mostrar curiosidade e ansiedade.

Não é necessário diálogo longo.

## Plano 5 — Asas

Dédalo entrega ou mostra as asas.

Pode existir uma versão curta da advertência do mito:

não voar baixo demais e nem perto demais do Sol.

O texto final será escrito posteriormente.

## Plano 6 — Sol

Ícaro olha para o céu.

A câmera acompanha o olhar.

O Sol aparece distante.

O enquadramento deve deixar claro que ele será importante.

## Plano 7 — Título

A cena escurece.

Surge:

**ICARUS**

Pode haver:

- música;
- som de vento;
- pequeno efeito visual.

## Plano 8 — Gameplay

Transição direta para a primeira região.

Idealmente a transição deve parecer contínua.

# 4. Transições Entre Regiões

Não queremos uma cutscene completa entre todas as regiões.

A maior parte das transições acontecerá dentro do próprio gameplay.

Exemplo:

Creta termina com o mar dominando a tela.

Depois:

- cenário muda;
- música muda;
- iluminação muda;
- novas plataformas aparecem.

O mesmo vale para:

- Mar → Nuvens;
- Nuvens → Tempestade;
- Tempestade → Região Solar.

# 5. Momentos Cinematográficos Durante Gameplay

Mesmo sem interromper o jogo, alguns momentos podem utilizar câmera diferente.

Possibilidades:

- câmera abrindo ao sair de Creta;
- Sol crescendo no enquadramento;
- primeiro raio da tempestade;
- saída da tempestade;
- entrada na Região Solar;
- início do colapso das asas.

Esses momentos podem utilizar:

- zoom;
- pequena rotação;
- perspectiva;
- mudança de enquadramento.

# 6. Cutscene Final

## Objetivo

Ser o momento mais forte do jogo.

A cutscene deve transformar o final do gameplay em uma conclusão visual e emocional.

## Duração

Aproximadamente:

**30 a 60 segundos.**

# 7. Transição Gameplay → Final

A transição começa ainda durante o gameplay.

Ícaro continua subindo.

A temperatura chega ao estado crítico.

O Sol ocupa grande parte da tela.

Começam a aparecer:

- cera;
- penas;
- brilho;
- perda de controle.

O jogador ainda mantém algum controle por alguns segundos.

Depois:

as asas falham.

A partir daí começa a cutscene.

# 8. Storyboard da Cutscene Final

## Plano 1 — Sol

Plano próximo de Ícaro voando em direção ao Sol.

A iluminação é extremamente forte.

## Plano 2 — Asas

Close nas asas.

Mostrar:

- cera derretendo;
- penas soltando;
- estrutura começando a falhar.

## Plano 3 — Ícaro

Close rápido no personagem.

Ele percebe que perdeu o controle.

Não precisa haver fala.

## Plano 4 — Falha

Uma asa perde sustentação.

O corpo começa a girar.

## Plano 5 — Silêncio

A música diminui rapidamente.

O som pode ficar abafado.

Durante alguns segundos, o foco passa para:

- vento;
- respiração;
- penas;
- queda.

## Plano 6 — Mudança de câmera

A câmera deixa o estilo ortográfico do gameplay.

Passa para uma perspectiva 3D cinematográfica.

Objetivo:

dar contraste e impacto.

## Plano 7 — Queda

Ícaro começa a cair.

A câmera acompanha por alguns segundos.

Elementos passam pela câmera:

- penas;
- partículas de cera;
- nuvens.

## Plano 8 — Distância

A câmera se afasta.

Ícaro fica pequeno no enquadramento.

O mar aparece muito abaixo.

## Plano 9 — Mar

Plano do Mar Egeu.

Podemos escolher entre:

- mostrar a aproximação;
- cortar antes do impacto;
- usar apenas som.

A decisão final será feita durante a edição.

## Plano 10 — Preto

Fade para preto.

O som desaparece.

## Plano 11 — Encerramento

Pode aparecer uma pequena frase relacionada ao mito.

Texto ainda não definido.

Depois:

**créditos.**

# 9. Créditos

Os créditos devem incluir:

- integrantes;
- funções;
- disciplina;
- universidade;
- professor, se apropriado;
- tecnologias utilizadas;
- bibliotecas;
- assets externos;
- músicas;
- efeitos sonoros;
- licenças.

# 10. Pipeline das Cutscenes

A abordagem inicial será:

    Blender
      ↓
    criação das cenas
      ↓
    animação
      ↓
    render
      ↓
    editor de vídeo
      ↓
    montagem
      ↓
    áudio
      ↓
    exportação final
      ↓
    Panda3D reproduz o vídeo

Essa abordagem evita precisar construir toda a cinematografia dentro da engine.

# 11. Editor de Vídeo

Ainda será escolhido.

Possibilidades:

- Adobe Premiere Pro;
- DaVinci Resolve;
- Kdenlive;
- Blender Video Editor.

A escolha será feita de acordo com:

- facilidade;
- automação disponível;
- integração com ferramentas;
- conhecimento da equipe.

# 12. Blender nas Cutscenes

As cutscenes podem reutilizar modelos do jogo.

Exemplos:

- Ícaro;
- asas;
- Creta;
- ruínas;
- Sol;
- nuvens;
- mar.

Isso evita criar dois conjuntos diferentes de assets.

Podemos melhorar:

- iluminação;
- câmera;
- materiais;
- qualidade de render;

somente para os vídeos.

# 13. Animações Necessárias

Para a abertura:

- Dédalo trabalhando;
- Ícaro observando;
- entrega ou apresentação das asas;
- movimento simples de câmera.

Para o final:

- bater asas;
- deterioração das asas;
- perda de sustentação;
- queda;
- movimentação das penas.

# 14. Áudio das Cutscenes

## Abertura

Possíveis sons:

- mar;
- vento;
- penas;
- objetos sendo manipulados;
- cera;
- ambiente de Creta.

## Final

Possíveis sons:

- vento intenso;
- cera;
- penas;
- falha estrutural das asas;
- respiração;
- silêncio dramático;
- ambiente distante do mar.

# 15. Música

A música da abertura deve estabelecer:

- aventura;
- mitologia;
- curiosidade.

A música do final deve transmitir:

- tensão;
- grandiosidade;
- tragédia.

A música pode desaparecer parcialmente durante a queda.

# 16. Legendas e Texto

Se houver diálogo:

- usar legendas;
- frases curtas;
- evitar grandes blocos de texto.

Se não houver voz, podemos usar:

- legenda;
- texto breve;
- narrativa visual.

# 17. Dédalo

Dédalo deverá aparecer principalmente na abertura.

Não é necessário criar um sistema de NPC para ele dentro do gameplay.

Isso reduz bastante o escopo.

# 18. Uso do Mito

A história será inspirada no mito clássico, mas não será uma reprodução literal de todos os acontecimentos.

Elementos essenciais:

- Dédalo;
- Ícaro;
- asas de penas e cera;
- advertência;
- voo;
- Sol;
- queda.

Elementos adicionais poderão ser adaptados para melhorar o jogo.

# 19. Trailer

O trailer será produzido apenas quando o jogo estiver quase pronto.

Não devemos produzir trailer durante a fase inicial.

# 20. Duração do Trailer

Meta:

**30 a 60 segundos.**

# 21. Objetivo do Trailer

Mostrar que o projeto possui:

- identidade;
- gameplay;
- progressão;
- elementos 3D;
- atmosfera;
- qualidade visual.

Sem revelar completamente o final.

# 22. Estrutura do Trailer

## 0–5 segundos

Tela preta ou cena curta.

Som ambiente.

Logo ou pequena introdução.

## 5–15 segundos

Mostrar:

- Creta;
- Ícaro;
- primeiros movimentos.

## 15–25 segundos

Cortes rápidos de gameplay:

- plataformas;
- vento;
- planar;
- impulso;
- coletáveis.

## 25–35 segundos

Mostrar:

- nuvens;
- temperatura;
- mudança visual da subida.

## 35–45 segundos

Mostrar tempestade:

- raios;
- chuva;
- vento;
- perigo.

## 45–55 segundos

Mostrar Região Solar.

Cortes rápidos:

- Sol;
- cera;
- penas;
- brilho.

Não mostrar toda a queda.

## Final

Tela escura.

Logo:

**ICARUS**

Pode aparecer:

- nomes do grupo;
- disciplina;
- universidade;
- pequena tagline.

# 23. Tagline

Ainda não definida.

Possíveis direções:

- liberdade;
- ambição;
- altura;
- Sol;
- consequências.

A tagline será definida posteriormente.

# 24. Captura de Gameplay

O trailer utilizará gameplay real.

Não queremos que o trailer seja composto apenas por cenas renderizadas.

Ideal:

- aproximadamente metade gameplay;
- aproximadamente metade apresentação/cenas.

# 25. Resolução

Meta inicial:

**1920x1080**

O FPS será decidido posteriormente.

Provavelmente:

- 30 FPS para cutscenes renderizadas;
- 60 FPS para gameplay/trailer, se o material permitir.

# 26. Regra de Produção

Não investir muito tempo nas cutscenes antes que:

1. gameplay funcione;
2. level design esteja definido;
3. personagem esteja utilizável;
4. direção visual esteja consistente.

As cutscenes vêm depois da base do jogo.

# 27. Estado Atual

Neste momento temos:

- conceito da abertura;
- conceito do final;
- fluxo geral das cenas;
- pipeline inicial;
- estrutura inicial do trailer.

Ainda faltará definir:

- roteiro final;
- diálogos;
- tagline;
- duração exata;
- enquadramentos definitivos;
- animações finais;
- editor utilizado;
- música final;
- estilo de edição.

Essas decisões serão tomadas durante a produção.
