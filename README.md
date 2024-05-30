# Revit Build Checker

## Overview
The Revit Build Checker is a Revit add-in designed to ensure your Autodesk Revit installations are always up to date. Leveraging the Revit API, this tool checks the installed Revit version on your machine and compares it against the latest versions available from a GitHub repository. If your version is outdated, the add-in will prompt you to update, preventing potential issues like model corruption.
[dist/example.png]
## Features
- **Version Check:** Compares your installed Revit version with the latest versions.
- **Alerts:** Notifies you with detailed messages if your version is outdated.
- **Update Link:** Provides a direct link to update through the Software Center.
- **Revit 2020 Support:** Includes specific build checks for Revit 2020.
- **Remote Data Fetching:** Uses synchronous HTTP requests to fetch version data from a remote JSON file.

## Installation

### Prerequisites
- Autodesk Revit (2020 or later).
- .NET Framework 4.7.2 or higher.
- Internet access to fetch the latest version data from GitHub.

### Install
To install, download and run [install_RevitBuildChecker.exe](https://github.com/HoareLea/HlApps-RevitBuildChecker/releases/download/Latest/install_RevitBuildChecker.exe).

### Uninstall
To uninstall, download and run [Uninstall_RevitBuildChecker.bat](https://github.com/HoareLea/HlApps-RevitBuildChecker/releases/download/Latest/Uninstall_RevitBuildChecker.bat).

## Usage
Once installed, the add-in will automatically check the Revit version on startup. If an update is required, a task dialog will appear with instructions on how to proceed.

## Latest Versions
View the latest version information in the [RevitVersionsInfo.json](https://raw.githubusercontent.com/HoareLea/HlApps-RevitBuildChecker/main/RevitBuildChecker/dist/RevitVersionsInfo.json) file.

## Contact
For support or to report issues, contact [DigitalSupport@hoarelea.com](mailto:DigitalSupport@hoarelea.com).

## Contributing
Contributions are welcome! Please fork the repository, make your changes, and submit a pull request for review.

## License
This project is licensed under the MIT License. See the LICENSE file for details.
