@echo off
chcp 65001 >nul
cd /d "%~dp0"
set "PY=C:\Users\31235\.workbuddy\binaries\python\envs\default\Scripts\python.exe"
if not exist "%PY%" set "PY=python"
echo.
echo   Project Dashboard - deploy to GitHub Pages
echo   Authorizing via GitHub device flow...
echo.
"%PY%" "%~dp0publish_device.py"
if errorlevel 1 (
  echo.
  echo   Deploy failed or interrupted.
)
echo.
pause
