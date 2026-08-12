@echo off
title GitHub Login - Waste2Wealth
echo ============================================================
echo  GitHub Login  -  needed to update your public website
echo ============================================================
echo.
echo  A one-time code will appear below and your browser will
echo  open. Just click "Authorize github" in the browser, then
echo  come back to this window and wait for success.
echo.
"C:\Program Files\GitHub CLI\gh.exe" auth login --hostname github.com --git-protocol https --web
echo.
echo ============================================================
if %ERRORLEVEL% EQU 0 (
  echo  SUCCESS! You can close this window and tell the assistant.
) else (
  echo  Login failed. Try again, or ask for help.
)
echo ============================================================
pause
