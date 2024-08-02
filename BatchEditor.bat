@echo off

@REM This is a OS(Open Source) application made by @GhalbeYou. It is not going to be sold or anything.
@REM GitHub: https://github.com/ghalbeyou/batcheditor

cls

@rem main sets
set editing=0
set file=none
set path=none
cd core
call config.bat
cd ..


:main
if not exist lic goto :license

if "%1"=="o" (
    goto :open_file
)

goto :hub

:license
cd core
call license.bat
cd ..
exit
:open_file
cls
@rem set file directory
set path=%2
@rem set file name
set file=%3

cd core
call edit.bat
cd ..
echo.
echo.
echo [@] [ANY KEY] [#-#] [INSTANT QUIT]
pause > nul
exit

:hub

title Batch Editor - Hub
cls

echo In order to start coding, open the program in this way:
echo %0 o To/Path File.EXT
echo.
echo [!] "To/Path" must be a valid path to the directory of the file and "File.EXT" should be a valid file name.
echo [#] Example:
echo.
echo [$] %0 o E:\Code package.json
echo.
echo [!] Remember that there should be a space between "To/Path" and "File.EXT".
echo.
echo.
echo [@] [ANY KEY] [#-#] [INSTANT QUIT]

pause > nul
exit
