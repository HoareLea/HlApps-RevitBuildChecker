@echo off
SETLOCAL EnableExtensions

set "TARGET_ROOT=C:\ProgramData\Autodesk\Revit\Addins"

echo Deleting files...

del /q "%TARGET_ROOT%\2020\RevitBuildChecker.addin"
del /q "%TARGET_ROOT%\2020\RevitBuildChecker.dll"
del /q "%TARGET_ROOT%\2020\RevitVersionsInfo.json"

del /q "%TARGET_ROOT%\2021\RevitBuildChecker.addin"
del /q "%TARGET_ROOT%\2021\RevitBuildChecker.dll"
del /q "%TARGET_ROOT%\2021\RevitVersionsInfo.json"

del /q "%TARGET_ROOT%\2022\RevitBuildChecker.addin"
del /q "%TARGET_ROOT%\2022\RevitBuildChecker.dll"
del /q "%TARGET_ROOT%\2022\RevitVersionsInfo.json"

del /q "%TARGET_ROOT%\2023\RevitBuildChecker.addin"
del /q "%TARGET_ROOT%\2023\RevitBuildChecker.dll"
del /q "%TARGET_ROOT%\2023\RevitVersionsInfo.json"

del /q "%TARGET_ROOT%\2024\RevitBuildChecker.addin"
del /q "%TARGET_ROOT%\2024\RevitBuildChecker.dll"
del /q "%TARGET_ROOT%\2024\RevitVersionsInfo.json"

del /q "%TARGET_ROOT%\2025\RevitBuildChecker.addin"
del /q "%TARGET_ROOT%\2025\RevitBuildChecker.dll"
del /q "%TARGET_ROOT%\2025\RevitVersionsInfo.json"

echo Deletion complete.

ENDLOCAL
