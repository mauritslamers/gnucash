:: ----------------------------------------------------------------------
:: Using msys2
@echo on
PATH C:\%MSYS2_DIR%\%MSYSTEM%\bin;C:\%MSYS2_DIR%\usr\bin;%PATH%
:: set CHERE_INVOKING=yes

:: bash -lc "cd /c/gnucash-on-windows; TARGET=gnucash-maint jhbuild -f jhbuildrc build gnucash-git"
msys2_shell.cmd "cd /c/gnucash-on-windows; TARGET=gnucash-maint jhbuild -f jhbuildrc build gnucash-git"

@echo off
