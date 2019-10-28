:: ----------------------------------------------------------------------
:: Using msys2
@echo on
PATH C:\%MSYS2_DIR%\%MSYSTEM%\bin;C:\%MSYS2_DIR%\usr\bin;%PATH%
:: set CHERE_INVOKING=yes
@rem Reduce time required to install packages by disabling pacman's disk space checking.
bash -lc "sed -i 's/^CheckSpace/#CheckSpace/g' /etc/pacman.conf"

cd c:\gnucash-on-windows
TARGET=gnucash-maint jhbuild -f jhbuildrc build

@echo off