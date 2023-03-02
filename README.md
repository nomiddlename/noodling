# noodling
Messing about with C64 stuff

Installation instructions are for Arch Linux.

## things I installed in arch
I spent some time installing dev-related packages (they're not needed for the c64 code directly):
```
sudo pacman -S github-cli code ttf-fira-code starship ttf-font-nerd
```

## actual c64 dev dependencies
These are the packages you'll need to get things going:
```
sudo pacman -S vice gradle
sudo yay -S c64-debugger-git
```

## VS Code Plugin (optional)

https://open-vsx.org/extension/paulhocker/kick-assembler-vscode-ext

`settings.json` for the plugin:
```javascript
{
    "kickassembler.assembler.jar": "/home/gareth/noodling/.ra/asms/ka/5.25/KickAss.jar",
    "kickassembler.emulator.runtime": "/usr/bin/x64sc",
    "kickassembler.java.runtime": "/usr/bin/java",
    "kickassembler.debugger.runtime": "/usr/bin/c64debugger",
    "kickassembler.assemblerLibraryPaths": [
        "/home/gareth/noodling/.ra/deps/c64lib"
    ]
}
```
