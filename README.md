# github.com/sylus/dotfiles

My personal dotfiles, managed with [`chezmoi`](https://github.com/twpayne/chezmoi).

## Installation

### Ubuntu / WSL

```sh
curl -sfL https://git.io/chezmoi | sh
chezmoi init --apply --verbose sylus
```

## Install location

```sh
~/.local/share/chezmoi
```

## Commands

Here are some of the most common Chezmoi commands:

- `chezmoi apply`: Applies the configuration, creating symlinks or copying files to their designated locations according to the configuration.
- `chezmoi update`: Updates the repository by pulling changes from the version control system.
- `chezmoi diff`: Shows the differences between the actual system state and the desired state as defined in the configuration.
- `chezmoi cd`: Changes the working directory to the Chezmoi repository root directory.
- `chezmoi data`: Manages encrypted data in your configuration.
- `chezmoi help <command>`: Provides specific help for a command.

## Acknowledgements

* https://github.com/mathiasbynens/dotfiles
* https://github.com/renemarc/dotfiles
* https://github.com/twpayne/dotfiles
