@echo off
REM Change the current directory to the RevitBuildChecker distribution folder
REM Check if the deployment directory exists and delete the RevitVersionsInfo.json file
echo Removing Revit Build Checker
if exist "C:\SourceFiles\HLApps-Deployment-master\RevitVersionsInfo.json" (
    del /f /q "C:\SourceFiles\HLApps-Deployment-master\RevitVersionsInfo.json"
)

del /f /q "C:\ProgramData\Autodesk\Revit\Addins\2020\RevitBuildChecker.addin"
del /f /q "C:\ProgramData\Autodesk\Revit\Addins\2020\RevitBuildChecker.dll"

del /f /q "C:\ProgramData\Autodesk\Revit\Addins\2021\RevitBuildChecker.addin"
del /f /q "C:\ProgramData\Autodesk\Revit\Addins\2021\RevitBuildChecker.dll"

del /f /q "C:\ProgramData\Autodesk\Revit\Addins\2022\RevitBuildChecker.addin"
del /f /q "C:\ProgramData\Autodesk\Revit\Addins\2022\RevitBuildChecker.dll"

del /f /q "C:\ProgramData\Autodesk\Revit\Addins\2023\RevitBuildChecker.addin"
del /f /q "C:\ProgramData\Autodesk\Revit\Addins\2023\RevitBuildChecker.dll"

del /f /q "C:\ProgramData\Autodesk\Revit\Addins\2024\RevitBuildChecker.addin"
del /f /q "C:\ProgramData\Autodesk\Revit\Addins\2024\RevitBuildChecker.dll"

del /f /q "C:\ProgramData\Autodesk\Revit\Addins\2025\RevitBuildChecker.addin"
del /f /q "C:\ProgramData\Autodesk\Revit\Addins\2025\RevitBuildChecker.dll"

del /f /q "C:\windows\Temp\RevitBuildChecker.dll"
del /f /q "C:\windows\Temp\RevitBuildChecker.addin"
del /f /q "C:\windows\Temp\Public_CharlieJones_CodeSigning.cer"