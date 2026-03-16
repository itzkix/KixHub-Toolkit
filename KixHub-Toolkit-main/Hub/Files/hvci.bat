@echo off
cd /d "%~dp0"
setlocal enabledelayedexpansion

:: ASCII-Banner einmal definieren
if exist "Files\ascii.txt" (
    set "ascii=Files\ascii.txt"
) else (
    set "ascii="
)

:menu
cls
:: Banner anzeigen
if defined ascii type "%ascii%"
echo.
echo =====================================
echo         HVCI Optionen
echo =====================================
echo 1. HVCI aktivieren
echo 2. HVCI deaktivieren
echo 3. Zurueck zum Hub
echo.

set /p opt=Waehle eine Option: 

if "%opt%"=="1" goto enable
if "%opt%"=="2" goto disable
if "%opt%"=="3" goto back

echo Ungueltige Auswahl!
pause >nul
goto menu

:enable
cls
if defined ascii type "%ascii%"
echo.
if exist "hvcifiles\enable_hvci.reg" (
    echo HVCI wird aktiviert...
    reg import "hvcifiles\enable_hvci.reg"
    echo Fertig! Bitte den PC neu starten, damit die Änderung wirksam wird.
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
    echo HVCI wird deaktiviert...
    reg import "hvcifiles\disable_hvci.reg"
    echo Fertig! Bitte den PC neu starten, damit die Änderung wirksam wird.
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
exit /b