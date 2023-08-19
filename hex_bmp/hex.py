# Read the hexadecimal data from image_hex.txt
with open("image_hex.txt", "r") as hex_file:
    hex_data = hex_file.read()

# Convert hexadecimal data to bytes
binary_data = bytes.fromhex(hex_data)

# Save the binary data as a BMP image
with open("output.bmp", "wb") as bmp_file:
    bmp_file.write(binary_data)

print("BMP image created as output.bmp")
