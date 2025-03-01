@echo off
title Heroes III VCMI DEMO Builder
cls

if exist "%~dp0h3demo_mac" rd /q /s "%~dp0h3demo_mac" >nul
if exist "%~dp0h3demo" rd /q /s "%~dp0h3demo" >nul
if exist "%~dp0extracted" rd /q /s "%~dp0extracted" >nul
if exist "%~dp0demo" rd /q /s "%~dp0demo" >nul

if exist "%~dp0heroes_3_complete_demo.7z.*" (
	"%~dp0tools\7za.exe" x "%~dp0heroes_3_complete_demo.7z.001" -o"%~dp0" -y >nul 2>nul
	del /q "%~dp0heroes_3_complete_demo.7z.*" >nul
)

if not exist "%~dp0heroes_3_complete_demo.sit" (
	echo  You need to put heroes_3_complete_demo.sit into "%~dp0"
	goto :finish
)

if not exist "%~dp0h3demo.exe" (
	echo  You need to put h3demo.exe into "%~dp0"
	goto :finish
)



echo.
echo  Extracting Windows Demo

"%~dp0tools\7za.exe" x "%~dp0h3demo.exe" -o"%~dp0h3demo" -y >nul 2>nul

md "%~dp0h3demo\Disk1\extracted"
pushd "%~dp0h3demo\Disk1\extracted"

"%~dp0tools\i5comp.exe" x "%~dp0h3demo\Disk1\data1.cab" >nul 2>nul

popd

md "%~dp0demo\data"
md "%~dp0demo\maps"
md "%~dp0demo\mp3"

move /y "%~dp0h3demo\Disk1\extracted\data\*" "%~dp0demo\data" >nul
move /y "%~dp0h3demo\Disk1\extracted\maps\*" "%~dp0demo\maps" >nul
move /y "%~dp0h3demo\Disk1\extracted\mp3\*" "%~dp0demo\mp3" >nul

rd /q /s "%~dp0h3demo"


echo.
echo  Extracting MacOS Demo


REM Extract MacOS Demo
"%~dp0tools\unar.exe" -q "%~dp0heroes_3_complete_demo.sit" -o "%~dp0." >nul

ren "%~dp0Heroes III Demo" "h3demo_mac"

echo.
echo  Merging Demo files

REM Merge LODs
"%~dp0tools\lodmerge.exe" "%~dp0demo\data\h3bitmap.lod" "%~dp0h3demo_mac\data\h3bitmap.lod"
"%~dp0tools\lodmerge.exe" "%~dp0demo\data\h3sprite.lod" "%~dp0h3demo_mac\data\h3sprite.lod"
"%~dp0tools\lodmerge.exe" "%~dp0demo\data\heroes3.snd" "%~dp0h3demo_mac\data\heroes3.snd"
"%~dp0tools\lodmerge.exe" "%~dp0demo\data\video.vid" "%~dp0h3demo_mac\data\video.vid"

move /y "%~dp0h3demo_mac\data\h3ab_spr.lod" "%~dp0demo\data\h3ab_spr.lod" >nul
move /y "%~dp0h3demo_mac\maps\h3demo.h3m" "%~dp0demo\maps\h3demo.h3m" >nul

rd /q /s "%~dp0h3demo_mac"


echo.
echo  Finished!
echo.


:finish
echo  Press any key to exit
pause >nul