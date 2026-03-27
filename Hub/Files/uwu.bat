@echo off
cd /d "%~dp0"
mode con: cols=30 lines=2
title Ultimate Windows Utility
color 08
echo Startet Ultimate Windows Utility GUI...

powershell -NoProfile -ExecutionPolicy Bypass -Command "iwr -useb https://christitus.com/win | iex"

exit