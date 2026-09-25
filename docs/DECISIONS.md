# Registro de decisões

Registro do grupo, recomeçado em 2026-09-25. O histórico anterior está no Git, no commit `8d19488` e
anteriores.

Rótulos: **DECIDIDO (grupo)** · **PENDENTE (grupo)** · **TÉCNICO (verificado)** — ver
[`GROUP-DECISIONS.md`](GROUP-DECISIONS.md).

Decisões novas entram no fim. Uma decisão não é reescrita: outra entrada a substitui e diz qual.

| ID | Data | Decisão | Status | Referência |
|---|---|---|---|---|
| G-001 | 2026-09-25 | Escopo do jogo aprovado pelo grupo, sujeito a alteração | **DECIDIDO (grupo)** | [`GROUP_SCOPE.md`](GROUP_SCOPE.md); o que ficou em aberto está em [`GROUP-DECISIONS.md`](GROUP-DECISIONS.md#pendente) |
| G-002 | 2026-09-25 | Engine e linguagem: **Godot 4 + GDScript**. Substitui só o trecho do documento de escopo que cita Python e "gamepy"; a transcrição em `GROUP_SCOPE.md` fica intacta | **DECIDIDO (grupo)**, por delegação: o grupo delegou a escolha da engine a um integrante | [justificativa abaixo](#g-002--godot-4--gdscript) |
| G-003 | 2026-09-25 | Infraestrutura: Git LFS para `*.blend`, `*.glb`, `*.png`, `*.wav` e `*.ogg`; repositório privado no GitHub, branch `main` | **TÉCNICO (verificado)** | `.gitattributes` |

## G-002 — Godot 4 + GDScript

O documento de escopo cita Python e uma engine "gamepy", que não existe com esse nome. O grupo
delegou a escolha da engine, e a escolha foi Godot 4 com GDScript, pelos motivos abaixo.

- **A disciplina exige elementos 3D, não uma linguagem.** Trocar Python por outra linguagem não
  descumpre nenhum requisito; deixar o 3D de fora descumpriria.
- **O 3D é parte real do jogo.** O Godot importa os modelos feitos no Blender e combina 3D e 2D na
  mesma cena. Os elementos 3D entram no jogo como modelos, não como imagens pré-renderizadas.
- **A maior parte do escopo já vem pronta na engine:** física de plataforma e salto, plataformas
  móveis e que quebram, parallax para os cinco cenários, telas e HUD, animações e sons.
- **GDScript é a linguagem nativa do Godot**, a mais integrada ao editor e a mais documentada, com
  sintaxe próxima da de Python.
- **Godot é gratuito e open source**, e os arquivos de projeto (cenas, recursos, configuração) são
  texto, o que funciona bem no Git com vários integrantes.

Continua **PENDENTE (grupo)**: como os elementos 3D entram no jogo (pendência 7 em
[`GROUP-DECISIONS.md`](GROUP-DECISIONS.md#pendente)). A decisão de engine não responde essa
pergunta.
