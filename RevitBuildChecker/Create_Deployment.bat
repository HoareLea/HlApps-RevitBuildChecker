REM sign the dll then zip the folder
echo update this script for password
pause
REM comment for password
REM signtool.exe sign /fd SHA256 /f CharlieJones_CodeSigning.pfx /p  PASSWORD dist/RevitBuildChecker.dll
"C:\Program Files\7-Zip\7z.exe" a -t7z dist.7z dist\ -aoa
