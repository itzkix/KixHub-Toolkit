@echo off
color 06
chcp 1252 >nul
cd /d "%~dp0"
setlocal enabledelayedexpansion

cd /d "%~dp0"
set "ascii=..\ascii.txt"

:ask
cls
if exist "%ascii%" type "%ascii%"
echo.
echo ================================================================================
echo                              GameDVR deaktivieren
echo ================================================================================
echo.
echo Dadurch wird folgender Registry-Wert gesetzt:
echo.
echo HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR
echo AppCaptureEnabled = 0
echo.
echo J = deaktivieren
echo N = zurück zum Hub
echo.

set /p confirm=Fortfahren? ^(J/N^): 

if /i "%confirm%"=="J" goto apply
if /i "%confirm%"=="N" goto back

goto ask

:apply
cls
if exist "%ascii%" type "%ascii%"
echo.
echo ================================================================================
echo                              GameDVR deaktivieren
echo ================================================================================
echo.
echo GameDVR wird deaktiviert...
echo.

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v AppCaptureEnabled /t REG_DWORD /d 0 /f >nul 2>&1

if %errorlevel%==0 (
    echo Erfolgreich gesetzt: AppCaptureEnabled = 0
) else (
    echo Fehler beim Aendern der Registry!
)

echo.
echo Druecke eine Taste, um zum Hub zurueckzukehren...
pause >nul

:back
color 09
endlocal
cd /d "%~dp0\..\.."
exit /b