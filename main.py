"""Ponto de entrada do Icarus."""

import sys

from game.app import run


def main() -> int:
    return run()


if __name__ == "__main__":
    sys.exit(main())
