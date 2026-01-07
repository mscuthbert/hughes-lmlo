@echo off
cls

if "%3"=="b" goto bdrive1

echo.
echo If the floppy disk is in drive b, please exit by pressing Ctrl-C and
echo restart the concord program as before, adding the letter b at the end
echo thus:
echo            b:concord test in b
echo.
echo or - generically - b:concord filename word b
echo.
pause

:bdrive1
if "%1"=="test" goto test
echo.
echo To use this rudimentary program with other files, make sure
echo.
echo that KLIC.SAV and SNORUN.EXE and the data file
echo.
echo are in the current directory.
echo.

pause
goto run

:test
echo.
echo This demonstration uses the file THMS-LMO.TST for its data.
echo.
echo It first places KLIC.SAV and SNORUN.EXE and THMS-LMO.TST in
echo the current directory on the C: drive. It writes its output
echo to that directory.
echo.

pause

c:
if "%3"=="b" goto bdrive2

echo Copying SNORUN
if %1==test a:\pkunzip a:\programs\snorun c: >nul
echo Copying the testfile
if %1==test a:\pkunzip a:\misc\thms-lmo c: >nul
echo Copying KLIC
if %1==test a:\pkunzip a:\programs\klic c: >nul

if %1==test c:snorun c:klic /y=c:thms-lmo.tst /f=" %2 " /nq /ns
rem /ns is an undocumented parameter for this demonstration
goto exit

:bdrive2
echo Copying SNORUN
if %1==test b:\pkunzip b:\programs\snorun c:
echo Copying the testfile
if %1==test b:\pkunzip b:\misc\thms-lmo c:
echo Copying KLIC
if %1==test b:\pkunzip b:\programs\klic c:

if %1==test c:snorun c:klic /y=c:thms-lmo.tst /f=" %2 " /nq /ns
goto exit

:run
snorun klic /y=%1 /f=" %2 " /nq /ns

:exit
echo.
