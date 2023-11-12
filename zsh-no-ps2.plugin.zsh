#!/usr/bin/env zsh

'builtin' 'autoload' '-Uz' '--' "${${(%):-%x}:A:h}/zsh-no-ps2" &&
'builtin' 'zle'     '-N' 'zsh-no-ps2'                          &&
'builtin' 'bindkey' '^J' 'zsh-no-ps2'                          &&
'builtin' 'bindkey' '^M' 'zsh-no-ps2'
