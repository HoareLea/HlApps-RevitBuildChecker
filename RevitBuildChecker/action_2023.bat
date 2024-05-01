copy /y "C:\Users\jonesc4\source\repos\RevitBuildChecker\RevitBuildChecker\dist\RevitBuildChecker.addin" "C:\ProgramData\Autodesk\Revit\Addins\2023\RevitBuildChecker.addin"
copy /y "C:\Users\jonesc4\source\repos\RevitBuildChecker\RevitBuildChecker\dist\RevitBuildChecker.dll" "C:\ProgramData\Autodesk\Revit\Addins\2023\RevitBuildChecker.dll"
pause
start "" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Autodesk\Revit 2023\Revit 2023.lnk"
pause
taskkill /im revit.exe /f /t 