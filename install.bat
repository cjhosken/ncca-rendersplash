@echo off
setlocal

REM Get the directory where the script is located
set SCRIPT_DIR=%~dp0

REM Define the target directory (where the folder will be copied)
set TARGET_DIR=%HOMESHARE%\.ncca\splash

echo %TARGET_DIR%

REM Check if the target directory exists, and create it if it doesn't
if not exist "%TARGET_DIR%" (
    echo Creating directory %TARGET_DIR%...
    mkdir "%TARGET_DIR%"
) else (
    echo Directory %TARGET_DIR% already exists.
)

REM Copy the folder where the script is located into the target directory
echo Copying %SCRIPT_DIR% to %TARGET_DIR%...
xcopy /e /i /y "%SCRIPT_DIR%" "%TARGET_DIR%"