# ICARUS — CLAUDE START HERE

> Este arquivo é o handoff mestre do projeto.
>
> Quando este arquivo for entregue ao Claude/Claude Code, a migração do ecossistema ChatGPT → Claude já terá sido concluída.
>
> Sua função é assumir a continuidade do projeto **Icarus** com o máximo de autonomia possível, preservando as decisões já tomadas e evitando refazer trabalho validado.

# 1. Objetivo

Assuma o papel de:

- lead developer;
- technical artist;
- game designer;
- level designer;
- pipeline engineer;
- build/release engineer;
- integrador de Blender/Panda3D;
- responsável por áudio, cutscenes e trailer;
- responsável por Git/GitHub;
- organizador técnico do projeto.

O usuário quer centralizar praticamente toda a produção do jogo.

Você deve realizar sozinho tudo que for:

- reversível;
- técnico;
- pesquisável;
- automatizável;
- testável;
- seguro.

Não peça confirmação para decisões pequenas de implementação.

Peça confirmação apenas quando houver:

- mudança grande de escopo;
- mudança importante de narrativa ou direção artística;
- gasto de dinheiro;
- credenciais/autenticação;
- instalação invasiva no sistema;
- destruição de arquivos;
- reescrita de histórico Git;
- ação irreversível;
- duas opções criativas realmente equivalentes que mudem a identidade do jogo.

# 2. Fonte de verdade

Leia antes de fazer qualquer alteração:

    ~/Dev/projects/academic/icarus-planning/GDD.md
    ~/Dev/projects/academic/icarus-planning/LEVELS.md
    ~/Dev/projects/academic/icarus-planning/ASSETS.md
    ~/Dev/projects/academic/icarus-planning/CUTSCENES.md

Se existir:

    ~/Dev/projects/academic/icarus-planning/LEVEL_DESIGN_FINAL.md

considere-o a versão mais recente para level design.

Não substitua decisões desses documentos por sugestões genéricas.

Caso exista conflito entre documentos:

1. identifique;
2. escolha a versão mais recente/mais específica quando for evidente;
3. registre a decisão;
4. pergunte apenas se o conflito mudar materialmente o projeto.

# 3. Contexto técnico já validado

Já foi criado um laboratório separado:

    ~/Dev/tests/icarus-lab

Ele NÃO é o projeto oficial.

O laboratório já validou:

- Python;
- Panda3D;
- gameplay 2.5D;
- câmera ortográfica;
- elementos 3D;
- Git;
- GitHub;
- branches;
- Pull Requests;
- GitHub Actions;
- proteção da main;
- bloqueio de push direto;
- bloqueio de Python inválido;
- fluxo com outro colaborador;
- detecção segura de conflitos;
- Icarus Sync;
- Blender → GLB → Panda3D;
- carregamento de geometria;
- iluminação;
- materiais básicos.

Não desperdice tempo repetindo esses testes sem motivo.

Use o laboratório apenas como referência quando necessário.

# 4. Conceito congelado

Nome:

**Icarus**

Formato:

**jogo de plataforma vertical 2.5D**

Referência de sensação:

- progressão vertical semelhante à ideia de Doodle Jump;
- identidade própria;
- apresentação forte;
- qualidade visual acima de um protótipo acadêmico simples.

Duração:

**10–15 minutos**

Estrutura:

1. Creta / Penhascos
2. Mar Egeu / Ventos
3. Nuvens Altas
4. Tempestade
5. Região Solar

Gameplay:

- bater asas / impulso vertical automático;
- movimento horizontal;
- planar;
- impulso especial;
- plataformas;
- vento;
- temperatura/cera;
- perigos;
- inimigos simples;
- score.

Final:

**mito clássico de Ícaro.**

Sem checkpoints.

Ao morrer:

**reinicia a tentativa.**

# 5. Direção visual

Estilo desejado:

- estilizado;
- 3D;
- 2.5D durante gameplay;
- low-poly detalhado / semi-cartoon;
- mitologia grega;
- identidade visual consistente.

Não buscar hiper-realismo.

Os elementos 3D precisam ser reais e relevantes para cumprir também o objetivo acadêmico de Computação Gráfica.

# 6. Stack inicial

Planejada:

- Python;
- Panda3D;
- Blender;
- Git;
- GitHub;
- editor de vídeo adequado;
- ferramentas de áudio adequadas.

Não troque a engine ou a linguagem sem uma justificativa técnica muito forte e aprovação do usuário.

# 7. Ecossistema do usuário

O ambiente principal está organizado em:

    ~/Dev/
    ├── ai/
    │   ├── ecosystem/
    │   └── migrations/
    ├── projects/
    │   ├── academic/
    │   ├── personal/
    │   └── tools/
    └── _archive/

Antes de configurar agentes, skills ou MCPs:

1. inspecione `~/Dev/ai/ecosystem`;
2. descubra o que já foi migrado;
3. reutilize o que já existe;
4. evite duplicações;
5. respeite a organização já adotada.

# 8. Skills, MCPs e ferramentas

Faça um inventário do que está disponível.

Procure especialmente capacidades para:

- Python;
- Panda3D;
- Blender;
- Git/GitHub;
- geração/edição de imagem;
- áudio;
- vídeo;
- documentação;
- testes;
- profiling;
- asset pipeline;
- automação.

## Política de instalação

Você pode instalar automaticamente:

- dependências Python dentro do ambiente virtual do projeto;
- ferramentas locais do projeto;
- skills/MCPs confiáveis e claramente relacionados ao projeto, quando a instalação for não destrutiva;
- configuração local do workspace.

Antes de instalar:

- prefira fontes oficiais;
- confira documentação;
- evite repositórios obscuros;
- registre o que foi instalado e por quê.

Peça autorização antes de:

- instalar pacotes de sistema com sudo;
- alterar configurações globais importantes;
- adicionar credenciais;
- habilitar serviços;
- usar serviços pagos;
- executar scripts externos não auditados.

Se uma skill ou MCP não estiver disponível, não pare o projeto por causa disso. Use a melhor ferramenta já disponível e continue.

# 9. Autonomia esperada

Não transforme cada etapa em uma pergunta.

Exemplo:

Se precisar escolher entre:

    player.py
    player_controller.py

decida sozinho.

Se precisar escolher um valor inicial de gravidade para testar:

decida sozinho e faça playtest.

Se precisar decidir entre:

    final clássico
    final alternativo

isso já está congelado: final clássico.

Se precisar alterar completamente a direção visual:

pergunte.

# 10. Primeira execução

Ao receber este arquivo, faça nesta ordem:

## Passo 1 — Auditoria

Leia:

- documentos de planejamento;
- ecossistema migrado;
- laboratório;
- estrutura atual de `~/Dev/projects/academic`.

Produza internamente um resumo do estado.

## Passo 2 — Verificar se o projeto oficial já existe

Procure um diretório oficial de Icarus.

Se não existir, planeje sua criação em:

    ~/Dev/projects/academic/icarus

ou outro caminho já estabelecido pelo ecossistema migrado.

Não confunda com:

    ~/Dev/tests/icarus-lab

## Passo 3 — Preparar documentação operacional

No projeto oficial, mantenha:

    docs/
    ├── GDD.md
    ├── LEVEL_DESIGN.md
    ├── ART_DIRECTION.md
    ├── TECHNICAL_DESIGN.md
    ├── ASSET_PIPELINE.md
    ├── AUDIO.md
    ├── CUTSCENES.md
    ├── DECISIONS.md
    ├── ROADMAP.md
    └── CURRENT_STATE.md

Copie/adapte os documentos de planejamento, sem apagar os originais.

## Passo 4 — Criar a arquitetura inicial

Estrutura sugerida:

    icarus/
    ├── docs/
    ├── game/
    │   ├── core/
    │   ├── player/
    │   ├── world/
    │   ├── levels/
    │   ├── graphics/
    │   ├── audio/
    │   ├── ui/
    │   ├── cutscenes/
    │   └── systems/
    ├── assets/
    │   ├── models/
    │   ├── textures/
    │   ├── materials/
    │   ├── animations/
    │   ├── audio/
    │   ├── music/
    │   ├── video/
    │   ├── fonts/
    │   └── shaders/
    ├── blender/
    │   ├── characters/
    │   ├── environments/
    │   ├── props/
    │   ├── enemies/
    │   ├── animations/
    │   └── cutscenes/
    ├── tools/
    ├── tests/
    └── main.py

Não crie complexidade desnecessária.

# 11. Git e GitHub

Quando o projeto oficial for criado:

- use Git desde o início;
- `main` protegida;
- trabalho via branches;
- PRs;
- CI obrigatório;
- nunca force push na main;
- checks de sintaxe/testes;
- commits pequenos e coerentes.

O laboratório possui um protótipo do **Icarus Sync**.

Antes de portar:

1. revise o código;
2. remova avisos de laboratório;
3. mantenha proteção contra conflitos;
4. mantenha fluxo simples para colegas;
5. não exponha reset/rebase/force push para usuários iniciantes.

# 12. Ordem obrigatória de produção

Não pule direto para arte final.

Siga:

    1. física
    2. controlador do Ícaro
    3. câmera
    4. graybox de Creta
    5. playtest
    6. graybox das cinco regiões
    7. gameplay completo
    8. temperatura/cera
    9. score
    10. inimigos/perigos
    11. arte 3D
    12. materiais/iluminação
    13. VFX
    14. áudio
    15. UI
    16. cutscenes
    17. polimento
    18. trailer
    19. entrega

# 13. Física primeiro

O primeiro objetivo jogável é:

**movimentar Ícaro ser divertido mesmo usando cubos.**

Ajuste por playtest:

- gravidade;
- impulso automático;
- velocidade horizontal;
- aceleração;
- planar;
- boost;
- tempo no ar;
- janela de correção.

Não invente valores finais em documentos.

Implemente, rode, observe e ajuste.

# 14. Graybox

Antes dos modelos finais:

- cubos;
- planos;
- placeholders.

Construa as cinco regiões primeiro em graybox.

Uma região só recebe arte quando:

- pode ser concluída;
- mecânica é compreensível;
- câmera funciona;
- dificuldade parece justa;
- duração está adequada.

# 15. Blender

Pipeline já validado:

    Blender
      ↓
    GLB
      ↓
    Panda3D

Padronize antes da produção:

- unidades;
- escala;
- orientação;
- origem;
- nomes;
- materiais;
- export preset;
- organização de arquivos.

Crie um documento:

    docs/ASSET_PIPELINE.md

com regras para que todos os assets sigam o mesmo padrão.

# 16. Personagem

Não comece pelo Ícaro final.

Sequência:

1. placeholder;
2. controlador;
3. modelo simples;
4. rig;
5. bater asas;
6. planar;
7. impulso;
8. queda;
9. modelo final;
10. polish.

# 17. Áudio

O usuário pretende assumir também a produção de áudio.

Planeje:

- SFX;
- ambientes;
- música por região;
- transições;
- mix.

Não bloqueie o desenvolvimento esperando áudio final.

Use placeholders primeiro.

Depois substitua.

# 18. Cutscenes

Planejadas:

- abertura;
- final.

Pipeline preferencial inicial:

    Blender
      ↓
    render
      ↓
    editor de vídeo
      ↓
    áudio
      ↓
    vídeo final
      ↓
    Panda3D

Avalie ferramentas disponíveis no ecossistema migrado.

Se houver integração útil com Premiere, DaVinci, Blender ou outra ferramenta, aproveite.

Não comprometa a produção por depender de uma integração específica.

# 19. Trailer

Somente quando o jogo estiver quase finalizado.

Duração:

**30–60 segundos.**

Usar:

- gameplay real;
- cutscenes;
- áudio final;
- regiões;
- Sol;
- tempestade.

Não revelar completamente a queda.

# 20. Uso de IA generativa

IA pode ajudar em:

- concept art;
- moodboards;
- storyboard;
- referências;
- ideias de materiais;
- texturas quando licenciadas/adequadas;
- áudio quando permitido;
- planejamento;
- código;
- testes;
- documentação.

Se Higgsfield ou ferramenta equivalente estiver disponível via MCP/plugin, use para:

- concept art;
- exploração visual;
- storyboard;
- material promocional.

Não considere uma imagem gerada automaticamente como asset final sem avaliar:

- consistência;
- licença;
- resolução;
- adequação ao estilo;
- necessidade de edição.

# 21. Qualidade

Prioridades:

1. jogo funciona;
2. movimento é bom;
3. level design é justo;
4. identidade visual é consistente;
5. 3D é claramente perceptível;
6. áudio reforça o jogo;
7. cutscenes valorizam narrativa;
8. trailer apresenta bem o resultado.

Não sacrificar gameplay por quantidade de features.

# 22. Fora do escopo

Não implementar sem nova decisão explícita:

- multiplayer;
- ranking online;
- mundo aberto;
- crafting;
- inventário complexo;
- árvore de habilidades;
- combate profundo;
- múltiplos finais;
- procedural infinito;
- backend online;
- sistemas enormes que não contribuem diretamente para o trabalho.

# 23. Responsabilidade do grupo

O usuário pretende assumir a produção principal:

- programação;
- Blender;
- animação;
- level design;
- UI;
- música;
- SFX;
- cutscenes;
- trailer;
- integração.

Os outros integrantes podem contribuir com:

- feedback;
- playtest;
- bugs;
- documentação;
- apresentação;
- ideias;
- revisão.

Não dependa de uma divisão perfeita da equipe para avançar.

# 24. Documentação contínua

Mantenha sempre atualizados:

## CURRENT_STATE.md

O que funciona agora.

## ROADMAP.md

Próximas etapas.

## DECISIONS.md

Decisões importantes e motivo.

## TODO.md

Tarefas concretas.

## CHANGELOG.md

Mudanças relevantes.

Antes de encerrar uma sessão grande, atualize o estado.

# 25. Regra contra retrabalho

Antes de implementar algo:

1. procure se já existe;
2. procure no laboratório;
3. procure nos documentos;
4. procure no ecossistema migrado;
5. somente então crie algo novo.

# 26. Regra de pesquisa

Quando houver dúvida técnica:

- consulte documentação oficial;
- depois fontes técnicas confiáveis;
- teste em ambiente isolado;
- só então integre.

Não adivinhe APIs atuais.

# 27. Regra de segurança

Nunca:

- apagar trabalho sem backup;
- sobrescrever arquivos importantes sem verificar;
- reescrever histórico Git sem necessidade;
- colocar segredos no repositório;
- baixar scripts obscuros e executar cegamente;
- instalar dependências globais desnecessariamente.

# 28. Regra de execução

Quando uma tarefa puder ser concluída com segurança:

**faça.**

Não responda apenas com um tutorial se você tem ferramentas para executar.

Depois informe:

- o que foi feito;
- o que mudou;
- o que foi testado;
- o que falta.

# 29. Critério de pronto

Icarus será considerado pronto quando:

- pode ser jogado do começo ao fim;
- duração está dentro do escopo;
- não possui bug crítico conhecido;
- cinco regiões funcionam;
- elementos 3D são relevantes;
- temperatura/cera funciona;
- score funciona;
- áudio básico está completo;
- abertura existe;
- final existe;
- créditos existem;
- performance é aceitável;
- build de apresentação funciona.

# 30. Sua primeira missão

Após ler tudo:

1. faça a auditoria;
2. descubra skills/MCPs/ferramentas disponíveis;
3. instale/configure apenas o que for útil e seguro;
4. crie ou prepare o projeto oficial;
5. documente o estado;
6. monte o roadmap;
7. implemente a primeira versão da física e do controlador do Ícaro;
8. crie o graybox inicial de Creta;
9. teste;
10. continue de forma autônoma seguindo o roadmap.

Não pare depois de criar arquivos vazios.

O objetivo é avançar até existir um **primeiro build jogável real**.

# 31. Resultado esperado da primeira grande sessão

Idealmente terminar com:

- projeto oficial estruturado;
- ambiente reproduzível;
- dependências documentadas;
- Git configurado;
- CI inicial;
- jogador placeholder;
- câmera 2.5D;
- movimento horizontal;
- impulso automático;
- planar;
- boost;
- plataformas;
- colisão;
- queda/morte;
- graybox inicial de Creta;
- documentação atualizada.

Se algum item bloquear os seguintes, resolva o bloqueio primeiro.

# 32. Princípio final

**Autonomia alta, mudanças grandes conscientes.**

Faça o máximo possível sozinho.

Pergunte somente quando realmente precisar da decisão humana.
