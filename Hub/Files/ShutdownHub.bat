@echo off
cd /d "%~dp0"
setlocal enabledelayedexpansion

:: ==============================
:: ASCII-Datei prüfen
:: ==============================
if exist "Files\ascii.txt" (
    set "ascii=Files\ascii.txt"
) else (
    set "ascii="
)

:menu
cls
:: ASCII-Banner anzeigen
if defined ascii type "!ascii!"
echo.
echo ================================================================================
echo                            Shutdown Timer Optionen
echo ================================================================================
echo.
echo 1. Timer starten
echo 2. Timer abbrechen
echo 3. Zurueck zum Hub
echo.

set /p opt=Waehle eine Option: 

if "%opt%"=="1" goto start
if "%opt%"=="2" goto cancel
if "%opt%"=="3" goto back

echo Ungueltige Auswahl!
pause >nul
goto menu

:start
cls
:: ASCII-Banner erneut anzeigen
if defined ascii type "!ascii!"
echo.
echo ================================================================================
echo                             Shutdown Timer starten
echo ================================================================================
echo.

set /p timeinput=Gib die Zeit bis zum Shutdown ein (z.B. 3h oder 90m): 

:: Führende/nachgestellte Leerzeichen entfernen
set "timeinput=!timeinput: =!"

set lastchar=!timeinput:~-1!
set time=!timeinput!

if /i "!lastchar!"=="h" (
    set /a seconds=!time:~0,-1!*3600
) else if /i "!lastchar!"=="m" (
    set /a seconds=!time:~0,-1!*60
) else (
    echo Ungueltiges Format! Benutze z.B. 3h oder 90m
    pause >nul
    goto start
)

:: Sekunden speichern
if not exist "Files" mkdir "Files"
echo !seconds! > "Files\shutdown_seconds.txt"

echo.
echo Shutdown gestartet. Der PC wird in !time! heruntergefahren.
pause >nul
shutdown /s /t !seconds! >nul 2>&1

goto menu

:cancel
cls
:: ASCII-Banner erneut anzeigen
if defined ascii type "!ascii!"
echo.
echo ================================================================================
echo                           Shutdown Timer abbrechen
echo ================================================================================
echo.

shutdown /a >nul 2>&1
if %errorlevel%==0 (
    echo Shutdown abgebrochen.
) else (
    echo Kein aktiver Shutdown-Timer gefunden.
)
echo.
pause >nul
goto menu

:back
cls
:: ASCII-Banner anzeigen
if defined ascii type "!ascii!"
echo.
echo =====================================
echo         Zurueck zum Hub
echo =====================================
echo.

:: Prüfen, ob die Hub.bat im übergeordneten Ordner existiert
if exist "..\Hub.bat" (
    call "..\Hub.bat"
) else (
    echo Hub.bat nicht gefunden im uebergeordneten Ordner!
    pause
)
exit /b