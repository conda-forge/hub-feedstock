rem test activate scripts installed correctly
for %%F in (activate deactivate) do (
  if not exist "%PREFIX%\etc\conda\%%F.d\hub.sh" exit 1
  if not exist "%PREFIX%\etc\conda\%%F.d\hub.ps1" exit 1
)