@echo off
REM Change the current directory to the RevitBuildChecker distribution folder
::cd C:\Users\jonesc4\source\repos\HoareLea\HlApps-RevitBuildChecker\RevitBuildChecker\dist

REM Check if the deployment directory exists and delete the RevitVersionsInfo.json file
if exist "C:\SourceFiles\HLApps-Deployment-master\" (
    del /f /q "C:\SourceFiles\HLApps-Deployment-master\RevitVersionsInfo.json"
    REM Optionally, remove the deployment directory if you want it fully cleaned
    rmdir /s /q "C:\SourceFiles\HLApps-Deployment-master"
)

REM Deleting deployed files and the folder in Autodesk Revit 2020 addin directory
if exist "C:\ProgramData\Autodesk\Revit\Addins\2020\RevitBuildChecker\" (
    del /f /q "C:\ProgramData\Autodesk\Revit\Addins\2020\RevitBuildChecker\*.*"
    rmdir /s /q "C:\ProgramData\Autodesk\Revit\Addins\2020\RevitBuildChecker"
)

REM Deleting deployed files and the folder in Autodesk Revit 2021 addin directory
if exist "C:\ProgramData\Autodesk\Revit\Addins\2021\RevitBuildChecker\" (
    del /f /q "C:\ProgramData\Autodesk\Revit\Addins\2021\RevitBuildChecker\*.*"
    rmdir /s /q "C:\ProgramData\Autodesk\Revit\Addins\2021\RevitBuildChecker"
)

REM Deleting deployed files and the folder in Autodesk Revit 2022 addin directory
if exist "C:\ProgramData\Autodesk\Revit\Addins\2022\RevitBuildChecker\" (
    del /f /q "C:\ProgramData\Autodesk\Revit\Addins\2022\RevitBuildChecker\*.*"
    rmdir /s /q "C:\ProgramData\Autodesk\Revit\Addins\2022\RevitBuildChecker"
)

REM Deleting deployed files and the folder in Autodesk Revit 2023 addin directory
if exist "C:\ProgramData\Autodesk\Revit\Addins\2023\RevitBuildChecker\" (
    del /f /q "C:\ProgramData\Autodesk\Revit\Addins\2023\RevitBuildChecker\*.*"
    rmdir /s /q "C:\ProgramData\Autodesk\Revit\Addins\2023\RevitBuildChecker"
)

REM Deleting deployed files and the folder in Autodesk Revit 2024 addin directory
if exist "C:\ProgramData\Autodesk\Revit\Addins\2024\RevitBuildChecker\" (
    del /f /q "C:\ProgramData\Autodesk\Revit\Addins\2024\RevitBuildChecker\*.*"
    rmdir /s /q "C:\ProgramData\Autodesk\Revit\Addins\2024\RevitBuildChecker"
)

REM Deleting deployed files and the folder in Autodesk Revit 2025 addin directory
if exist "C:\ProgramData\Autodesk\Revit\Addins\2025\RevitBuildChecker\" (
    del /f /q "C:\ProgramData\Autodesk\Revit\Addins\2025\RevitBuildChecker\*.*"
    rmdir /s /q "C:\ProgramData\Autodesk\Revit\Addins\2025\RevitBuildChecker"
)

echo All specified files and folders have been deleted.
pause
