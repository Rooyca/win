@echo off

start /b /wait curl https://raw.githubusercontent.com/Rooyca/win/main/oem/logo.bmp --output %temp%\logo.bmp
set "logopath=%temp%\logo.bmp"
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation" /v "Logo" /t REG_SZ /d "%logopath%" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.bmp" /v "MaxDisplay" /t REG_DWORD /d "0" /f

rem reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation" /v "SupportPhone" /t REG_SZ /d "1-800-ROOYCA" /f
rem reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation" /v "SupportURL" /t REG_SZ /d "https://rooyca.com" /f

start /b /wait powershell -command "irm https://christitus.com/win | iex"

del /f /q "%~f0"