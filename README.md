# dotfiles

My personal dotfiles, managed with [`chezmoi`](https://github.com/twpayne/chezmoi).

## Installation

### Ubuntu / WSL

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply sylus
```

## Commands

Here are some of the most common Chezmoi commands:

- `chezmoi apply`: Applies the configuration, creating symlinks or copying files to their designated locations.
- `chezmoi update`: Updates the repository by pulling changes from the version control system.
- `chezmoi diff`: Shows the differences between the actual system state and the desired state as defined in the configuration.
- `chezmoi cd`: Changes the working directory to the Chezmoi repository root directory.
- `chezmoi data`: Manages encrypted data in your configuration.
- `chezmoi help <command>`: Provides specific help for a command.

Here are some additional commands:

- `check-dotfiles`: Run BATS and confirms all packages are installed.
- `pre-commit run`: Git hook scripts for identifying simple issues in codebase.

## Acknowledgements

- https://github.com/mathiasbynens/dotfiles
- https://github.com/renemarc/dotfiles
- https://github.com/twpayne/dotfiles
- https://github.com/SystemFiles/dotfiles
- https://github.com/sosumappu/dotfiles/
