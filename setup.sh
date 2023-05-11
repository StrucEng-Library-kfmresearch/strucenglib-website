#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

set -x

venv=$SCRIPT_DIR/compas_venv
src=$SCRIPT_DIR/compas

config_add=$(cat $SCRIPT_DIR/config_add.txt)

# git submodule update --init --recursive
python3 -m venv $venv

source $SCRIPT_DIR/compas_venv/bin/activate
pip install -r $src/requirements-dev.txt
pip install -r $src/requirements.txt
pip install -r $SCRIPT_DIR/requirements.txt

cd $src

echo $config_add >> docs/conf.py

invoke docs

rm -rf $SCRIPT_DIR/docs
mkdir -p $SCRIPT_DIR/docs/compas

cp -rf dist/docs/* ../docs/compas
