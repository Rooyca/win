@echo off

net session >nul 2>&1
if %errorLevel% == 0 (
	goto :continue
) else (
	echo You need to run this script as administrator...
	goto :eof
)

:continue
cd /d %ProgramFiles%\Microsoft Office\Office16
cd /d %ProgramFiles(x86)%\Microsoft Office\Office16
for /f %x in ('dir /b ..\root\Licenses16\ProPlus2019VL*.xrm-ms') \
do cscript ospp.vbs /inslic:"..\root\Licenses16\%x"

ping -n 1 
if %errorLevel% == 0 (
	goto :startreg
) else (
	echo You need to have internet connection...
	goto :eof
)

:startreg
cscript ospp.vbs /setprt:1688
cscript ospp.vbs /unpkey:6MWKP >nul
cscript ospp.vbs /inpkey:NMMKJ-6RK4F-KMJVX-8D9MJ-6MWKP
cscript ospp.vbs /sethst:e8.us.to
cscript ospp.vbs /act
goto :eof