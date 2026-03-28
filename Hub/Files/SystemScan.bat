@echo off
chcp 1252 >nul
color 0B
echo ================================================================================
echo                       System Scan gestartet (SFC + DISM)
echo ================================================================================
echo.

:: SFC Scan
echo [1] Systemdateien prüfen
sfc /scannow

echo.
:: DISM ScanHealth
echo [2] DISM ScanHealth
DISM /Online /Cleanup-Image /ScanHealth

echo.
:: DISM RestoreHealth
echo [3] DISM RestoreHealth
DISM /Online /Cleanup-Image /RestoreHealth

echo.
:: Finaler SFC Scan
echo [4] Finaler SFC Scan
sfc /scannow

@echo off
color 09
echo.
echo ================================================================================
echo                              Scan abgeschlossen
pause