# micro-cheat - F1 cheatsheet for the language you're editing

**F1** Show cheatsheet for the language you're editing: Lua, Go, Python...

A plugin for Micro editor. 

## Usage

Edit a source code file with micro. Press **F1**. 

A cheatsheet for the language opens. If you're editing Python, it's a Python cheatsheet. If Go, then Go cheatsheet.
Press Ctrl-Q to close the cheatsheet tab and return to editing. 

For your convenience, micro-cheat also provides a command 'cheat' that you can bind to any key or run with ctrl-E. 

Tested with 

- Python
- Go (Golang)
- Lua
- Javascript
- CSS (cascading style sheets)
- HTML
- HAML (HTML abstraction markup language)
- Vagrantfile (by filename)
- Dockerfile (by filename)
- Makefile
- JavaScript (ECMAScript)
- TypeScript
- YAML (yet another markup language)
- org-mode (*.org)
- bash (shell)

## Installation

In the future, you will be able to install micro-cheat by

	$ micro --plugin install micro-cheat

Currently, there is just development install

	$ cd $HOME/.config/micro/plug/
	$ git clone https://github.com/terokarvinen/micro-cheat

## Tutorial

[Installation & tutorial for 4 plugins: Palettero, Cheat, Run and Jump](https://terokarvinen.com/2022/command-palette-cheatsheet-run-and-make-micro/)

## Limitations

All cheatsheets included in cheatsheets/ directory are not supported yet. Micro-cheat has only been tested on Linux. 

## Todo

Bibtex references cheatsheet. Should be MIT licensed to be included in this plugin. 

## Adminstrivia

Cheatsheets are from https://devhints.io project, copyright (c) 2021 Rico Sta. Cruz and contributors, received under MIT license.

Micro-cheat plugin is Copyright 2022 Tero Karvinen https://TeroKarvinen.com, MIT license. 

