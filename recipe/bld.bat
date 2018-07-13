copy %RECIPE_DIR%\build.sh build.sh

set GOPATH=%SRC_DIR%
set MSYSTEM=MINGW%ARCH%
set MSYS2_PATH_TYPE=inherit
set CHERE_INVOKING=1
bash build.sh
if errorlevel 1 exit 1
exit 0
