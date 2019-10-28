:: ----------------------------------------------------------------------
:: Using msys2
@echo on
PATH C:\%MSYS2_DIR%\%MSYSTEM%\bin;C:\%MSYS2_DIR%\usr\bin;%PATH%
:: set CHERE_INVOKING=yes

if "%MSYSTEM%"=="MINGW64" (
  bash -lc "pacman --noconfirm -Rs mingw-w64-i686-toolchain"
) else if "%MSYSTEM%"=="MINGW32" (
  bash -lc "pacman --noconfirm -Rs mingw-w64-x86_64-toolchain"
)
@rem Reduce time required to install packages by disabling pacman's disk space checking.
bash -lc "sed -i 's/^CheckSpace/#CheckSpace/g' /etc/pacman.conf"

bash -lc "for i in {1..3}; do pacman --noconfirm --noprogressbar -S --needed mingw-w64-%MSYS2_ARCH%-jhbuild && break || sleep 15; done"

REM bash -lc "for i in {1..3}; do pacman --noconfirm --noprogressbar -S --needed mingw-w64-%MSYS2_ARCH%-{jansson,libxml2,libyaml} && break || sleep 15; done"
bash -lc "pacman --noconfirm --noprogressbar -S  --needed mingw-w64-%MSYS2_ARCH%"
bash -lc "cd /c/gnucash-on-windows; TARGET=gnucash-maint jhbuild -f jhbuildrc build"

@echo off