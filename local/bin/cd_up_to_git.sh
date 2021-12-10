#!/usr/bin/env bash

PWD=$(pwd)

function git_dir {
  dirs=$(find . -type d 2>/dev/null)
  if [[ $PWD == $HOME ]]; then
    return 0
  fi

  if [[ ! -d ".git/"  ]]; then
    cd ..
    git_dir $PWD
  fi
}

git_dir $PWD
