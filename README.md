# dotfiles

My configuration dotfiles for various things.

> Feel free to judge harshly :-)

## Setup

1. Clone into user home directory

    - ```bash
       cd ~
       git clone https://github.com/ismet55555/.dotfiles
       ```  

2. Simlink files or directories into appropriate places
    - MacOS/Linux:
        - File/Directory:

            - ```bash
              ln -s <PATH OF CONFIG SOURCE> <PATH OF CONFIG TARGET SIMLINK>
              ```

        - Examples:

            - ```bash
              ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
              ln -s ~/.dotfiles/shell/.tmux.conf ~/.tmux.conf
              ln -s ~/.dotfiles/shell/.zshrc ~/.zshrc
              ln -s ~/.dotfiles/shell/.bashrc ~/.bashrc
              ln -s ~/.dotfiles/shell/.sh_aliases ~/.sh_aliases
              ln -s ~/.dotfiles/shell/.sh_env ~/.sh_env
              ln -s ~/.dotfiles/shell/.sh_bindings ~/.sh_bindings
              ```

    - Windows:
      - File:

        - ```posh
          mklink <PATH OF CONFIG SOURCE> <PATH OF CONFIG TARGET SIMLINK>
          ```

      - Directory:

        - ```posh
          mklink /D <PATH OF CONFIG SOURCE> <PATH OF CONFIG TARGET SIMLINK>
          ```

3. If needed, unlinking a file
    - `unlink <SYMLIINK PATH>`
