# Read the hexadecimal data from logo
$hexData = Get-Content -Raw -Path "%MYFILES%\logo"

# Convert hexadecimal data to bytes
$binaryData = [byte[]]::new($hexData.Length / 2)
for ($i = 0; $i -lt $hexData.Length; $i += 2) {
    $binaryData[$i / 2] = [byte]::Parse($hexData.Substring($i, 2), [System.Globalization.NumberStyles]::HexNumber)
}

# Save the binary data as a BMP image
$logoPath = Join-Path $env:TEMP "logo.bmp"
Set-Content -Path $logoPath -Value $binaryData -Encoding Byte