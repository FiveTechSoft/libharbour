Using the gdb debugger from Linux:

https://users.ece.utexas.edu/~adnan/gdb-refcard.pdf

1. Both the executable and the DLL must be compiled and linked using the flag -g

Use this from the hbp files:
```
-cflag+=-g
-dflag+=-g
```

2. gdb executableName

If gdb complains that there is no symbolic info it means that the -g flag were not properly applied

3. break ProcessAttach

This way we can set a breakpoint that will work when the shared library is loaded

3. commands:

run --> runs

step --> step

continue --> continues

list --> see source code in that section

info sharedlibrary --> list all sharedlibraries in use

