"""Aplicação Panda3D do Icarus.

Esqueleto inicial: abre a janela com a câmera ortográfica 2.5D.
Física, controlador do Ícaro e graybox de Creta entram nas próximas etapas
(ver docs/ROADMAP.md).
"""

from direct.showbase.ShowBase import ShowBase
from panda3d.core import loadPrcFileData

from game import camera

loadPrcFileData(
    "",
    """
window-title Icarus
win-size 1280 720
sync-video true
""",
)


class IcarusApp(ShowBase):
    def __init__(self) -> None:
        super().__init__()
        self.disableMouse()
        self.setBackgroundColor(0.15, 0.22, 0.35, 1)
        camera.setup_orthographic(self)
        self.accept("escape", self.userExit)
