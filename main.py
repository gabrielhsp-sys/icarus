"""Ponto de entrada do Icarus."""

from game.app import IcarusApp


def main() -> None:
    app = IcarusApp()
    app.run()


if __name__ == "__main__":
    main()
