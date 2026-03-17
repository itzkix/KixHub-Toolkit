@echo off
cd /d "%~dp0"

:: ==============================
:: Adminprüfung
:: ==============================
mode con: cols=60 lines=10
title Admin-Pruefung
color 0C

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo ===============================================
    echo Bitte diese Batch als Administrator ausfuehren!
    echo ===============================================
    pause
    exit
)

:: ==============================
:: Fenster für Launcher
:: ==============================
mode con: cols=55 lines=30
title KixHub Launcher
color 05

:: ASCII Banner
if exist "Hub\files\ascii2.txt" (
    type "Hub\files\ascii2.txt"
)

echo.
echo =======================================================
echo                    KixHub Launcher
echo =======================================================
echo.

:: ==============================
:: URLs für Update
:: ==============================
set version_url=https://raw.githubusercontent.com/itzkix/KixHub-Toolkit/main/version.txt
set download_url=https://github.com/itzkix/KixHub-Toolkit/archive/refs/heads/main.zip

echo Suche nach Updates...

:: Remote-Version herunterladen
powershell -Command "try {(New-Object Net.WebClient).DownloadFile('%version_url%', 'remote_version.txt')} catch { exit 1 }"

if not exist remote_version.txt (
    echo Update Server nicht erreichbar oder Datei nicht gefunden!
    goto start
)

:: ==============================
:: Versionsnummern robust einlesen (Trim CR/LF/Leerzeichen)
:: ==============================
for /f %%a in ('powershell -Command "(Get-Content 'remote_version.txt').Trim()"') do set remote_version=%%a
del remote_version.txt

if not exist version.txt (
    echo 0 > version.txt
)

for /f %%a in ('powershell -Command "(Get-Content 'version.txt').Trim()"') do set local_version=%%a

:: Debug-Ausgabe (optional, kann entfernt werden)
echo Remote Version: '%remote_version%'
echo Local Version:  '%local_version%'

:: ==============================
:: Prüfen, ob Update nötig ist
:: ==============================
if "%remote_version%"=="%local_version%" (
    echo Hub ist aktuell.
    goto start
)

echo Neue Version gefunden: %remote_version%
echo Lade Update...

:: Update herunterladen
powershell -Command "try {(New-Object Net.WebClient).DownloadFile('%download_url%', 'update.zip')} catch { exit 1 }"

echo Installiere Update...

:: ==============================
:: Temporären Ordner erstellen
:: ==============================
if exist temp_update rmdir /S /Q temp_update
mkdir temp_update

:: ZIP in temp entpacken
powershell -Command "Expand-Archive -Force 'update.zip' 'temp_update'"

:: ==============================
:: Nur Hub-Ordner aktualisieren
:: ==============================
if exist "temp_update\KixHub-Toolkit-main\Hub" (
    xcopy /E /Y /Q "temp_update\KixHub-Toolkit-main\Hub\*" "Hub\"
)

:: ==============================
:: Temp-Ordner und ZIP löschen
:: ==============================
rmdir /S /Q "temp_update"
del /Q update.zip

:: Versionsnummer aktualisieren
echo %remote_version% > version.txt

echo Update installiert!
timeout /t 2 >nul

:start
echo.
echo Starte Hub...
timeout /t 1 >nul

call Hub\Hub.bat