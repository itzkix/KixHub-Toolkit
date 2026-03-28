@echo off
chcp 1252 >nul
color 05

start winver

if exist "Files\ascii.txt" (
    set "ascii=Files\ascii.txt"
) else (
    set "ascii="
)


:menu
cls
if defined ascii type "%ascii%"
echo.
echo ================================================================================
echo                          Windows-Key Installer
echo ================================================================================
echo.
:: Links 1–7, rechts 8–14
echo 1. Home/Core               8. Enterprise N
echo 2. Home/Core (CS)          9. Education
echo 3. Home/Core (SL)         10. Education N
echo 4. Home/Core N            11. Enterprise 2015 LTSB
echo 5. Professional           12. Enterprise 2015 LTSB N
echo 6. Professional N         13. Enterprise 2016 LTSB
echo 7. Enterprise             14. Enterprise 2016 LTSB N

:: Beenden unterhalb links
echo.
echo 15. Zurück zum Hub
echo.

:: Reset Variablen (WICHTIG)
set "version="
set "KEY="

set /p version="Gib die Zahl der Version ein: "

:: Enter gedrückt ? nichts tun
if "%version%"=="" goto menu

:: Beenden
if "%version%"=="15" (
    color 09
    exit /b
)
:: Keys setzen
if "%version%"=="1"  set "KEY=TX9XD-98N7V-6WMQ6-BX7FG-H8Q99"
if "%version%"=="2"  set "KEY=PVMJN-6DFY6-9CCP6-7BKTT-D3WVR"
if "%version%"=="3"  set "KEY=7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH"
if "%version%"=="4"  set "KEY=3KHY7-WNT83-DGQKR-F7HPR-844BM"
if "%version%"=="5"  set "KEY=W269N-WFGWX-YVC9B-4J6C9-T83GX"
if "%version%"=="6"  set "KEY=MH37W-N47XK-V7XM9-C7227-GCQG9"
if "%version%"=="7"  set "KEY=NPPR9-FWDCX-D2C8J-H872K-2YT43"
if "%version%"=="8"  set "KEY=DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4"
if "%version%"=="9"  set "KEY=NW6C2-QMPVW-D7KKK-3GKT6-VCFB2"
if "%version%"=="10" set "KEY=2WH4N-8QGBV-H22JP-CT43Q-MDWWJ"
if "%version%"=="11" set "KEY=WNMTR-4C88C-JK8YV-HQ7T2-76DF9"
if "%version%"=="12" set "KEY=2F77B-TNFGY-69QQF-B8YKP-D69TJ"
if "%version%"=="13" set "KEY=DCPHK-NFMTC-H88MJ-PFHPY-QJ4BJ"
if "%version%"=="14" set "KEY=QFFDN-GRT3P-VKWWX-X7T3R-8B639"

if not defined KEY goto menu

cls
if defined ascii type "%ascii%"
echo.
echo ================================================================================
echo                          Windows-Key Installer
echo ================================================================================
echo.
echo Installiere Key...
cscript %windir%\system32\slmgr.vbs /ipk %KEY%

echo.
echo Setze KMS Server...
cscript %windir%\system32\slmgr.vbs /skms kms.lotro.cc

echo.
echo Aktiviere Windows...
cscript %windir%\system32\slmgr.vbs /ato

echo.
echo Fertig!
pause
color 09
exit /b

:banner
if exist "Files\ascii.txt" (
    type "Files\ascii.txt"
    echo.
) else (
    echo ASCII-Banner nicht gefunden!
    echo.
)
exit /b