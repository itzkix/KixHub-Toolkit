@echo off
chcp 1252 >nul
color 05
title Vencord Installer/Updater

:: Arbeitsverzeichnis auf den Ordner dieser Batch setzen
cd /d "%~dp0"

echo ================================================================================
echo                            Vencord Installer/Updater
echo ================================================================================
echo.

:: Prüfen, ob die EXE existiert
if exist "VencordInstaller.exe" (
    echo Starte VencordInstaller.exe...
    start "" "VencordInstaller.exe"
) else (
    echo Fehler: VencordInstaller.exe wurde nicht gefunden!
)

echo.
echo Vorgang beendet. Automatische Rückkehr ins Hub in 3 Sekunden...
timeout /t 3 /nobreak >nul

:: Hub aufrufen (eine Ebene zurück)
if exist "..\Hub.bat" (
    call "..\Hub.bat"
) else (
    echo Hub.bat nicht gefunden!
    pause
)
exit /b