@echo off

start /b /wait curl https://raw.githubusercontent.com/Rooyca/win/main/logo.bmp --output %temp%\logo.bmp
set "logopath=%temp%\logo.bmp"
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation" /v "Logo" /t REG_SZ /d "%logopath%" /f

rem remove the logo from recent files
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.bmp" /v "MaxDisplay" /t REG_DWORD /d "0" /f

irm https://christitus.com/win | iex; if ($?) { Write-Host "Success" } else { iwr -useb https://christitus.com/win | iex}