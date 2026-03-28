@echo off
chcp 1252 >nul
cd /d "%~dp0"
for /f "delims=" %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"
set COL=%ESC%
set PURPLE=%COL%[35m
set LIGHTPURPLE=%COL%[95m
set GRAY=%COL%[37m
set RESET=%COL%[0m

mode con: cols=60 lines=10
title Admin-Prüfung
color 0C

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo ===============================================
    echo Bitte diese Batch als Administrator ausführen!
    echo ===============================================
    pause
    exit
)

mode con: cols=80 lines=30
title Kix Hub 1.4.0
color 09

:menu
set page=1

:menu1
cls
if exist "Files\ascii.txt" type "Files\ascii.txt"

echo.
echo ================================================================================
echo                                    SEITE 1
echo ================================================================================
echo.
echo 1. Temp Dateien löschen
echo 2. Windows Repair Tool
echo 3. System Scan (SFC + DISM)
echo 4. Herunterfahren Planen
echo 5. Kernisolierung Aktivieren/Deaktivieren
echo 6. Vencord Installer/Updater
echo 7. Gaming-Apps installieren
echo 8. OBS Clip Setup
echo 9. Ultimate Windows Utility
echo.
echo N. Nächste Seite
echo 0. Beenden
echo.

set /p choice=Bitte Nummer wählen: 

if "%choice%"=="1" goto temp
if "%choice%"=="2" goto repair
if "%choice%"=="3" goto scan
if "%choice%"=="4" goto shutdownhub
if "%choice%"=="5" goto hvci
if "%choice%"=="6" goto vencord
if "%choice%"=="7" goto gamingapps
if "%choice%"=="8" goto obs
if "%choice%"=="9" goto uwu
if /i "%choice%"=="n" goto menu2
if "%choice%"=="0" exit

goto menu1

:menu2
cls
if exist "Files\ascii.txt" type "Files\ascii.txt"

echo.
echo ================================================================================
echo                                    SEITE 2
echo ================================================================================
echo.
echo 1. Win11 Debloat-Master
echo 2. Windows Aktivieren
echo.
echo B. Zurück
echo 0. Beenden
echo.

set /p choice=Bitte Nummer wählen: 

if "%choice%"=="1" goto win11dm
if "%choice%"=="2" goto winkeys
if "%choice%"=="3" goto tool3
if /i "%choice%"=="b" goto menu1
if "%choice%"=="0" exit

goto menu2

:temp
cls
if exist "Files\ascii.txt" type "Files\ascii.txt"
echo.
if exist "Files\CleanTemporaryFiles.bat" (
    call "Files\CleanTemporaryFiles.bat"
) else (
    echo Batch "CleanTemporaryFiles.bat" nicht gefunden!
)
goto menu

:repair
cls
if exist "Files\ascii.txt" type "Files\ascii.txt"
echo.
if exist "Files\WindowsRepairTool.bat" (
    call "Files\WindowsRepairTool.bat"
) else (
    echo Batch "WindowsRepairTool.bat" nicht gefunden!
)
goto menu

:scan
cls
if exist "Files\ascii.txt" type "Files\ascii.txt"
echo.
if exist "Files\SystemScan.bat" (
    call "Files\SystemScan.bat"
) else (
    echo Batch "SystemScan.bat" nicht gefunden!
)
goto menu

:shutdownhub
cls
if exist "Files\ascii.txt" type "Files\ascii.txt"
echo.
echo --- Herunterfahroptionen ---
if exist "Files\ShutdownHub.bat" (
    call "Files\ShutdownHub.bat"
) else (
    echo Batch "ShutdownHub.bat" nicht gefunden!
)
goto menu

:vencord
cls
if exist "Files\ascii.txt" type "Files\ascii.txt"
echo.
if exist "Files\vencord.bat" (
    call "Files\vencord.bat"
) else (
    echo Batch "vencord.bat" nicht gefunden!
)
goto menu

:hvci
cls
if exist "Files\ascii.txt" type "Files\ascii.txt"
echo.
echo --- Herunterfahroptionen ---
if exist "Files\hvci.bat" (
    call "Files\hvci.bat"
) else (
    echo Batch "hvci.bat" nicht gefunden!
)
goto menu

:gamingapps
cls
if exist "Files\ascii.txt" type "Files\ascii.txt"
echo.
echo --- Gaming Apps Installer ---
echo.

if exist "Files\gamingapps.bat" (
    start "" "Files\gamingapps.bat"
) else (
    echo Batch "gamingapps.bat" nicht gefunden!
    pause
)

goto menu

:obs
cls
if exist "Files\ascii.txt" type "Files\ascii.txt"
echo.
echo --- OBS Settings ---
if exist "Files\obsclip.bat" (
    call "Files\obsclip.bat"
) else (
    echo Batch "obsclip.bat" nicht gefunden!
)
goto menu

:uwu
cls
if exist "Files\ascii.txt" type "Files\ascii.txt"
echo.
echo ---- Ultimate Windows Utility ----
echo.

if exist "Files\uwu.bat" (
    start "" "Files\uwu.bat"
) else (
    echo Batch "uwu.bat" nicht gefunden!
    pause
)
goto menu

:win11dm
cls
if exist "Files\ascii.txt" type "Files\ascii.txt"
echo.
if exist "Files\win11dm\Run.bat" (
    call "Files\win11dm\Run.bat"
) else (
    echo Batch "Run.bat" nicht gefunden!
)
goto menu2

:winkeys
cls
if exist "Files\ascii.txt" type "Files\ascii.txt"
echo.
if exist "Files\winkeys.bat" (
    call "Files\winkeys.bat"
) else (
    echo Batch "winkeys.bat" nicht gefunden!
)
goto menu2