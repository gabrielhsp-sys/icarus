# Como começar

Guia para quem nunca usou Git nem Godot, no Windows 10/11. Ele vai do zero até a sua primeira
mudança enviada para o grupo revisar. Quem usa Linux encontra os comandos no
[README](../README.md#para-quem-usa-o-terminal).

## 1. Peça acesso ao repositório

O repositório é privado. Para ver e baixar o projeto, você precisa ser convidado como colaborador
pelo dono do repositório no GitHub e aceitar o convite. Sem o convite, o GitHub mostra a página como se ela não existisse
(erro 404).

## 2. Instale o Git e baixe o projeto

Escolha **uma** das duas opções: o GitHub Desktop (janelas e botões) ou o Git Bash (terminal).

> Não coloque o projeto dentro de uma pasta do OneDrive. No Windows, Documentos e Área de Trabalho
> às vezes estão no OneDrive.

### Opção A — GitHub Desktop

1. **Instale.** Abra [desktop.github.com](https://desktop.github.com) (o endereço leva para
   `github.com/apps/desktop`), baixe e instale.
2. **Entre na sua conta.** Clique em **Sign in to GitHub.com**, entre pelo navegador e autorize.
   Na configuração, no campo de e-mail, escolha o endereço que termina em
   `@users.noreply.github.com`.
3. **Baixe o projeto.** Vá em **File → Clone repository**, aba **GitHub.com**, e escolha
   `gabrielhsp-sys/icarus`. Em **Local path**, use algo como `C:\Users\SEU_USUARIO\projetos\icarus`
   e clique em **Clone**. Se ele perguntar sobre o Git LFS, aceite.

### Opção B — Git Bash

1. **Instale.** Abra [git-scm.com/download/win](https://git-scm.com/download/win), baixe e clique
   em **Next** em todas as telas. Isso instala junto o Git LFS e o Git Bash.
2. **Configure, uma vez só.** No GitHub, vá em **Settings → Emails** e copie o e-mail que termina
   em `@users.noreply.github.com`. Depois, no Git Bash:

   ```bash
   git config --global user.name "Seu Nome"
   git config --global user.email "o-email-noreply-que-voce-copiou"
   git lfs install
   ```

3. **Baixe o projeto.**

   ```bash
   mkdir -p ~/projetos
   cd ~/projetos
   git clone https://github.com/gabrielhsp-sys/icarus.git
   ```

   Na primeira vez, abre uma janela para você entrar no GitHub.

O e-mail noreply serve para o seu e-mail pessoal não aparecer nos commits. O Git LFS guarda os
arquivos grandes do projeto (modelos, imagens e sons).

## 3. Instale o Godot 4.7.2

Todos usam a mesma versão, a 4.7.2.

1. Abra [github.com/godotengine/godot/releases/tag/4.7.2-stable](https://github.com/godotengine/godot/releases/tag/4.7.2-stable).
2. Em **Assets**, baixe `Godot_v4.7.2-stable_win64.exe.zip`. **Não** baixe a versão "mono": ela é
   para .NET (C#), e o projeto usa GDScript.
3. Extraia o `.zip` numa pasta fixa, por exemplo `C:\Godot`, e abra o `.exe`. O Godot não tem
   instalador.
4. Se o Windows avisar que protegeu o computador, clique em **Mais informações** e depois em
   **Executar assim mesmo**.

## 4. Abra o projeto

No Godot, clique em **Importar**, vá até a pasta `icarus`, escolha o arquivo `project.godot` e
clique em **Importar e Editar**.

Com o projeto aberto, **F5** roda o jogo e **ESC** fecha.

## 5. O dia a dia

Cada pessoa trabalha na sua própria **branch** (uma linha de trabalho separada). A `main` é a
versão principal do projeto e só muda por Pull Request.

Três palavras aparecem em todo passo:

- **commit**: um registro da sua mudança, com uma mensagem curta dizendo o que você fez;
- **push**: enviar os seus commits para o GitHub (no GitHub Desktop, **Publish branch** ou
  **Push origin**);
- **Pull Request**: o pedido para o grupo revisar a sua mudança e juntá-la à `main`.

**Fetch origin** e **Pull origin** buscam no GitHub o que os outros já juntaram à `main`, para você
começar da versão mais nova.

### No GitHub Desktop

1. Em **Current branch**, escolha `main`, clique em **Fetch origin** e depois em **Pull origin**.
2. Clique em **New branch** e dê um nome à sua tarefa (ex.: `arte-plataformas`).
3. Trabalhe no projeto e salve.
4. Escreva o que você fez no campo **Summary** e clique em **Commit**.
5. Clique em **Publish branch** (nas próximas vezes, **Push origin**).
6. Clique em **Create Pull Request** e avise no grupo.

### No Git Bash

```bash
cd ~/projetos/icarus
git switch main
git pull
git switch -c nome-da-sua-branch
# trabalhe no projeto e salve
git status          # mostra o que mudou
git add .
git commit -m "descreve o que você fez"
git push -u origin nome-da-sua-branch
```

Depois, abra o Pull Request no GitHub, da sua branch para a `main`, e avise no grupo.

### Regras

- Ninguém junta nada na `main` por conta própria.
- Duas pessoas não mexem na mesma cena (arquivo `.tscn`) ao mesmo tempo. Combine antes com o grupo.
- Gabriel e Guilherme Falcucci revisam e aprovam os Pull Requests
  ([G-012](DECISIONS.md)).

## 6. Onde salvar os seus arquivos

Cada tipo de arquivo tem uma pasta e um padrão (modelos em `.glb`, fundos em PNG de 1920×1080,
sons em `assets/audio/`). A tabela está no README, em
[Guia rápido → Onde colocar cada coisa](../README.md#onde-colocar-cada-coisa). Quem faz cada parte
está logo abaixo, em [Quem faz o quê](../README.md#quem-faz-o-quê).
