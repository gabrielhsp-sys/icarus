# Icarus — instruções para agentes

Jogo do grupo em Godot 4 + GDScript, com elementos 3D modelados no Blender. Leia só o que a tarefa
pedir.

## Onde está cada coisa

- escopo do jogo (fonte única): `docs/GROUP_SCOPE.md` — transcrição fiel; não editar o texto do grupo
- o que está decidido e o que está pendente: `docs/GROUP-DECISIONS.md`
- registro de decisões: `docs/DECISIONS.md` (decisões novas entram no fim)
- estado atual e mudanças: `docs/CURRENT_STATE.md`, `docs/CHANGELOG.md`
- como abrir, rodar e estrutura de pastas: `README.md`

Rótulos usados nos docs: **DECIDIDO (grupo)** · **PENDENTE (grupo)** · **TÉCNICO (verificado)**.

## Regras

1. O escopo vem só de `GROUP_SCOPE.md` e da seção Decidido de `GROUP-DECISIONS.md`. Se uma tarefa
   depender de uma pendência (número de fases, final, jump de impulso, flechas e inimigos,
   controles, **como o 3D entra no jogo** etc.), pare e diga que falta decisão do grupo.
2. Não decida pelo grupo: mecânicas, fases, arte, divisão de tarefas, workflow Git e cronograma são
   decisões do grupo. Em particular, não escolha entre 2D e 3D para personagem e plataformas.
3. Valores de física, distâncias e tempos são tuning: implementar, testar, ajustar. Não registrar
   números "finais" nos docs.
4. Binários (`*.blend`, `*.glb`, `*.png`, `*.wav`, `*.ogg`) só via Git LFS. Nunca commitar
   `.godot/`, `.blend1`, builds exportados ou `.env`.
5. Arquivos `.import` e `.uid` gerados pelo Godot são versionados junto com o recurso.
6. Scripts em GDScript, em `scripts/`; cenas em `scenes/`; assets em `assets/{models,textures,audio}/`.
7. Não instalar pacotes de sistema, plugins ou serviços; não criar remoto, fazer push, alterar
   configurações do GitHub nem reescrever histórico sem pedido explícito.
8. Antes de concluir uma mudança, rode a validação (abaixo) e exija código de saída 0.
9. Ao fim de uma mudança relevante, atualize `docs/CURRENT_STATE.md` e `docs/CHANGELOG.md`.

## Comandos

```bash
godot --path . --editor           # abre o editor
godot --path .                    # roda o jogo (ESC fecha)
godot --headless --path . --quit  # validação sem janela; exige código 0
```

Com Godot via Flathub: `flatpak run org.godotengine.Godot` no lugar de `godot`.
