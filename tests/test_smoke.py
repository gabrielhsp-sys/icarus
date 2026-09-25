"""Teste de fumaça do bootstrap pygame, sem tela (SDL_VIDEODRIVER=dummy)."""

import os
import subprocess
import sys
from pathlib import Path

import pygame

from game.app import is_quit_event

ROOT = Path(__file__).resolve().parents[1]


def test_bootstrap_abre_roda_quadros_e_fecha_com_codigo_zero():
    env = {**os.environ, "SDL_VIDEODRIVER": "dummy", "SDL_AUDIODRIVER": "dummy"}
    result = subprocess.run(
        [sys.executable, "-c", "import sys; from game.app import run; sys.exit(run(max_frames=10))"],
        cwd=ROOT,
        env=env,
        capture_output=True,
        text=True,
        timeout=60,
    )
    assert result.returncode == 0, result.stderr


def test_esc_e_fechar_janela_encerram_o_jogo():
    assert is_quit_event(pygame.event.Event(pygame.KEYDOWN, key=pygame.K_ESCAPE))
    assert is_quit_event(pygame.event.Event(pygame.QUIT))
    assert not is_quit_event(pygame.event.Event(pygame.KEYDOWN, key=pygame.K_SPACE))
