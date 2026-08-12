@echo off
cd /d "%~dp0"
start "Waste2Wealth Server" powershell -NoProfile -ExecutionPolicy Bypass -Command "& '%~dp0server.ps1'"
timeout /t 2 /nobreak >nul
start "" "http://localhost:8000/app.html"
