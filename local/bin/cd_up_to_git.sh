#!/usr/bin/env bash

PWD=$(pwd)

counter=0
function git_dir {
  if [[ $PWD == "$HOME" ]]; then
    return 0
  fi

  if [[ $counter -eq 0 && -d ".git/" ]]; then
    cd ..
  fi

  ((counter+=1))
  if [[ ! -d ".git/" && ! -f "HEAD" ]]; then
    cd ..
    git_dir "$PWD"
  fi
}

git_dir "$PWD"
