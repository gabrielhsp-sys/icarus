"""Câmera ortográfica 2.5D.

Valores iniciais herdados do laboratório (tests/icarus-lab/main.py).
São parâmetros de tuning, não decisões congeladas: ajustar por playtest.
"""

from panda3d.core import OrthographicLens

# Área visível em unidades de mundo (proporção 16:9).
FILM_WIDTH = 18.0
FILM_HEIGHT = 10.125

# Distância da câmera ao plano de gameplay (eixo Y do Panda3D).
CAMERA_DISTANCE = 30.0


def setup_orthographic(base, focus_z: float = 0.0) -> OrthographicLens:
    """Configura a câmera principal com lente ortográfica olhando para o plano XZ."""
    lens = OrthographicLens()
    lens.setFilmSize(FILM_WIDTH, FILM_HEIGHT)
    base.cam.node().setLens(lens)
    follow(base, focus_z)
    return lens


def follow(base, focus_z: float) -> None:
    """Posiciona a câmera na altura indicada, mantendo o enquadramento lateral."""
    base.camera.setPos(0, -CAMERA_DISTANCE, focus_z)
    base.camera.lookAt(0, 0, focus_z)
