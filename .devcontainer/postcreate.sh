#!/bin/env bash

git config --local --get include.path | grep -e ../.gitconfig || git config --local --add include.path ../.gitconfig

pushd "$(git rev-parse --show-toplevel)" || exit 1
if [ -f "Pipfile" ];then
  pipenv install || echo no "Pipfile" file
elif [ -f "requirements.txt" ];then 
  pip3 install --user -r requirements.txt || echo No "requirements.txt" file
fi
popd || exit 1 