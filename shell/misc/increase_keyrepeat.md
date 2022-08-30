# KeyRepeat

**Initial KeyRepeat** - Length of time before repeating a keypress when held down
**KeyRepeat** - Lengh of time between repeated key presses when key is held down


## MacOS

1. Settings > Keyboard
    - Key Repeat -> Fastest
    - Delay Until Repeat -> Short

2. In terminal
    - `defaults write -g InitialKeyRepeat -int 10`
    - `defaults write -g KeyRepeat -int 1`
    - `defaults write -g ApplePressAndHoldEnabled -bool false`
    - Log out and log in

## Ubuntu

1. Settings > Universal Access > Typing > Repeat Keys
    - Delay -> Lower
    - Speed -> Higher


