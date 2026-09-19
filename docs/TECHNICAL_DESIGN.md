# Design técnico

Status: **inicial**. Descreve a arquitetura planejada; atualizar conforme o código evolui.

## Stack

- Python 3.12, Panda3D 1.10.16
- `panda3d-gltf` + `panda3d-simplepbr` para modelos GLB vindos do Blender
- pytest para testes automatizados

## Arquitetura

```text
main.py                 entrypoint
game/app.py             IcarusApp (ShowBase): janela, loop, ligação entre sistemas
game/camera.py          câmera ortográfica 2.5D (perspectiva só em momentos cinematográficos)
game/core/              configuração e parâmetros de tuning
game/player/            controlador do Ícaro
game/world/             plataformas, colisão, vento, perigos
game/levels/            dados das regiões (graybox primeiro)
```

Princípio: a lógica de física/controle deve ser testável sem abrir janela (funções puras
recebendo estado + `dt`), deixando o Panda3D só para renderização e input.

## Modelo de movimento (a implementar — ver `docs/LEVEL_DESIGN.md` §4)

- impulso vertical automático periódico (bater asas)
- movimento horizontal com leve inércia
- planar: reduz a queda e melhora a correção horizontal
- impulso especial: uma carga por salto, recarrega ao tocar plataforma

Diferença importante em relação ao laboratório: `tests/icarus-lab/main.py` usa
"quicar ao tocar a plataforma" (estilo Doodle Jump). O Icarus oficial usa impulso de asa periódico.
Do laboratório reaproveitam-se apenas ideias: lente ortográfica 16:9, câmera que só sobe,
colisão só por cima da plataforma e wrap lateral.

## Câmera

- gameplay: ortográfica, acompanha verticalmente, mantém espaço acima de Ícaro
- perspectiva 3D apenas em momentos cinematográficos definidos no level design

## Não decidido ainda

- formato dos dados de nível (Python vs. arquivo de dados)
- sistema de colisão (manual vs. `CollisionTraverser` do Panda3D)
- estrutura de estados do jogo (menu, jogando, morte, final)
