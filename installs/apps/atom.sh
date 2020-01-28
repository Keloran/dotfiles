#!/usr/bin/env bash
if test "$(which apm)"; then
    apm upgrade --confirm false

    modules="
        atom-beautify
        atom-clock
        busy-signal
        docker
        editorconfig
        fonts
        hyperclick
        intentions
        language-docker
        language-gradle
        linter
        linter-swagger
        linter-ui-default
        platformio-ide-terminal
        ssh-config
    "

    for module in ${modules}; do
        if test ! -d "$HOME/.atom/packages/${module}"; then
            apm install ${module}
        fi
    done

    themes="
        native-ui
        seti-ui
    "

    for theme in ${themes}; do
        if test ! -d "$HOME/.atom/packages/${theme}"; then
            apm install ${theme}
        fi
    done
fi
