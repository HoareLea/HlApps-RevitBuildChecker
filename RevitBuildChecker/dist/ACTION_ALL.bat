@echo off
:: Change directory to the build output folder
cd /d "C:\Users\jonesc4\source\repos\HoareLea\HlApps-RevitBuildChecker\RevitBuildChecker\dist"

:: Check if the deployment directory exists and copy JSON file if it does
if exist "C:\SourceFiles\HLApps-Deployment-master\" (
    copy /y "RevitVersionsInfo.json" "C:\SourceFiles\HLApps-Deployment-master\RevitVersionsInfo.json" && (
        echo Successfully copied RevitVersionsInfo.json to deployment directory.
    ) || (
        echo ERROR: Failed to copy RevitVersionsInfo.json.
    )
) else (
    :: If it doesn't exist, create the directory and copy necessary files
    mkdir "C:\SourceFiles\HLApps-Deployment-master\" && (
        echo Created directory: C:\SourceFiles\HLApps-Deployment-master\
    )
    xcopy /d /y *.dll "C:\SourceFiles\HLApps-Deployment-master\RevitBuildChecker\" && (
        echo DLL files copied to RevitBuildChecker directory.
    ) || (
        echo ERROR: Failed to copy DLL files.
    )
)

:: Define a base path for easier reference
set "ADDINS_PATH=C:\ProgramData\Autodesk\Revit\Addins"

:: Loop through each year from 2020 to 2025
for %%Y in (2020 2021 2022 2023 2024 2025) do (
    set "YEAR_PATH=%%ADDINS_PATH%%\%%Y\RevitBuildChecker"
    
    :: Check if the directory for the current year exists
    if exist "%%YEAR_PATH%%" (
        copy /y "RevitBuildChecker.addin" "%%YEAR_PATH%%\RevitBuildChecker.addin" && (
            echo RevitBuildChecker.addin copied to %%Y.
        ) || (
            echo ERROR: Failed to copy RevitBuildChecker.addin to %%Y.
        )
        copy /y "RevitBuildChecker.dll" "%%YEAR_PATH%%\RevitBuildChecker.dll" && (
            echo RevitBuildChecker.dll copied to %%Y.
        ) || (
            echo ERROR: Failed to copy RevitBuildChecker.dll to %%Y.
        )
    ) else (
        :: If it doesn't exist, create the directory and copy the files
        mkdir "%%YEAR_PATH%%" && (
            echo Created directory: %%YEAR_PATH%%
        )
        copy /y "RevitBuildChecker.addin" "%%YEAR_PATH%%\RevitBuildChecker.addin" && (
            echo RevitBuildChecker.addin copied to newly created %%Y directory.
        ) || (
            echo ERROR: Failed to copy RevitBuildChecker.addin to newly created %%Y directory.
        )
        copy /y "RevitBuildChecker.dll" "%%YEAR_PATH%%\RevitBuildChecker.dll" && (
            echo RevitBuildChecker.dll copied to newly created %%Y directory.
        ) || (
            echo ERROR: Failed to copy RevitBuildChecker.dll to newly created %%Y directory.
        )
    )
)

:: Pause to view any messages or errors
pause
