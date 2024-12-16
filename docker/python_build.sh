#!/bin/bash

curl -LsSf https://astral.sh/uv/install.sh | sh
PATH="/root/.local/bin/:$PATH"
cd /opt/modoboa || exit
uv venv .venv
source .venv/bin/activate
python3.13 -m pip install -U pip pip-tools setuptools wheel -I
