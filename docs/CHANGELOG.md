# Changelog

## 2026-09-25 — escopo do grupo registrado

- novo `GROUP_SCOPE.md`: transcrição fiel do documento de escopo do grupo, com procedência
  ("confirmado pelo Gabriel em 2026-09-25 como decisão do grupo; sujeito a alteração")
- `GROUP-DECISIONS.md`: primeira entrada em **Confirmado** (só o que o documento afirma sem
  ambiguidade) e 7 pendências `NEEDS-GROUP-APPROVAL` com as contradições e lacunas do documento;
  mudança aditiva
- `DECISIONS.md`: ICR-016 e o cruzamento das `GABRIEL-PROPOSAL` anteriores (confirmadas,
  contrariadas, pendentes); os documentos de proposta não foram editados
- `CURRENT_STATE.md`: estado do escopo atualizado; `CLAUDE.md` e `SOURCES.md` apontam para a
  transcrição
- nenhum código alterado; nenhuma engine escolhida ou instalada

## 2026-09-21 — status documental corrigido: design é proposta, não decisão

- `GDD.md`, `LEVEL_DESIGN.md`, `ASSETS.md`, `CUTSCENES.md`, `ROADMAP.md` e `TECHNICAL_DESIGN.md`
  marcados como `GABRIEL-PROPOSAL` / `NEEDS-GROUP-APPROVAL`. **Nenhuma ideia foi apagada**;
  o conteúdo criativo ficou intacto e só o status mudou
- `DECISIONS.md`: legenda das três categorias, classificação de ICR-001…ICR-011 e novas entradas
  ICR-012…ICR-015 (a tabela antiga não foi reescrita, conforme a regra do arquivo)
- `CURRENT_STATE.md`: deixa explícito que a infraestrutura foi preparada mas o escopo e o design
  não foram aprovados pelo grupo; separa o que é técnico do que depende do grupo
- novo `GROUP-DECISIONS.md`, com as seções vazias — nada foi preenchido por suposição
- `CLAUDE.md`, `README.md` e `TODO.md` atualizados para não induzir uma sessão futura a tratar
  proposta como escopo fechado
- nenhum código alterado; nenhum laboratório tocado

## 2026-09-19 — ambiente Python 3.12 validado

- Python 3.12.14 (pacote Fedora `python3.12`) e `.venv` local criados
- `requirements-dev.txt` instalado nas versões fixadas; `pip check` limpo
- imports validados: `panda3d`, `gltf` (`panda3d-gltf`), `simplepbr`, `pytest`
- código do projeto compila e importa sem erro; ainda sem testes automatizados

## 2026-09-19 — bootstrap

- repositório criado com Git LFS, `.gitignore`, `.python-version` (3.12) e requirements fixados
- documentos de design importados (procedência em `docs/SOURCES.md`)
- esqueleto de código com janela e câmera ortográfica (não executado)
- docs novos: pipeline de assets, design técnico, decisões, roadmap, estado, TODO
