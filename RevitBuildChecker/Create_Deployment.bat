REM sign the dll then zip the folder
signtool.exe sign /fd SHA256 /f CharlieJones_CodeSigning.pfx /p  AegOy!2V9Z?6 dist/RevitBuildChecker.dll
"C:\Program Files\7-Zip\7z.exe" a -t7z dist.7z dist\ -aoa
