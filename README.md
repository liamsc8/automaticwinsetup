# Automatic Windows Setup

This new windows utillity allows you to skip the oobe and let us do the dirty bit for you!
(yes i know its a .bat)

How to use:
Install windows like normal. Then once you get to the oobe press SHIFT+CTRL+F3. This will put your PC into audit mode. Once you are in audit mode go to this website then download the .bat then run it. Then follow the instructions in the app. Happy Installing!

If you are going to use this in one of your videos then please credit me and send the github link in the desc! It helps me out alot and makes me more motivated to make more projects like this!

Source Code:
@echo off
title Automatic Windows Setup
color 9
echo Please make you you run this as administrator and in audit mode.
echo V1.0.0
echo -------------------------------------------------------------------------
echo Continue and start setting up? Press Y for yes and N for no
set /p Input=Please press Y or N: 
If /I "%Input%"=="Y" goto yes
goto no
:yes
echo Please Wait....
cls
echo -------------------------------------------------------------------------
set /p UserName=Please enter a username: 
net user %UserName% /add
NET LOCALGROUP Administrators %UserName% /ADD
echo Adding necessary registry edits........
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\OOBE" /v "DisablePrivacyExperience" /t REG_DWORD /d 1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Polices\System" /v "EnableCursorSupprression" /t REG_DWORD /d 0
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\Setup: /v "OOBEInProgress" /t REG_DWORD /d 0
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\Setup" /v "SetupPhase" /t REG_DWORD /d 0
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\Setup" /v "SetupType" /t REG_DWORD /d 0
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\SYSTEM\Setup" /f /v "CmdLine" /t REG_SZ /d " "
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\SYSTEM\Setup" /f /v "RespecializeCmdLine" /t REG_SZ /d " "
echo -------------------------------------------------------------------------
echo Done! Please use SysPrep to restart.
echo Open SysPrep?
set /p SysPrepOpen=Please press Y or N: 
If /I "%SysPrepOpen%"=="Y" goto sysprepyes
:sysprepyes
start C:\Windows\System32\Sysprep\sysprep.exe
:no
pause
