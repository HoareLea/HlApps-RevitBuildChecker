@echo off
SETLOCAL EnableExtensions

set "SOURCE_DIR=C:\Users\jonesc4\source\repos\CJ_test_Class_Library\CJ_test_Class_Library"
set "TARGET_ROOT=C:\ProgramData\Autodesk\Revit\Addins"

echo Deleting files...

del /q "%TARGET_ROOT%\2020\CJ_test_Class_library.addin"
del /q "%TARGET_ROOT%\2020\CJ_test_Class_Library.dll"

del /q "%TARGET_ROOT%\2021\CJ_test_Class_library.addin"
del /q "%TARGET_ROOT%\2021\CJ_test_Class_Library.dll"

del /q "%TARGET_ROOT%\2022\CJ_test_Class_library.addin"
del /q "%TARGET_ROOT%\2022\CJ_test_Class_Library.dll"

del /q "%TARGET_ROOT%\2023\CJ_test_Class_library.addin"
del /q "%TARGET_ROOT%\2023\CJ_test_Class_Library.dll"

del /q "%TARGET_ROOT%\2024\CJ_test_Class_library.addin"
del /q "%TARGET_ROOT%\2024\CJ_test_Class_Library.dll"

del /q "%TARGET_ROOT%\2025\CJ_test_Class_library.addin"
del /q "%TARGET_ROOT%\2025\CJ_test_Class_Library.dll"

echo Deletion complete.

ENDLOCAL
