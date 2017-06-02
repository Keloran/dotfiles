#!/usr/bin/env bash
if test "$(which apm)"; then
    apm upgrade --confirm false

    modules="
        atom-beautify
        docker
        editorconfig
        hyperclick
        intentions
        language-docker
        language-gradle
        linter
        linter-swagger
        linter-ui-default
        platformio-ide-terminal
        ssh-config
        busy-signal
        native-ui
        seti-ui
    "

    for module in $modules; do
        if test ! -d "$HOME/.atom/packages/$module"; then
            apm install "$module"
        fi
    done
fi
