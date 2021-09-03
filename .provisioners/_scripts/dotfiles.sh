#!/usr/bin/env bash

repo="kyrtapz/dotfiles.git"
repo_https="https://github.com/$repo"
repo_git="git@github.com:$repo"
branch="pdiak"

[ -d "${HOME}/.dotfiles" ] && {
    cd ${HOME}/.dotfiles
    git pull -f --depth 1 "$repo_https" "$branch"
} || {
    git clone --depth 1 --no-single-branch "$repo_https" ${HOME}/.dotfiles
    cd ${HOME}/.dotfiles
    git remote add upstream "$repo_git"
    [ -n "$branch" ] && git checkout "$branch"
}

stow zsh git code-server
