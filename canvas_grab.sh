#!/bin/bash
set -e

echo "Check Python installation..."
python3 --version

echo "Check virtual environment..."

if [ ! -d ".venv" ]; then
    echo "Create virtual environment..."
    pip install virtualenv
    python -m virtualenv .venv
fi

echo "Activate virtual environment..."
source ./.venv/bin/activate

echo "Install dependencies with SJTUG mirror..."
python -m pip install --upgrade pip -i https://mirrors.sjtug.sjtu.edu.cn/pypi/web/simple
python -m pip install -r requirements.txt -i https://mirrors.sjtug.sjtu.edu.cn/pypi/web/simple

python main.py $@
