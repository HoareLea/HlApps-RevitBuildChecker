REM  Change the current directory to the RevitBuildChecker distribution folder
REM cd C:\Users\jonesc4\source\repos\HoareLea\HlApps-RevitBuildChecker\RevitBuildChecker\dist
echo code signing
signtool.exe sign /fd SHA256 /f CharlieJones_CodeSigning.pfx /p  AegOy!2V9Z?6 RevitBuildChecker.dll
REM  Check if the deployment directory exists
if exist "C:\SourceFiles\HLApps-Deployment-master\" (
    REM If it exists, copy the updated RevitVersionsInfo.json into it
    copy /y "RevitVersionsInfo.json" "C:\SourceFiles\HLApps-Deployment-master\RevitVersionsInfo.json"
) else (
    REM If not, create the directory and copy all DLL files to a new RevitBuildChecker folder
    mkdir "C:\SourceFiles\HLApps-Deployment-master\"
    xcopy *.dll ".\RevitBuildChecker\" /d
)

REM  Deploying to Autodesk Revit 2020 addin folder
if exist "C:\ProgramData\Autodesk\Revit\Addins\2020\RevitBuildChecker\" (
    REM If the folder exists, update the addin and dll files
    copy /y "RevitBuildChecker.addin" "C:\ProgramData\Autodesk\Revit\Addins\2020\RevitBuildChecker.addin"
    copy /y "RevitBuildChecker.dll" "C:\ProgramData\Autodesk\Revit\Addins\2020\RevitBuildChecker\RevitBuildChecker.dll"
) else (
    REM If not, create the folder and copy the necessary files
    mkdir "C:\ProgramData\Autodesk\Revit\Addins\2020\RevitBuildChecker"
    copy /y "RevitBuildChecker.addin" "C:\ProgramData\Autodesk\Revit\Addins\2020\RevitBuildChecker.addin"
    copy /y "RevitBuildChecker.dll" "C:\ProgramData\Autodesk\Revit\Addins\2020\RevitBuildChecker\RevitBuildChecker.dll"
)

REM  Deploying to Autodesk Revit 2021 addin folder
REM 2021
if exist "C:\ProgramData\Autodesk\Revit\Addins\2021\RevitBuildChecker\" (
    REM If the folder exists, update the addin and dll files
    copy /y "RevitBuildChecker.addin" "C:\ProgramData\Autodesk\Revit\Addins\2021\RevitBuildChecker.addin"
    copy /y "RevitBuildChecker.dll" "C:\ProgramData\Autodesk\Revit\Addins\2021\RevitBuildChecker\RevitBuildChecker.dll"
) else (
    REM If not, create the folder and copy the necessary files
    mkdir "C:\ProgramData\Autodesk\Revit\Addins\2021\RevitBuildChecker"
    copy /y "RevitBuildChecker.addin" "C:\ProgramData\Autodesk\Revit\Addins\2021\RevitBuildChecker.addin"
    copy /y "RevitBuildChecker.dll" "C:\ProgramData\Autodesk\Revit\Addins\2021\RevitBuildChecker\RevitBuildChecker.dll"
)

REM 2022
if exist "C:\ProgramData\Autodesk\Revit\Addins\2022\RevitBuildChecker\" (
    REM If the folder exists, update the addin and dll files
    copy /y "RevitBuildChecker.addin" "C:\ProgramData\Autodesk\Revit\Addins\2022\RevitBuildChecker.addin"
    copy /y "RevitBuildChecker.dll" "C:\ProgramData\Autodesk\Revit\Addins\2022\RevitBuildChecker\RevitBuildChecker.dll"
) else (
    REM If not, create the folder and copy the necessary files
    mkdir "C:\ProgramData\Autodesk\Revit\Addins\2022\RevitBuildChecker"
    copy /y "RevitBuildChecker.addin" "C:\ProgramData\Autodesk\Revit\Addins\2022\RevitBuildChecker.addin"
    copy /y "RevitBuildChecker.dll" "C:\ProgramData\Autodesk\Revit\Addins\2022\RevitBuildChecker\RevitBuildChecker.dll"
)

REM 2023
if exist "C:\ProgramData\Autodesk\Revit\Addins\2023\RevitBuildChecker\" (
    REM If the folder exists, update the addin and dll files
    copy /y "RevitBuildChecker.addin" "C:\ProgramData\Autodesk\Revit\Addins\2023\RevitBuildChecker.addin"
    copy /y "RevitBuildChecker.dll" "C:\ProgramData\Autodesk\Revit\Addins\2023\RevitBuildChecker\RevitBuildChecker.dll"
) else (
    REM If not, create the folder and copy the necessary files
    mkdir "C:\ProgramData\Autodesk\Revit\Addins\2023\RevitBuildChecker"
    copy /y "RevitBuildChecker.addin" "C:\ProgramData\Autodesk\Revit\Addins\2023\RevitBuildChecker.addin"
    copy /y "RevitBuildChecker.dll" "C:\ProgramData\Autodesk\Revit\Addins\2023\RevitBuildChecker\RevitBuildChecker.dll"
)

REM 2024
if exist "C:\ProgramData\Autodesk\Revit\Addins\2024\RevitBuildChecker\" (
    REM If the folder exists, update the addin and dll files
    copy /y "RevitBuildChecker.addin" "C:\ProgramData\Autodesk\Revit\Addins\2024\RevitBuildChecker.addin"
    copy /y "RevitBuildChecker.dll" "C:\ProgramData\Autodesk\Revit\Addins\2024\RevitBuildChecker\RevitBuildChecker.dll"
) else (
    REM If not, create the folder and copy the necessary files
    mkdir "C:\ProgramData\Autodesk\Revit\Addins\2024\RevitBuildChecker"
    copy /y "RevitBuildChecker.addin" "C:\ProgramData\Autodesk\Revit\Addins\2024\RevitBuildChecker.addin"
    copy /y "RevitBuildChecker.dll" "C:\ProgramData\Autodesk\Revit\Addins\2024\RevitBuildChecker\RevitBuildChecker.dll"
)

REM 2025
if exist "C:\ProgramData\Autodesk\Revit\Addins\2025\RevitBuildChecker\" (
    REM If the folder exists, update the addin and dll files
    copy /y "RevitBuildChecker.addin" "C:\ProgramData\Autodesk\Revit\Addins\2025\RevitBuildChecker.addin"
    copy /y "RevitBuildChecker.dll" "C:\ProgramData\Autodesk\Revit\Addins\2025\RevitBuildChecker\RevitBuildChecker.dll"
) else (
    REM If not, create the folder and copy the necessary files
    mkdir "C:\ProgramData\Autodesk\Revit\Addins\2025\RevitBuildChecker"
    copy /y "RevitBuildChecker.addin" "C:\ProgramData\Autodesk\Revit\Addins\2025\RevitBuildChecker.addin"
    copy /y "RevitBuildChecker.dll" "C:\ProgramData\Autodesk\Revit\Addins\2025\RevitBuildChecker\RevitBuildChecker.dll"
)
echo add cert
WdCertMgr.Exe -add Public_CharlieJones_CodeSigning.cer -s -r localMachine trustedpublisher
 REM Pause the script execution to review the output
pause
