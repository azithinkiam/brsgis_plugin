import subprocess
import sys
import os


def install(package):
    subprocess.call([sys.executable, "-m", "pip", "install", package])


directory = 'C:\\Program Files\\QGIS 3.0'

args = ["icacls", directory,
        "/grant", "users:(OI)(CI)(F)"]

subprocess.check_call(args)


install('pyperclip')
install('openpyxl')

src = r"Z:\0 - Settings\GIS\QGIS\shortcuts.PRD"
dst = r"C:\Users\%username%\Desktop"

cmd = 'copy "%s" "%s"' % (src, dst)

status = subprocess.call(cmd, shell=True)

if status != 0:
    if status < 0:
        print("Killed by signal", status)
    else:
        print("Command failed with return code - ", status)
else:
    print('Execution of %s passed!\n' % cmd)

