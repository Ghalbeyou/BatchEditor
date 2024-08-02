setlocal enabledelayedexpansion

cls

:: Edit is enabled with this single file!

if "%file%"=="none" (
    echo No file specified.
    exit /b
)

if not exist "%path%" (
    echo Invalid path specified.
    exit /b
)

set filepath=%path%\%file%

if exist "%filepath%" (
    for /f "tokens=*" %%a in (%filepath%) do (
        set /a line_count+=1
        set "line!line_count!=%%a"
    )
) else (
    echo [New File: %file%]
    set line_count=0
)

if not defined line_count (
    set line_count=0
)

set current_line=1

:display
cls
echo -- Editing: %filepath% --
echo Current Line: %current_line% / %line_count%
echo.
for /l %%i in (1,1,%line_count%) do (
    if %%i==%current_line% (
        echo !%%i!# !line%%i!
    ) else (
        echo !%%i!  !line%%i!
    )
)
echo.
echo [Commands: w - up, s - down, e - edit, a - add line, d - delete line, q - save and exit]
echo.
set /p input=[@] [W.S.E.A.D.Q] [#-#] [Custom Action]
if "%input%"=="w" goto up
if "%input%"=="s" goto down
if "%input%"=="e" goto edit
if "%input%"=="a" goto add_line
if "%input%"=="d" goto delete_line
if "%input%"=="q" goto save_and_exit
goto display

:up
if %current_line% gtr 1 (
    set /a current_line-=1
)
goto display

:down
if %current_line% lss %line_count% (
    set /a current_line+=1
)
goto display

:edit
set "line_edit="
set /p "line_edit=!line%current_line%! : "
set "line%current_line%=%line_edit%"
goto display

:add_line
set /a line_count+=1
set /a insert_line=%current_line%+1
set "new_line="
set /p "new_line=Enter new line: "
for /l %%i in (%line_count%,-1,%insert_line%) do (
    set /a next_line=%%i+1
    set "line!next_line!=!line%%i!"
)
set "line%insert_line%=%new_line%"
goto display

:delete_line
if %line_count% gtr 0 (
    for /l %%i in (%current_line%,1,%line_count%) do (
        set /a next_line=%%i+1
        set "line%%i=!line!next_line!!"
    )
    set "line%line_count%="
    set /a line_count-=1
    if %current_line% gtr %line_count% set current_line=%line_count%
)
goto display

:save_and_exit
echo [!] Saving in progress ...
(
    for /l %%i in (1,1,%line_count%) do (
        setlocal enabledelayedexpansion
        echo(!line%%i!
        endlocal
    )
) > "%filepath%"

echo File saved: "%filepath%"
echo.
echo [@] [B-b] [#-#] [BACK TO EDITOR]
echo [@] [Q-q] [#-#] [INSTANT QUIT]
echo.
set /p input=
if "%input%"=="b" goto :display
exit /b
