@echo off
color 06
chcp 1252 >nul
cd /d "%~dp0"
setlocal enabledelayedexpansion

if exist "Files\ascii.txt" (
    set "ascii=Files\ascii.txt"
) else (
    set "ascii="
)

:menu
cls
if defined ascii type "%ascii%"
echo.
echo ================================================================================
echo                                 HVCI Optionen
echo ================================================================================
echo 1. HVCI aktivieren
echo 2. HVCI deaktivieren
echo 3. Zurück zum Hub
echo.

set /p opt=Wähle eine Option: 

if "%opt%"=="1" goto enable
if "%opt%"=="2" goto disable
if "%opt%"=="3" goto back

echo Ungültige Auswahl!
pause >nul
goto menu

:enable
cls
if defined ascii type "%ascii%"
echo.
if exist "hvcifiles\enable_hvci.reg" (
    echo ================================================================================
    echo                                 HVCI Optionen
    echo ================================================================================
    echo HVCI wird aktiviert...
    reg import "hvcifiles\enable_hvci.reg"
    echo Fertig! Bitte den PC neu starten, damit die änderung wirksam wird.
) else (
    echo Fehler: enable_hvci.reg wurde nicht gefunden!
)
echo.
pause
goto menu

:disable
cls
if defined ascii type "%ascii%"
echo.
if exist "hvcifiles\disable_hvci.reg" (
    echo ================================================================================
    echo                                 HVCI Optionen
    echo ================================================================================
    echo HVCI wird deaktiviert...
    reg import "hvcifiles\disable_hvci.reg"
    echo Fertig! Bitte den PC neu starten, damit die änderung wirksam wird.
) else (
    echo Fehler: disable_hvci.reg wurde nicht gefunden!
)
echo.
pause
goto menu

:back
cls
if defined ascii type "%ascii%"
echo.
if exist "..\Hub.bat" (
    call "..\Hub.bat"
) else (
    echo Hub.bat nicht gefunden!
    pause
)
color 09
exit /b