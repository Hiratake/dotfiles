DOT_PATH := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
DOT_CANDIDATES := $(wildcard .??*) bin
DOT_EXCLUSIONS := .DS_Store .git .gitignore .gitmodules .github
DOT_FILES := $(filter-out $(DOT_EXCLUSIONS), $(DOT_CANDIDATES))

.DEFAULT_GOAL := help

install: ## Install dotfiles to home directory
	@echo 'Hello, dotfiles.'
	@echo 'Start to deploy dotfiles to home directory...'
	@echo ''
	@$(foreach val, $(DOT_FILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

uninstall: ## Uninstall dotfiles and this repo
	@echo 'Goodbye, dotfiles.'
	@echo 'Start to remove dotfiles in home directory...'
	@echo ''
	@-$(foreach val, $(DOT_FILES), rm -vrf $(HOME)/$(val);)
	-rm -rf $(DOT_PATH)

setup: ## Setup new environment
	@DOT_PATH=$(DOT_PATH) bash $(DOT_PATH)/etc/setup.sh

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'