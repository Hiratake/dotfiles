#!/bin/sh

cd `dirname $0`
sh -c "$(wget -qO- get.chezmoi.io)" -- init --apply -S .
