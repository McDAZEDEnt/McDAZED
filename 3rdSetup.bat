@echo off
set ROOTDIR=%~dp0
set ROOTDIR=%ROOTDIR:~0,-1%
cd /d "%ROOTDIR%"
for %%I in (.) do set CurrDirName=%%~nxI
echo %CurrDirName%
if not "%1"=="am_admin" (
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'"
    exit /b
)

taskkill /f /im "Dropbox.exe"

attrib -h "%Arma3%/!Workshop"
rd /s /q "%Arma3%/!Workshop"

:: LARGE PAGES
echo .
echo ~~~~~~~~~!!!!!!!!!~~~~~~~~~
echo ~~~~~~~~~READ CAREFULLY!~~~~~~~~~
echo .
echo A white pop up will appear after you press 'Enter'.
echo Answer 'Yes' to the prompt, and confirm the changes.
echo .
pause
cd /d "%ROOTDIR%"
hugepages.reg
:: Repair in launcher
echo .
echo ~~~~~~~~~!!!!!!!!!~~~~~~~~~
echo ~~~~~~~~~READ CAREFULLY!~~~~~~~~~
echo .
echo DO NOT PROCEED UNTIL AFTER THE LAUNCHER OPENS!!
echo Follow steps in HowTo1.jpg and HowTo2.jpg
echo Repair 'NR6' and 'ace_x'
echo.
start steam://rungameid/107410
pause
TASKKILL /F /IM steam.exe
TASKKILL /F /IM arma3launcher.exe
:: userconfig and mission symlink
cd /d "%arma3%"
rmdir /s /q "%arma3%/userconfig"
rmdir /s /q "%arma3%/mpmissions"
rmdir /s /q "%arma3%/keys"
rmdir /s /q "%ROOTDIR%/Saved"
rmdir /s /q "%ROOTDIR%/UserSaved"
rmdir /s /q "%ROOTDIR%/x"
rmdir /s /q "%ROOTDIR%/z"
mklink /J "%arma3%/userconfig" "%ROOTDIR%/userconfig"
mklink /J "%arma3%/mpmissions" "%ROOTDIR%/mpmissions"
mklink /J "%arma3%/keys" "%ROOTDIR%/userconfig/keys"
:: UNHIDE !WORKSHOP & Copy missing keys
attrib -h "%Arma3%/!Workshop"
ROBOCOPY "%ROOTDIR%/userconfig/!Workshop" "%arma3%/!Workshop" *.bisign /E
:: make profile from template
cd /d "%ROOTDIR%"
del *.Arma3Profile
del *.vars
del Arma3.cfg
del BISProfile.json
robocopy "%ROOTDIR%/userconfig" "%ROOTDIR%" *.Arma3Profile
ren "config.Arma3Profile" "%CurrDirName%.Arma3Profile"
ren "config.3den.Arma3Profile" "%CurrDirName%.3den.Arma3Profile"
ren "config.vars.Arma3Profile" "%CurrDirName%.vars.Arma3Profile"
call FoV.exe
EXIT
