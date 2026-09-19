# Pipeline de assets — Blender → GLB → Panda3D

Status: **rascunho inicial**. As regras abaixo precisam ser validadas no primeiro teste de pipeline
(ver `docs/TODO.md`) e ajustadas com o que for medido.

## Ferramentas

- Blender 5.2.x (exportador glTF 2.0 embutido)
- `panda3d-gltf` (loader de `.glb`) + `panda3d-simplepbr` (materiais PBR), versões em `requirements.txt`

## Organização

- fonte editável: `blender/<categoria>/<nome>.blend`
- export para o jogo: `assets/models/<nome>.glb`
- mesmo `<nome>` nos dois lados, em minúsculas com hífen (ex.: `coluna-creta`)
- nunca salvar `.blend` dentro de `assets/`; nunca exportar GLB para dentro de `blender/`
- `.blend1`/`.blend@` são ignorados pelo Git

## Regras de modelagem

- unidades: **métricas**, `Unit Scale = 1.0` (1 unidade Blender = 1 unidade Panda3D)
- aplicar transformações antes de exportar (`Ctrl+A → All Transforms`): escala do objeto = 1
- origem do objeto em posição com significado (base ou centro do objeto), definida por categoria
- nomes de objetos e materiais descritivos — nada de `Cube.001` / `Material.001`
- eixos: Blender e Panda3D usam Z para cima; o glTF usa Y para cima e a conversão é feita pelo exportador
  (`+Y Up`) e pelo `panda3d-gltf`. Não compensar rotações à mão.

## Exportação (preset a fixar)

- formato: glTF Binary (`.glb`)
- incluir: objetos selecionados ou coleção do asset
- aplicar modificadores; incluir materiais; texturas embutidas no GLB
- registrar aqui o preset definitivo depois do teste de pipeline

## Validação obrigatória de cada asset novo

1. exportar o GLB
2. abrir com o visualizador de `tools/` (a criar) e conferir escala, orientação, origem e material
3. só então referenciar no código

## Evidência herdada do laboratório

- `tests/icarus-blender-test` validou geometria Blender → GLB → Panda3D.
- **O material ainda não foi comprovado**: o único GLB salvo no laboratório não tem material
  e o `.blend` com material nunca foi exportado. Fechar isso no primeiro teste de pipeline.
