setlocal enabledelayedexpansion

pushd src\github.com\github\hub
go install -v .

rem Copy activate/deactivate scripts
set etc_conda=%PREFIX%\etc\conda;
for %%F in (activate deactivate) do (
  set F_DIR="%PREFIX%\etc\conda\%%F.d"
  if not exist %F_DIR% mkdir %F_DIR%
  if errorlevel 1 exit 1
  copy "%RECIPE_DIR%\%%F.sh" %F_DIR%\hub.sh
  if errorlevel 1 exit 1
  copy "%RECIPE_DIR%\%%F.ps1" %F_DIR%\hub.ps1
  if errorlevel 1 exit 1
)

rem Copy bash_completion
set B_DIR="%LIBRARY_PREFIX%\etc\bash_completion.d"
if not exist %B_DIR% mkdir "%B_DIR%"
if errorlevel 1 exit 1

copy etc/hub.bash_completion.sh %B_DIR%/hub.sh
