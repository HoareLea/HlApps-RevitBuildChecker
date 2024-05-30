import os
import requests
import shutil

def writehost(message):
    print(message)

def download_file(url, destination):
    try:
        response = requests.get(url)
        response.raise_for_status()
        with open(destination, 'wb') as f:
            f.write(response.content)
    except requests.exceptions.RequestException as e:
        writehost(f"Error downloading {url}: {e}")

writehost("install Revit Build Checker")

# URLs
REVBILDCHK_DLL_URL = "https://raw.githubusercontent.com/HoareLea/HlApps-RevitBuildChecker/main/RevitBuildChecker/dist/RevitBuildChecker.dll"
REVBILDCHK_ADDIN_URL = "https://raw.githubusercontent.com/HoareLea/HlApps-RevitBuildChecker/main/RevitBuildChecker/dist/RevitBuildChecker.addin"
REVBILDCHK_CERT_URL = "https://raw.githubusercontent.com/HoareLea/HlApps-RevitBuildChecker/main/RevitBuildChecker/dist/Public_CharlieJones_CodeSigning.cer"

# Paths
PROGRAMDATA_REVIT_ADDINS = os.path.join(os.getenv('ProgramData'), 'autodesk', 'revit', 'addins')
TEMP_PATH = os.getenv('TEMP')

DLL_DESTINATION = os.path.join(TEMP_PATH, 'RevitBuildChecker.dll')
ADDIN_DESTINATION = os.path.join(TEMP_PATH, 'RevitBuildChecker.addin')
CERT_DESTINATION = os.path.join(TEMP_PATH, 'Public_CharlieJones_CodeSigning.cer')

# Pre-run cleanup
for file in [DLL_DESTINATION, ADDIN_DESTINATION, CERT_DESTINATION]:
    try:
        if os.path.exists(file):
            os.remove(file)
    except OSError as e:
        writehost(f"Error removing {file}: {e}")

# Install cert
download_file(REVBILDCHK_CERT_URL, CERT_DESTINATION)

try:
    os.system(f'WdCertMgr.Exe -add {CERT_DESTINATION} -s -r localMachine trustedpublisher')
except Exception as e:
    writehost(f"Error installing certificate: {e}")

# Download files
download_file(REVBILDCHK_DLL_URL, DLL_DESTINATION)
download_file(REVBILDCHK_ADDIN_URL, ADDIN_DESTINATION)

# Iterate over Revit Addin directories and copy files
try:
    for year_dir in os.listdir(PROGRAMDATA_REVIT_ADDINS):
        year_path = os.path.join(PROGRAMDATA_REVIT_ADDINS, year_dir)
        if os.path.isdir(year_path) and (year_dir.isdigit() and int(year_dir) >= 2020):
            dll_destination = os.path.join(year_path, 'RevitBuildChecker.dll')
            addin_destination = os.path.join(year_path, 'RevitBuildChecker.addin')
            writehost(f"Installing RevitBuildChecker to: {year_path}")
            
            shutil.copy(DLL_DESTINATION, dll_destination)
            shutil.copy(ADDIN_DESTINATION, addin_destination)
except OSError as e:
    writehost(f"Error copying files: {e}")
#pyinstaller --clean --onefile  --hidden-import=requests --hidden-import=ipaddress --add-data "RevitBuildChecker/install_RevitBuildChecker.py;." RevitBuildChecker/install_RevitBuildChecker.py -i="dist\RBC2.ico" -n "install_RevitBuildChecker"
