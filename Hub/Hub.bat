@echo off
cd /d "%~dp0"

:: Kleines Fenster für Admin-Prüfung
mode con: cols=60 lines=10
title Admin-Prüfung
color 0C

:: Prüfen, ob Adminrechte vorhanden sind
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo ===============================================
    echo Bitte diese Batch als Administrator ausfuehren!
    echo ===============================================
    pause
    exit
)

:: Admin vorhanden → Fenster groß machen für Tool
mode con: cols=70 lines=30
title Kix Hub 1.3.1
color 09

:menu
cls
:: ASCII-Banner oben anzeigen
if exist "Files\ascii.txt" (
    type "Files\ascii.txt"
) else (
    echo ASCII-Banner nicht gefunden!
)

:: Menü anzeigen
echo.
echo ================================
echo              TOOLS
echo ================================
echo.
echo 1. Temp Dateien loeschen
echo 2. Windows Repair Tool
echo 3. System Scan (SFC + DISM)
echo 4. Herunterfahren Optionen
echo 5. Kernisolierung Aktivieren/Deaktivieren
echo 6. Vencord Installer/Updater
echo 0. Beenden
echo.
set /p choice=Bitte Nummer waehlen: 

:: Auswahl prüfen
if "%choice%"=="1" goto temp
if "%choice%"=="2" goto repair
if "%choice%"=="3" goto scan
if "%choice%"=="4" goto shutdownhub
if "%choice%"=="5" goto hvci
if "%choice%"=="6" goto vencord
if "%choice%"=="0" exit

echo Ungueltige Auswahl!
pause
goto menu

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
echo --- Windows Repair Tool starten ---
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
echo --- System Scan starten ---
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
echo --- Vencord ---
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