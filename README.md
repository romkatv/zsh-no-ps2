# zsh-no-ps2: A plugin for zsh that inserts a newline on Enter if the typed command is incomplete

Normally, when you press <kbd>Enter</kbd> in zsh, one of two things happens: if
the currently typed command is complete, zsh attempts to execute it; if it's
incomplete, zsh displays the secondary prompt, also known as `PS2`, to invite
you to continue typing the command. When this plugin is used, <kbd>Enter</kbd>
inserts a newline if the typed command is incomplete. **No PS2!**

*Note:* You can forcefully insert a newline by pressing <kbd>Escape</kbd>
followed by <kbd>Enter</kbd>, or <kbd>Alt-Enter</kbd>. This is the default
binding in zsh, not part of this plugin.

- [Installation](#installation)
- [Configuration](#configuration)
- [FAQ](#faq)
  - [How do I force execution?](#how-do-i-force-execution)

## Installation

1. Clone the repo.
   ```zsh
   git clone https://github.com/romkatv/zsh-no-ps2.git ~/zsh-no-ps2
   ```
2. Add the following line to `~/.zshrc`:
   ```zsh
   source ~/zsh-no-ps2/zsh-no-ps2.plugin.zsh
   ```

*Using a plugin manager? You can install zsh-no-ps2 the same way as any other
zsh plugin hosted on GitHub.*

When `zsh-no-ps2.plugin.zsh` is sourced, it defines a zle widget called
`zsh-no-ps2` and binds it to `^J` and `^M`—the two common escape sequences
sent on <kbd>Enter</kbd>. If you are using plugins that must be loaded after all
widgets have been defined (for example, [zsh-syntax-highlighting](
  https://github.com/zsh-users/zsh-syntax-highlighting)), ensure that this
ordering requirement is respected.

If you want more control over the initialization, you can manually autoload and
bind `zsh-no-ps2` instead of sourcing `zsh-no-ps2.plugin.zsh`.

Lastly, if you are using [zsh4humans](https://github.com/romkatv/zsh4humans),
you don't need to install this plugin. You can achieve the same effect by adding
the following binding to `~/.zshrc`:

```zsh
z4h bindkey z4h-accept-line Enter
```

## Configuration

By default, when the currently typed command is complete, `zsh-no-ps2` invokes
`accept-line` zle widget. You can override this.

```zsh
zstyle :zsh-no-ps2: accept-line 'alternative-zle-widget-name'
```

Using `.accept-line` (note the leading dot) is a reasonable option here. You can
also use an empty value, in which case `zsh-no-ps2` will never attempt to
execute commands.

## FAQ

### How do I force execution?

Sometimes you know that the command you've typed is malformed but you want to
execute it anyway to see `PS2` or an error message. You can do this by
manually executing the `accept-line` zle widget:

1. Press <kbd>Escape</kbd> followed by <kbd>x</kbd>, or <kbd>Alt-x</kbd>.
2. Type `accept-line`.
3. Press <kbd>Enter</kbd>.

If you do this often, you can bind `accept-line` to a key. If you don't use
<kbd>Alt-Enter</kbd> for anything, you can use that one for forced execution.

```zsh
# Alt-Enter: Execute what's been typed even if it's malformed.
bindkey '^[^J' accept-line
bindkey '^[^M' accept-line
```
