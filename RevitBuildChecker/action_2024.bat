copy /y "C:\Users\jonesc4\source\repos\RevitBuildChecker\RevitBuildChecker\dist\RevitBuildChecker.addin" "C:\ProgramData\Autodesk\Revit\Addins\2024\RevitBuildChecker.addin"
copy /y "C:\Users\jonesc4\source\repos\RevitBuildChecker\RevitBuildChecker\dist\RevitBuildChecker.dll" "C:\ProgramData\Autodesk\Revit\Addins\2024\RevitBuildChecker.dll"
pause
start "" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Autodesk\Revit 2024\Revit 2024.lnk"
pause
taskkill /im revit.exe /f /t 
