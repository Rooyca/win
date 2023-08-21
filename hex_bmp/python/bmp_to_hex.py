with open("fi.ico", "rb") as image_file:
    hex_data = image_file.read().hex()

with open("icon", "w") as output_file:
    output_file.write(hex_data)
