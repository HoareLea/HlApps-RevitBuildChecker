# Revit Build Checker

## Overview
The Revit Build Checker is a Revit add-in developed to help manage and ensure that Autodesk Revit installations are up to date. It uses the Revit API to determine the installed version of Revit on a user's machine and compares it against a maintained list of current versions fetched from a GitHub repository. If the installed version is not up to date, the add-in prompts the user to update their software, helping to prevent potential issues like model corruption due to outdated software.

## Features
- Checks the installed Revit version against the latest versions available.
- Alerts users with a detailed message if their version is outdated.
- Provides a direct link to update the software through the Software Center.
- Supports Revit 2020 specific build checks with a predefined dictionary.
- Utilizes synchronous HTTP requests to fetch version data from a remote JSON file.

## Installation

### Prerequisites
- Autodesk Revit (2020 or later versions are supported).
- .NET Framework 4.7.2 or higher.
- Access to the internet to fetch the latest version data from GitHub.

### Setup
1. Clone the repository or download the source code.
2. Build the solution using Visual Studio 2019 or later.
3. Add the resulting DLL as an Add-In in Revit by modifying the `RevitAddIns` manifest file typically located at `%APPDATA%\Autodesk\Revit\Addins\{Revit Year}\`.

### Adding the Add-In to Revit
1. Create a new text file in the appropriate Addins folder for your version of Revit.
2. Rename the text file to `RevitBuildChecker.addin`.
3. Edit the file to include the following XML configuration:

```xml
<?xml version="1.0" encoding="utf-8" standalone="no"?>
<RevitAddIns>
  <AddIn Type="Application">
    <Name>RevitBuildChecker</Name>
    <Assembly>"[PATH TO YOUR DLL]"</Assembly>
    <AddInId>[UNIQUE GUID]</AddInId>
    <FullClassName>RevitBuildChecker.App</FullClassName>
    <VendorId>HL</VendorId>
    <VendorDescription>Hoare Lea, Digital Support</VendorDescription>
  </AddIn>
</RevitAddIns>
```
Replace `[PATH TO YOUR DLL]` with the path to the compiled DLL and `[UNIQUE GUID]` with a unique identifier for the add-in.

## Usage
Once installed, the add-in will automatically check the Revit version on startup. If an update is required, a task dialog will appear with information on how to proceed.

## Latest Versions:
View the [[RevitVersionsInfo.json](RevitBuildChecker/dist/RevitVersionsInfo.json)](https://raw.githubusercontent.com/HoareLea/HlApps-RevitBuildChecker/main/RevitBuildChecker/dist/RevitVersionsInfo.json) file.


## Contact
For support or to report issues, contact `DigitalSupport@hoarelea.com`.

## Contributing
Contributions to the project are welcome. Please fork the repository, make your changes, and submit a pull request for review.

## License
This project is licensed under the MIT License - see the LICENSE file for details.
