@echo off
if "%1"=="b" goto bdrive

cls
echo.
echo If the floppy disk is in drive b, please exit by pressing Ctrl-C and
echo restart the install program using the command
echo            b:instlmo2 b
echo.
pause

if exist snorun.exe goto xx1
echo Copying SNORUN
rem always overwrite to avoid waiting for permission (invisible with nul)
a:pkunzip -o a:\lmlo2\programs\snorun c:\ >nul
:xx1
cls
echo If this disk is not in the drive when the routines end, the message
echo "Batch file not found" will appear. This is perfectly normal.
pause
echo.
echo Loading install routines
c:snorun a:instlmo2
goto exit

:bdrive
if exist snorun.exe goto xx2
echo Copying SNORUN
b:pkunzip -o b:\lmlo2\programs\snorun c:\ >nul
:xx2
cls
echo If this disk is not in the drive when the routines end, the message
echo "Batch file not found" will appear. This is perfectly normal.
pause
echo.
echo Loading install routines
c:snorun b:instlmo2
:exit
