#!/bin/bash

# Install script to install all thinkvim dependencies

set -e

SCRIPTPATH="$(realpath -s $0)"
SCRIPTDIR=$(dirname ${SCRIPTPATH})
NVIM_ROOT="$(realpath "${SCRIPTDIR}/..")"

echo $NVIM_ROOT

# For GUI prompts and VCoolor.vim support
sudo apt install yad zenity
# Taskwarrior
sudo apt install taskwarrior
# C/C++ language server for coc (Debian based and Ubuntu 20.04 only)
sudo apt install ccls

# python host prog
if command -v python &> /dev/null; then
  mkdir -p ${NVIM_ROOT}/env/python
  if command -v virtualenv &> /dev/null; then
    virtualenv --python=python ${NVIM_ROOT}/env/python/env
  else
    python -m venv ${NVIM_ROOT}/env/python/env
  fi
  if source ${NVIM_ROOT}/env/python/env/bin/activate; then
    pip install wheel neovim
    pip install send2trash # For Defx file deletion support
    pip install git+git://github.com/tbabej/tasklib@develop # For tbabej/taskwiki
    deactivate
  fi
fi

# python3 host prog
if command -v python3 &> /dev/null; then
  mkdir -p ${NVIM_ROOT}/env/python3
  if command -v virtualenv &> /dev/null; then
    virtualenv --python=python3 ${NVIM_ROOT}/env/python3/env
  else
    python3 -m venv ${NVIM_ROOT}/env/python3/env
  fi
  if source ${NVIM_ROOT}/env/python3/env/bin/activate; then
    pip3 install wheel neovim
    pip3 install send2trash # For Defx file deletion support
    pip3 install git+git://github.com/tbabej/tasklib@develop # For tbabej/taskwiki
    deactivate
  fi
fi

# Npm packages for linking and formatter
if command -v npm &> /dev/null; then
  npm install -g eslint stylelint prettier
else
  echo
  echo "Error: npm package manager not found... SKIPPING"
  echo
fi

echo
echo "Done!"
