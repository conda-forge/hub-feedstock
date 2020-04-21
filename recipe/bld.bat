if not exist "%LIBRARY_PREFIX%\etc\bash_completion.d" mkdir "%LIBRARY_PREFIX%\etc\bash_completion.d"
if errorlevel 1 exit 1

copy etc\hub.bash_completion.sh "%LIBRARY_PREFIX%\etc\bash_completion.d\hub.sh"
if errorlevel 1 exit 1

go install -v .
