copy /y "C:\Users\jonesc4\source\repos\RevitBuildChecker\RevitBuildChecker\dist\RevitBuildChecker.addin" "C:\ProgramData\Autodesk\Revit\Addins\2022\RevitBuildChecker.addin"
copy /y "C:\Users\jonesc4\source\repos\RevitBuildChecker\RevitBuildChecker\dist\RevitBuildChecker.dll" "C:\ProgramData\Autodesk\Revit\Addins\2022\RevitBuildChecker.dll"
pause
start "" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Autodesk\Revit 2022\Revit 2022.lnk"
pause
taskkill /im revit.exe /f /t