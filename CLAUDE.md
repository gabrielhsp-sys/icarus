# Icarus — instruções para agentes

Jogo do grupo em Godot 4.7.2 + GDScript, com elementos 3D modelados no Blender. Leia só o que a tarefa
pedir.

## Onde está cada coisa

- escopo do jogo: `docs/GROUP_SCOPE.md` e o complemento `docs/GROUP_SCOPE_COMPLEMENT.md`, que vale
  onde os dois diferem — transcrições fiéis; não editar o texto do grupo
- o que está decidido e o que está pendente: `docs/GROUP-DECISIONS.md`
- registro de decisões: `docs/DECISIONS.md` (decisões novas entram no fim)
- estado atual e mudanças: `docs/CURRENT_STATE.md`, `docs/CHANGELOG.md`
- como abrir, rodar e estrutura de pastas: `README.md`; passo a passo para integrantes:
  `docs/COMO-COMECAR.md`

Rótulos usados nos docs: **DECIDIDO (grupo)** · **PENDENTE (grupo)** · **TÉCNICO (verificado)**;
o significado está em `docs/GROUP-DECISIONS.md`.

## Regras

1. O escopo vem só de `GROUP_SCOPE.md`, `GROUP_SCOPE_COMPLEMENT.md` e da seção Decidido de
   `GROUP-DECISIONS.md`. Se uma tarefa depender de um item da seção Pendente de
   `GROUP-DECISIONS.md`, pare e diga que falta decisão do grupo.
2. Use o Godot 4.7.2, a versão fixada pelo grupo; outra versão pode reescrever os arquivos do projeto.
3. Não decida pelo grupo: mecânicas, cenários, arte, divisão de tarefas, workflow Git e cronograma
   são decisões do grupo. O 3D já está decidido (G-004: Ícaro, plataformas e inimigos em 3D; fundos
   em 2D); não mude essa divisão.
4. Valores de física, distâncias e tempos são tuning: implementar, testar, ajustar. Não registrar
   números "finais" nos docs.
5. Binários (`*.blend`, `*.glb`, `*.png`, `*.wav`, `*.ogg`) só via Git LFS. Nunca commitar
   `.godot/`, `.blend1`, builds exportados ou `.env`.
6. Arquivos `.import` e `.uid` gerados pelo Godot são versionados junto com o recurso.
7. Scripts em GDScript, em `scripts/`; cenas em `scenes/`; assets em `assets/{models,textures,audio}/`.
8. Não instalar pacotes de sistema, plugins ou serviços; não criar remoto, fazer push, alterar
   configurações do GitHub nem reescrever histórico sem pedido explícito.
9. Trabalhe numa branch e entregue por Pull Request; nunca commite nem faça push direto na `main`
   (G-011).
10. Antes de concluir uma mudança, rode a validação (abaixo) e exija código de saída 0.
11. Ao fim de uma mudança relevante, atualize `docs/CURRENT_STATE.md` e `docs/CHANGELOG.md`.

## Comandos

```bash
godot --path . --editor           # abre o editor
godot --path .                    # roda o jogo (ESC fecha)
godot --headless --path . --import # importa recursos; gera .uid/.import para commitar
godot --headless --path . --quit  # validação sem janela; exige código 0
```

Com Godot via Flathub: `flatpak run org.godotengine.Godot` no lugar de `godot`.
