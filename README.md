# The Red Developer's Guide

[![Discord Server](https://discordapp.com/api/guilds/133049272517001216/widget.png?style=shield)](https://discord.gg/red)
[![Support Red on Patreon](https://img.shields.io/badge/Support-Red!-red.svg)](https://www.patreon.com/Red_Devs)
[![Red on readthedocs.org](https://readthedocs.org/projects/red-devguide/badge/?version=stable)](http://red-devguide.readthedocs.io/en/latest/?badge=latest)
[![Code Style: Black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)
[![Imports: isort](https://user-images.githubusercontent.com/6032823/111363465-600fe880-8690-11eb-8377-ec1d4d5ff981.png)](https://github.com/PyCQA/isort)
[![We use pre-commit!](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![PRs welcome!](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)

This guide covers how to contribute to the core Red project.

The official home of this guide is https://red-devguide.readthedocs.io.

## Building documentation

To build the documentation, you need to have Python 3.8
with `venv` module installed on your machine.

You then can use `make html` command which will create a virtual environment
under `venv` subdirectory and automatically synchronize it with the dependencies
needed by this documentation.

## Updating build dependencies

To update dependencies, run `make bumpdeps`.

## License

See the [LICENSE file](LICENSE) for details.
