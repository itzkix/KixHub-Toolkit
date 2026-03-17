@echo off
color 09
echo ================================================================================
echo                      Alle temporaeren Dateien loeschen?
echo ================================================================================
echo.
pause

:: Dateien löschen, ohne Ausgabe
Del /S /F /Q "%temp%" >nul 2>&1
Del /S /F /Q "%Windir%\Temp" >nul 2>&1
Del /S /F /Q "C:\WINDOWS\Prefetch" >nul 2>&1

@echo off
color 09
echo.
echo                                --- Fertig ---
pause >nul