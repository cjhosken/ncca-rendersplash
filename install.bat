@echo off
setlocal

REM Get the directory where the script is located
set SCRIPT_DIR=%~dp0

REM Define the target directory (where the folder will be copied)
set TARGET_DIR=%HOMESHARE%\.ncca\ncca-rendersplash

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

REM Path to launch.bat (you might want to change this if it's located elsewhere)
set LAUNCH_BAT_PATH=%TARGET_DIR%\launch.bat

REM Define the path to the icon file
set ICON_PATH=%TARGET_DIR%/icons/splash.ico

REM Define the custom name for the shortcut
set CUSTOM_NAME=Splash!.lnk

REM Define the location of the Start Menu Programs folder for the current user
set START_MENU_PATH=%TARGET_DIR%

REM Define the full path for the shortcut file with custom name
set SHORTCUT_PATH=%START_MENU_PATH%\%CUSTOM_NAME%

REM Check if the launch.bat exists
if exist "%LAUNCH_BAT_PATH%" (
    echo Creating shortcut to launch.bat...

    REM Create the shortcut in the Start Menu Programs folder with the icon and custom name
    powershell -Command "$WshShell = New-Object -ComObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%SHORTCUT_PATH%'); $Shortcut.TargetPath = '%LAUNCH_BAT_PATH%'; $Shortcut.IconLocation = '%ICON_PATH%'; $Shortcut.Save()"

    echo Shortcut created successfully with custom name and icon, and should now be accessible via Windows search.
) else (
    echo launch.bat not found in the target directory.
)

endlocal
