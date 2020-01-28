#!/usr/bin/env bash

# Taps
modules="
    homebrew/cask-fonts
"
for module in ${modules}; do
    brew tap ${module}
done

# Fonts
modules="
    font-anonymouspro-nerd-font
    font-consolas-for-powerline
    font-dejavusansmono-nerd-font
    font-firacode-nerd-font
    font-hack-nerd-font
    font-menlo-for-powerline
    font-meslo-nerd-font
    font-monofur-nerd-font
    font-monoid-nerd-font
    font-mononoki-nerd-font
    font-profont-nerd-font
    font-robotomono-nerd-font
    font-source-code-pro-for-powerline
    font-sourcecodepro-nerd-font
    font-spacemono-nerd-font
    font-terminus-nerd-font
    font-ubuntu-nerd-font
"
for module in ${modules}; do
    brew cask install ${module}
done


