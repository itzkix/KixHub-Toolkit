@echo off
cd /d "%~dp0"

:: Kleines Fenster für Admin-Prüfung
mode con: cols=60 lines=10
title Admin-Pruefung
color 0C

:: Prüfen ob Adminrechte vorhanden sind
net session >nul 2>&1
if %errorlevel% neq 0 (
echo ===============================================
echo Bitte diese Batch als Administrator ausfuehren!
echo ===============================================
pause
exit
)

:: Admin vorhanden -> Fenster für Launcher
mode con: cols=70 lines=30
title KixHub Launcher
color 09

:: ASCII Banner anzeigen
if exist "Files\ascii.txt" (
type "Files\ascii.txt"
)

echo ==============================
echo        KixHub Launcher
echo ==============================
echo.

:: URLs
set version_url=https://raw.githubusercontent.com/itzkix/KixHub-Toolkit/refs/heads/main/version.txt
set download_url=https://github.com/itzkix/KixHub-Toolkit/archive/refs/heads/main.zip
echo Suche nach Updates...

powershell -Command "(New-Object Net.WebClient).DownloadFile('%version_url%', 'remote_version.txt')" >nul 2>&1

if not exist remote_version.txt (
echo Update Server nicht erreichbar.
goto start
)

set /p remote_version=<remote_version.txt
del remote_version.txt

if not exist version.txt (
echo 0 > version.txt
)

set /p local_version=<version.txt

if "%remote_version%"=="%local_version%" (
echo Hub ist aktuell.
goto start
)

echo Neue Version gefunden: %remote_version%
echo Lade Update...

powershell -Command "(New-Object Net.WebClient).DownloadFile('%download_url%', 'update.zip')" >nul 2>&1

echo Installiere Update...

powershell -Command "Expand-Archive -Force 'update.zip' '.'" >nul 2>&1

del update.zip

echo %remote_version% > version.txt

echo Update installiert!
timeout /t 2 >nul

:start
echo.
echo Starte Hub...
timeout /t 1 >nul

call Hub\Hub.bat