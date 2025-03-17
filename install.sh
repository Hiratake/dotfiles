#!/bin/sh

cd `dirname $0`
sh -c "$(curl -fsSL get.chezmoi.io)" -- init --apply -S .
