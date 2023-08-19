# Read the hexadecimal data from image_hex.txt
$hexData = Get-Content -Raw -Path "image_hex.txt"

# Convert hexadecimal data to bytes
$binaryData = [byte[]]::new($hexData.Length / 2)
for ($i = 0; $i -lt $hexData.Length; $i += 2) {
    $binaryData[$i / 2] = [byte]::Parse($hexData.Substring($i, 2), [System.Globalization.NumberStyles]::HexNumber)
}

# Save the binary data as a BMP image
Set-Content -Path "output.bmp" -Value $binaryData -Encoding Byte

Write-Host "BMP image created as output.bmp"
