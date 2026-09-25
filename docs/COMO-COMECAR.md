# Como começar

Guia para quem nunca usou Git nem Godot. Ele leva do zero até a sua primeira mudança enviada
para o grupo revisar. Os passos são para Windows 10/11; quem usa Linux encontra a instalação do
Godot pelo Flathub no [README](../README.md#para-quem-usa-o-terminal).

## 1. Peça acesso ao repositório

O repositório é privado. Para ver e baixar o projeto, você precisa ser convidado como colaborador
pelo dono do repositório no GitHub e aceitar o convite. Sem o convite, o GitHub mostra a página
como se ela não existisse (erro 404).

## 2. Instale o Git

Escolha **uma** das duas opções:

- **GitHub Desktop** ([github.com/apps/desktop](https://github.com/apps/desktop); o endereço
  antigo `desktop.github.com` leva para lá): programa com janelas e botões, sem terminal.
- **Git para Windows** ([git-scm.com/download/win](https://git-scm.com/download/win)): instala o
  Git, o Git LFS e o Git Bash, um terminal onde você digita os comandos deste guia.

Na primeira vez que você baixar o projeto, o login no GitHub abre no navegador.

## 3. Configure o seu nome e e-mail

Todo commit (cada registro de mudança que você grava no Git) leva o seu nome e e-mail. Use o
e-mail **noreply** que o GitHub cria para você, e não o seu e-mail pessoal: no GitHub, vá em
**Settings → Emails** e copie o endereço que termina em `@users.noreply.github.com`.

Com o Git para Windows, abra o **Git Bash** e rode, uma vez só:

```bash
git config --global user.name "Seu Nome"
git config --global user.email "numero+usuario@users.noreply.github.com"
git lfs install
```

O `git lfs install` liga o Git LFS, que guarda os arquivos grandes do projeto (modelos, texturas e
sons).

## 4. Baixe o projeto (clone)

Não baixe o projeto dentro de uma pasta sincronizada pelo OneDrive (no Windows, Documentos e Área
de Trabalho costumam estar). Use uma pasta curta, como `C:\dev`.

No Git Bash:

```bash
mkdir -p /c/dev
cd /c/dev
git clone https://github.com/gabrielhsp-sys/icarus.git
```

No GitHub Desktop, use a opção de clonar um repositório e escolha `gabrielhsp-sys/icarus`.

## 5. Instale o Godot 4.7.2

O grupo usa o **Godot 4.7.2**, na versão **normal**. Não baixe a versão "mono" (.NET): ela serve
para C#, e o projeto usa GDScript.

1. Abra [github.com/godotengine/godot/releases/tag/4.7.2-stable](https://github.com/godotengine/godot/releases/tag/4.7.2-stable).
2. Baixe o arquivo `Godot_v4.7.2-stable_win64.exe.zip`.
3. Extraia o `.zip` e abra o Godot. Ele não tem instalador.
4. No Gerenciador de Projetos, clique em **Importar** e selecione o arquivo `project.godot` da
   pasta que você clonou.

Com o projeto aberto, **F5** roda o jogo e **ESC** fecha.

## 6. O dia a dia

A regra do grupo: cada pessoa trabalha na sua própria **branch** (uma linha de trabalho separada),
e a `main` é a versão principal do projeto. **Nunca envie (push) nada direto para a `main`.**

Toda vez que for trabalhar:

1. **Atualize a `main`** para partir da versão mais nova:

   ```bash
   git switch main
   git pull
   ```

2. **Crie uma branch** para a sua tarefa:

   ```bash
   git switch -c nome-da-sua-branch
   ```

3. Trabalhe no Godot e salve. Depois, **faça um commit** (registre a mudança com uma mensagem
   curta). O `git status` mostra o que mudou antes de você registrar:

   ```bash
   git status
   git add .
   git commit -m "o que você mudou"
   ```

4. **Envie a branch** para o GitHub (push):

   ```bash
   git push -u origin nome-da-sua-branch
   ```

5. **Abra um Pull Request** no GitHub, da sua branch para a `main`. O Pull Request é o pedido para
   o grupo revisar a sua mudança e juntá-la à `main`.

O GitHub Desktop tem um botão para cada um desses passos.

Duas pessoas não editam a mesma cena (arquivo `.tscn`) ao mesmo tempo: quando isso acontece, o
Git costuma gerar um conflito difícil de resolver. Antes de mexer numa cena, combine com o grupo.

**Quem aprova os Pull Requests ainda não foi decidido pelo grupo** (pendência 6 em
[`GROUP-DECISIONS.md`](GROUP-DECISIONS.md#pendente)).
