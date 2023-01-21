# dotfiles!

My configuration dotfiles for various things.

> Feel free to judge harshly :-)

## Setup

1. Clone into user home directory
    - `cd ~`
    - `git clone ....`
  
2. Simlink files or directories into appropriate places
    - MacOS/Linux:
        - File/Directory: `ln -s <PATH OF CONFIG SOURCE> <PATH OF CONFIG TARGET>`
        - Examples:
            - `ln -s ~/.dotfiles/shell/.tmux.conf ~/.tmux.conf`
            - `ln -s $(pwd)/.zshrc ~/.zshrc`
    - Windows:
      - File: `mklink <PATH OF CONFIG SOURCE> <PATH OF CONFIG TARGET>`
      - Directory: `mklink /D <PATH OF CONFIG SOURCE> <PATH OF CONFIG TARGET>`

3. If needed, unlinking a file
    - `unlink <SYMLIINK PATH>`
