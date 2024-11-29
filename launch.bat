@echo off
setlocal

REM Get the directory where the batch file is located
set SCRIPT_DIR=%~dp0

REM Default values for the arguments
set TITLE=RENDERING
set SUBTITLE=Please do not touch!
set CONTACT=

REM Run the Python script with the specified or default arguments
"c:\ProgramData\Microsoft\Windows\Start Menu\Programs\Python 3.9\Python 3.9 (64-bit).lnk" "%SCRIPT_DIR%main.py" "%TITLE%" "%SUBTITLE%" "%CONTACT%"

endlocal