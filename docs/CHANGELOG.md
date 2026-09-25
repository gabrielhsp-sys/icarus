# Changelog

## 2026-09-25 — Godot 4 + GDScript

- engine e linguagem decididas por delegação do grupo: Godot 4 + GDScript (`DECISIONS.md` G-002,
  com a justificativa); substituem o trecho do documento de escopo que citava Python e "gamepy"
- bootstrap Python removido; novo projeto base Godot: `project.godot`, `scenes/main.tscn` vazia e
  `scripts/main.gd` (ESC fecha), pastas `scenes/`, `scripts/` e `assets/{models,textures,audio}/`
- `.gitignore` do Godot 4 e `.gitattributes` com LF e Git LFS para os binários
- `DECISIONS.md` recomeçado; pendência da engine fechada em `GROUP-DECISIONS.md`; a pendência sobre
  o 3D passa a ser "como os elementos 3D entram no jogo"
- `README.md` e `CLAUDE.md` reescritos
- validação no Godot pendente: o Godot não estava instalado onde o projeto foi criado

## 2026-09-25 — repositório reorganizado como projeto do grupo

- documentação reduzida ao escopo aprovado pelo grupo e a fatos técnicos verificados; documentos
  de pré-produção que o grupo não aprovou foram removidos (continuam no histórico do Git, até o
  commit `04979aa`)
- `DECISIONS.md` recomeçado como registro do grupo; `GROUP-DECISIONS.md` reescrito com os rótulos
  DECIDIDO (grupo), PENDENTE (grupo) e TÉCNICO (verificado)
- engine provisória em Python, substituída no mesmo dia pela entrada acima
- `README.md` e `CLAUDE.md` reescritos

As entradas anteriores estão no histórico do Git, até o commit `04979aa`.
