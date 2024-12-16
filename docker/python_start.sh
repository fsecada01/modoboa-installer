#!/bin/bash
cd /opt/modoboa || exit
source .venv/bin/activate
python -m run "${FQDN}"
