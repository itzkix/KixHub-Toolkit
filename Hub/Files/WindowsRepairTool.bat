@echo off
chcp 1252 >nul
color 0A
echo ================================================================================
echo                         Windows Repair Tool gestartet
echo ================================================================================
echo.

:: CHKDSK vorbereiten
echo [1] CHKDSK wird für den nächsten Neustart geplant
chkntfs /C C:

echo.
:: SFC Scan
echo [2] Systemdateien prüfen
sfc /scannow

echo.
:: DISM ScanHealth
echo [3] DISM ScanHealth
DISM /Online /Cleanup-Image /ScanHealth

echo.
:: DISM RestoreHealth
echo [4] DISM RestoreHealth
DISM /Online /Cleanup-Image /RestoreHealth

echo.
:: Finaler SFC Scan
echo [5] Finaler SFC Scan
sfc /scannow

@echo off
color 09
echo.
echo ================================================================================
echo                             Reparatur abgeschlossen
pause