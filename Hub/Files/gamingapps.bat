@echo off
cd /d "%~dp0"
mode con: cols=30 lines=2
title Gaming Apps Installer
color 08
echo Starte Gaming Apps GUI...
powershell -ExecutionPolicy Bypass -File "%~dp0AppsInstallerGUI.ps1"

exit