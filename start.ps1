# Download logo.bmp from GitHub and set its path in the registry
$logoUrl = "https://raw.githubusercontent.com/Rooyca/win/main/oem/logo.bmp"
$logoPath = Join-Path $env:TEMP "logo.bmp"
Invoke-WebRequest -Uri $logoUrl -OutFile $logoPath
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation" -Name "Logo" -Value $logoPath

# Set MaxDisplay value for .bmp files in RecentDocs registry
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.bmp" -Name "MaxDisplay" -Value 0

# Uncomment and use the following lines to set SupportPhone and SupportURL values
# Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation" -Name "SupportPhone" -Value "1-800-ROOYCA"
# Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation" -Name "SupportURL" -Value "https://rooyca.com"

# Execute PowerShell script from a URL
$psScriptUrl = "https://christitus.com/win"
$psScript = Invoke-WebRequest -Uri $psScriptUrl | Select-Object -ExpandProperty Content
Invoke-Expression $psScript

# Self-destruct the script
# Remove-Item -Path $MyInvocation.MyCommand.Path -Force
