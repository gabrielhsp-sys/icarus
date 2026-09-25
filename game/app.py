"""Bootstrap mínimo do Icarus em pygame: janela, loop e saída com ESC.

Não contém nenhuma mecânica de jogo.
"""

import pygame

TITLE = "Icarus"
WINDOW_SIZE = (1280, 720)
FPS = 60
BACKGROUND = (38, 56, 89)


def is_quit_event(event: pygame.event.Event) -> bool:
    """Indica se o evento encerra o jogo: fechar a janela ou apertar ESC."""
    if event.type == pygame.QUIT:
        return True
    return event.type == pygame.KEYDOWN and event.key == pygame.K_ESCAPE


def run(max_frames: int | None = None) -> int:
    """Abre a janela e roda o loop até o jogador sair.

    `max_frames` encerra o loop depois de N quadros (usado no teste de fumaça).
    Retorna o código de saída do processo.
    """
    pygame.init()
    try:
        screen = pygame.display.set_mode(WINDOW_SIZE)
        pygame.display.set_caption(TITLE)
        clock = pygame.time.Clock()
        frames = 0
        running = True
        while running:
            for event in pygame.event.get():
                if is_quit_event(event):
                    running = False
            screen.fill(BACKGROUND)
            pygame.display.flip()
            clock.tick(FPS)
            frames += 1
            if max_frames is not None and frames >= max_frames:
                running = False
    finally:
        pygame.quit()
    return 0
