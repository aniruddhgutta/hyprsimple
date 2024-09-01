# micro-run

*Press F5 to save and run the current file, F12 to make, F9 to make in background*

F12 compiles your project even if Makefile is in a higher directory. It goes up (cd ..) until it finds make file or is at root directory. 

F9 runs 'make' in background, allowing you to keep editing while your project compiles. 

![micro-run screenshot - press F5 to run current file](micro-run.png)

Micro run is a plugin for Micro editor.

F5 save & run supports Go, Go test, Python 3, Lua and executable files. 

As an extra feature, micro-run can run any script that's marked as executable - in any language. In Linux, executable files are those that have 'chmod u+x foo' set and usually start with a shebang "#!/usr/bin/foo". 

## Use Case

When coding, it's convenient to run the current file and see the result immediately. Especially for Go (Golang) and other languages that don't have an interactive shell (REPL), it's nice to quickly test new features by writing a short program and hitting F5. 

A feature for quickly running the code you are editing is common in integrated development environments (IDEs).

## Limitations

Tested only on Linux, might also work on other systems. 

As you are literally running the current file, no effort has been taken to prevent file name based injections. Does not work with file names with spaces or other special characters. 

## See also

[micro-jump](https://github.com/terokarvinen/micro-jump) - Jump to any function, class or heading with F4. Go, Markdown, Python, C... (+40 others). A plugin for micro editor. 
