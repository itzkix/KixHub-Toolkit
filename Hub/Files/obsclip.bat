@echo off
chcp 1252 >nul
color 0F
set "base=%~dp0"

:: OBS-Ordner automatisch finden (relativ zu dieser Batch)
if exist "%base%OBS" (
    set "obsFolder=%base%OBS"
) else if exist "%base%Files\OBS" (
    set "obsFolder=%base%Files\OBS"
) else (
    :: Wenn direkt gestartet, Fehlermeldung, sonst nur leeren Pfad
    if "%1"=="direct" (
        echo OBS-Ordner nicht gefunden!
        echo Erwartet: %base%OBS oder %base%Files\OBS
        pause
        exit /b
    ) else (
        set "obsFolder="
    )
)

set "startup=%ProgramData%\Microsoft\Windows\Start Menu\Programs\Startup"
set "obsPath=%APPDATA%\obs-studio"

:menu
cls
if exist "%~dp0ascii.txt" type "%~dp0ascii.txt"
echo.
echo ================================================================================
echo                                  OBS Manager
echo ================================================================================
echo.
echo 1. Autostart aktivieren
echo 2. Autostart deaktivieren
echo 3. OBS Setup installieren
echo 4. Zurück zum Hub
echo.

set /p opt=Auswahl: 

if "%opt%"=="1" goto enable
if "%opt%"=="2" goto disable
if "%opt%"=="3" goto setup
if "%opt%"=="4" goto hub

echo Ungültige Eingabe!
pause
goto menu

:enable
cls
if exist "%~dp0ascii.txt" type "%~dp0ascii.txt"
echo.
echo ================================================================================
echo                            Autostart aktivieren
echo ================================================================================
echo.

if not defined obsLnk if not exist "%obsFolder%" (
    echo OBS-Ordner nicht gefunden: %obsFolder%
    pause
    goto menu
)

:: Erste Verknüpfung im OBS-Ordner suchen
set "obsLnk="
for %%f in ("%obsFolder%\*.lnk") do (
    set "obsLnk=%%f"
    goto foundLnk
)
:foundLnk

if not defined obsLnk (
    echo OBS Verknüpfung nicht gefunden!
    pause
    goto menu
)

copy "%obsLnk%" "%startup%" >nul
echo OBS startet jetzt automatisch mit Replay Buffer!
pause
goto menu

:disable
cls
if exist "%~dp0ascii.txt" type "%~dp0ascii.txt"
echo.
echo ================================================================================
echo                            Autostart deaktivieren
echo ================================================================================
echo.

del "%startup%\OBS*.lnk" >nul 2>&1
echo Autostart entfernt, falls vorhanden.
pause
goto menu

:setup
cls
if exist "%~dp0ascii.txt" type "%~dp0ascii.txt"
echo.
echo ================================================================================
echo                          OBS Setup wird installiert
echo ================================================================================
echo.

if not exist "%obsFolder%" (
    echo OBS-Ordner nicht gefunden: %obsFolder%
    pause
    goto menu
)

if not exist "%obsPath%" mkdir "%obsPath%"
if not exist "%obsPath%\basic\profiles" mkdir "%obsPath%\basic\profiles"

echo Kopiere Config...
copy /Y "%obsFolder%\global.ini" "%obsPath%" >nul
copy /Y "%obsFolder%\user.ini" "%obsPath%" >nul

echo Kopiere Profil...
xcopy /E /Y /Q "%obsFolder%\profiles\*" "%obsPath%\basic\profiles\" >nul

set "profilename="
for /d %%p in ("%obsFolder%\profiles\*") do set "profilename=%%~nxp"

(
echo [General]
echo Name=%profilename%
) > "%obsPath%\global.ini"

echo.
echo OBS Setup fertig!
echo Profil: %profilename%
echo.

pause
goto menu

:hub
color 09
:: Springt zurück zum Hub (eine Ebene nach oben)
if exist "%~dp0..\hub.bat" (
    call "%~dp0..\hub.bat"
)
exit /b