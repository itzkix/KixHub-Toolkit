@echo off
chcp 1252 >nul
color 08
echo ================================================================================
echo                      Alle temporären Dateien löschen?
echo ================================================================================
echo.
pause

Del /S /F /Q "%temp%" >nul 2>&1
Del /S /F /Q "%Windir%\Temp" >nul 2>&1
Del /S /F /Q "C:\WINDOWS\Prefetch" >nul 2>&1

@echo off
echo.
echo                              --- Fertig ---
pause >nul
color 09