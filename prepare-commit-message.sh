#!/bin/bash
#mkdir -p ~/.git-templates/hooks
#cp $PWD/prepare-commit-message.sh ~/.git-templates/hooks/prepare-commit-msg
#git config --global core.hooksPath ~/.git-templates/hooks

BRANCH_NAME=$(git branch --list | ag "^\*" | ag -o "[A-Z]{2,4}-[0-9]+")
if [ -n "$BRANCH_NAME" ]; then
    echo "[$BRANCH_NAME] $(cat $1)" > $1
fi
