import os
import sys
import winreg as reg
import ctypes

# Define your custom command and label
custom_command = "chrome yoo.lat"
custom_label = "Solicitar Ayuda"

# Function to add the custom context menu entry
# "*\\shell"
# "Directory\\Background\\shell"
def add_custom_context_menu_entry(key: str):
    try:
        # Open the Registry key for the desktop background context menu entries
        key = reg.OpenKey(reg.HKEY_CLASSES_ROOT, key, 0, reg.KEY_WRITE)
        
        # Create a subkey for your custom entry
        subkey = reg.CreateKey(key, custom_label)
        
        # Set the command to execute
        reg.SetValue(subkey, "command", reg.REG_SZ, custom_command)

        # add icon from temp folder
        reg.SetValue(subkey, "Icon", reg.REG_SZ, os.path.join(os.environ["TEMP"], "hric.ico"))
        
        # Close the Registry keys
        reg.CloseKey(subkey)
        reg.CloseKey(key)
        
        print(f"Custom context menu entry added: {custom_label}")

    except Exception as e:
        print(f"Error: {str(e)}")
        sys.exit(1)

if __name__ == "__main__":
    # Check for administrative privileges
    if not ctypes.windll.shell32.IsUserAnAdmin():
        print("Please run this script as an administrator.")
        sys.exit(1)

    # Add the custom context menu entry
    add_custom_context_menu_entry("*\\shell")
    add_custom_context_menu_entry("Directory\\Background\\shell")
