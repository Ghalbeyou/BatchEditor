@echo off

@REM This is a OS(Open Source) application made by @GhalbeYou. It is not going to be sold or anything.
@REM GitHub: https://github.com/ghalbeyou/batcheditor

cls

@rem main sets
set editing=0
set file=none
set path=none

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
echo [Press any key] [#-#] [Quit]
pause > nul
exit

:hub

title Batch Editor - Hub
cls

echo In order to start coding, open the program in this way:
echo BatchEditor o BatchEditor/Data Example.Txt
echo [!] Remember that there should be a space between "BatchEditor/Data" and "Example.Txt".

echo [Press any key] [#-#] [Quit]

pause > nul
exit