rem Install [de]activate scripts.
for %%F in (activate deactivate) do (
  if not exist "%PREFIX%\etc\conda\%%F.d" mkdir "%PREFIX%\etc\conda\%%F.d"
  if errorlevel 1 exit 1

  rem copy them to the work directory
  copy "%RECIPE_DIR%\alias\%%F.sh" "%PREFIX%\etc\conda\%%F.d\%PKG_NAME%.sh"
  if errorlevel 1 exit 1
  copy "%RECIPE_DIR%\alias\%%F.ps1" "%PREFIX%\etc\conda\%%F.d\%PKG_NAME%.ps1"
  if errorlevel 1 exit 1
)
