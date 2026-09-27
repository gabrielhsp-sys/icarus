# Icarus

Jogo de plataforma vertical inspirado no mito de Ícaro, desenvolvido em grupo para a disciplina de
Computação Gráfica (UNIFAL-MG).

## Guia rápido

Vale do começo ao fim do projeto. Se tiver dúvida em algum passo, o detalhe está em
[Como começar](docs/COMO-COMECAR.md).

### Primeira vez

Siga o guia [Como começar](docs/COMO-COMECAR.md). Ele mostra como pedir acesso ao repositório,
instalar o Git e o Godot 4.7.2 e baixar o projeto (clone).

### Todo dia

Sempre na mesma ordem: atualizar a `main`, criar uma branch, trabalhar, fazer commit, enviar a
branch (push) e abrir um Pull Request.

No **GitHub Desktop**:

1. Em **Current branch**, escolha `main` e clique em **Fetch origin** (e depois em **Pull origin**,
   se o botão aparecer).
2. Em **Current branch → New branch**, crie a branch da sua tarefa.
3. Trabalhe e salve. Escreva uma mensagem curta no campo **Summary** e clique em **Commit to** (o
   nome da sua branch).
4. Clique em **Publish branch** (ou **Push origin**, nas próximas vezes).
5. Clique em **Create Pull Request** e confirme no GitHub.

No **Git Bash**:

```bash
git switch main
git pull
git switch -c nome-da-sua-branch
# trabalhe e salve
git add .
git commit -m "o que você mudou"
git push -u origin nome-da-sua-branch
```

Depois do push, abra o Pull Request no GitHub, da sua branch para a `main`.

Três regras:

- nunca faça push na `main`;
- duas pessoas não editam a mesma cena (`.tscn`) ao mesmo tempo; combine antes com o grupo;
- Gabriel e Guilherme Falcucci revisam e aprovam os Pull Requests.

### Onde colocar cada coisa

| O quê | Pasta | Como |
|---|---|---|
| modelos 3D | `assets/models/` | `.glb` exportado do Blender: File → Export → glTF 2.0, formato `.glb`. Nome em minúsculo e sem espaço (ex.: `icaro.glb`). Escala real: 1 unidade = 1 metro |
| fundos dos 5 cenários | `assets/textures/` | um PNG de 1920×1080 por cenário |
| telas (inicial e final) e itens de poder | `assets/textures/` | imagens 2D |
| sons | `assets/audio/` | feitos no FL Studio |

Quando você põe um arquivo no projeto, o Godot cria um `.import` ao lado dele. Faça commit dos
dois juntos.

### Estilo visual

Low poly cartoon, com o Mario 64 como referência: formas simples, cores fortes e saturadas,
texturas simples. A referência é só de estilo; nada da Nintendo entra no jogo.

### Quem faz o quê

| Equipe | Quem | O quê |
|---|---|---|
| Modelos 3D (Blender) | Danilo e Luiz | Ícaro, plataformas (fixa, móvel, instável, pula-pula), inimigos, flecha e as animações de Ícaro e da plataforma quebrando |
| Visual 2D | Diogo e Gabriela | os 5 fundos, o desenho da tela inicial e da tela final, os itens de poder |
| Programação (Godot) | Gabriel e Guilherme Falcucci | movimento e salto, plataformas, flechas e inimigos, câmera, score e derrota, troca dos fundos, telas e HUD, cutscene final |
| Sons | Gabriel | todos os sons do jogo |

## O jogo

O jogador controla Ícaro e sobe pulando de plataforma em plataforma até alcançar o céu. O salto é
automático: A e D movem Ícaro para os lados, e o clique do mouse dispara flechas contra os
inimigos. A câmera é em perspectiva.

No caminho há plataformas fixas, móveis e instáveis (que quebram ao serem pisadas), plataformas
pula-pula e obstáculos cada vez mais difíceis. Os itens de poder dão um de três poderes
temporários: velocidade, pulo alto ou escudo. O score (pontuação) vem da altura alcançada. Quando
um inimigo encosta em Ícaro, ele perde pontos, é empurrado para baixo e fica piscando por um
instante, sem poder ser atingido de novo. Não há barra de vida.

Não há fases, checkpoint nem limite de tempo. A subida é contínua, e o fundo muda ao longo dela,
com um fade entre os cenários: Terra (Creta), Cidade, Subida para o céu, Nuvens e Céu. Quem cai
vê uma tela preta, e a partida recomeça. Não existe vitória: ao chegar ao céu, uma cutscene (cena
animada) mostra Ícaro caindo de costas com as asas queimando, e depois vêm os créditos e o score.

Ícaro, as plataformas e os inimigos são objetos 3D modelados no Blender; os fundos são imagens 2D.

O texto do grupo, como foi escrito, está em [`docs/GROUP_SCOPE.md`](docs/GROUP_SCOPE.md) e no
complemento [`docs/GROUP_SCOPE_COMPLEMENT.md`](docs/GROUP_SCOPE_COMPLEMENT.md). As decisões
tomadas depois (G-013 a G-024) estão em [`docs/DECISIONS.md`](docs/DECISIONS.md).

## Estado atual

**Projeto base.** O repositório tem um projeto Godot 4.7.2 mínimo: uma cena principal sem nada
do jogo, que só fecha com ESC. Nenhuma mecânica do jogo foi implementada ainda. Detalhes em
[`docs/CURRENT_STATE.md`](docs/CURRENT_STATE.md).

## Onde está cada coisa

| Pergunta | Onde |
|---|---|
| Como instalo e começo a contribuir? | [`docs/COMO-COMECAR.md`](docs/COMO-COMECAR.md) |
| O que o grupo já decidiu e o que falta decidir? | [`docs/GROUP-DECISIONS.md`](docs/GROUP-DECISIONS.md) |
| Por que cada decisão foi tomada, em ordem? | [`docs/DECISIONS.md`](docs/DECISIONS.md) |
| O que já existe no projeto? | [`docs/CURRENT_STATE.md`](docs/CURRENT_STATE.md) |
| O que mudou e quando? | [`docs/CHANGELOG.md`](docs/CHANGELOG.md) |
| O texto original do grupo | [`docs/GROUP_SCOPE.md`](docs/GROUP_SCOPE.md) e [`docs/GROUP_SCOPE_COMPLEMENT.md`](docs/GROUP_SCOPE_COMPLEMENT.md) |
| Regras para agentes de IA (Claude Code) | [`CLAUDE.md`](CLAUDE.md) |

Falta decidir só uma coisa: os inimigos (tipo, quantidade e movimento), que a equipe de Modelos 3D
vai definir. Fica em [Pendências do grupo](docs/GROUP-DECISIONS.md#pendente).

### Como ler os documentos

- **DECIDIDO (grupo)**: o grupo já decidiu.
- **PENDENTE (grupo)**: ainda falta o grupo decidir.
- **TÉCNICO (verificado)**: fato técnico conferido no próprio repositório, como "o projeto abre no
  Godot 4.7.2". Não decide nada sobre o jogo.
- **G-001, G-002…**: o número de cada decisão do grupo, na ordem em que foi registrada. A lista
  completa está em [`docs/DECISIONS.md`](docs/DECISIONS.md).

## Estrutura de pastas

```text
project.godot     configuração do projeto Godot
scenes/           cenas (.tscn); main.tscn é a cena principal
scripts/          scripts GDScript (.gd)
assets/models/    modelos 3D do Blender (.blend, .glb) — Git LFS
assets/textures/  texturas e imagens 2D (.png) — Git LFS
assets/audio/     sons (.wav, .ogg) — Git LFS
docs/             guia, escopo, decisões e estado do projeto
```

O Godot cria arquivos `.import` e `.uid` ao lado dos recursos: eles vão para o Git junto com o
recurso. A pasta `.godot/` é cache local e fica fora do Git.

## Ferramentas

| Ferramenta | Uso |
|---|---|
| [Godot 4.7.2](https://godotengine.org/) | engine do jogo; todos usam esta mesma versão |
| GDScript | linguagem dos scripts |
| [Blender](https://www.blender.org/) | modelagem dos elementos 3D |
| FL Studio | produção dos sons |
| [Git LFS](https://git-lfs.com/) | guarda os arquivos grandes: `.blend`, `.glb`, `.png`, `.wav` e `.ogg` |

A escolha da engine e os motivos estão em [`docs/DECISIONS.md`](docs/DECISIONS.md) (G-002). Use
exatamente o Godot 4.7.2: abrir o projeto em outra versão 4.x faz o Godot avisar e regravar
arquivos do projeto.

## Para quem usa o terminal

### Linux (Fedora, Godot do Flathub)

O Godot 4.7.2 vem do Flathub (`org.godotengine.Godot`).

```bash
git lfs install
git clone https://github.com/gabrielhsp-sys/icarus.git
cd icarus
flatpak run org.godotengine.Godot --version                    # deve mostrar 4.7.2.stable
flatpak run org.godotengine.Godot --path . --editor            # abre o editor
flatpak run org.godotengine.Godot --path .                     # roda o jogo
flatpak run org.godotengine.Godot --headless --path . --import # importa recursos e gera .uid/.import
flatpak run org.godotengine.Godot --headless --path . --quit   # valida sem janela; deve sair com código 0
```

Para ver o código de saída da validação, rode `echo $?` logo depois dela.

### Windows (Git Bash)

No Windows, o comum é abrir o projeto pelo próprio Godot, como no
[Como começar](docs/COMO-COMECAR.md#4-abra-o-projeto). O terminal é opcional.

Para usar o terminal, chame o Godot pelo caminho da pasta onde você extraiu o `.zip`. No exemplo,
ele está em `C:\Godot`:

```bash
cd ~/projetos/icarus
/c/Godot/Godot_v4.7.2-stable_win64.exe --version                    # deve mostrar 4.7.2.stable
/c/Godot/Godot_v4.7.2-stable_win64.exe --path . --editor            # abre o editor
/c/Godot/Godot_v4.7.2-stable_win64.exe --path .                     # roda o jogo
/c/Godot/Godot_v4.7.2-stable_win64.exe --headless --path . --import # importa recursos
/c/Godot/Godot_v4.7.2-stable_win64.exe --headless --path . --quit   # valida sem janela; deve sair com código 0
```

Se o `.zip` trouxer também um arquivo terminado em `_console.exe`, use esse no terminal: ele mostra
as mensagens do Godot na mesma janela.
