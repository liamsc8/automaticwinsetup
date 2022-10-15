::setting up the cmd
@echo off
title Automatic Windows Setup

echo -----------------------------------------------------------------------------------------
echo Automatic Windows Setup
echo V1.0.2 Open Beta
echo ----------------------WARNING----------------------
echo Please make sure you run this as admin and in audit mode! This will only work on NEW windows installations.
echo ---------------------------------------------------
set /p UserName=Please enter a new account username: 
net user %UserName% /add
NET LOCALGROUP Administrators %UserName% /ADD
echo Created Account %UserName%
echo -----------------------------------------------------------------------------------------
echo Adding necessary registry edits........
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\OOBE" /f /v "DisablePrivacyExperience" /t REG_DWORD /d 1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Polices\System" /f /v "EnableCursorSupprression" /t REG_DWORD /d 0
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\Setup" /f /v "OOBEInProgress" /t REG_DWORD /d 0
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\Setup" /f /v "SetupPhase" /t REG_DWORD /d 0
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\Setup" /f /v "SetupType" /t REG_DWORD /d 0
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /f /v "VerboseStatus" /t REG_DWORD /d 1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\SYSTEM\Setup" /f /v "CmdLine" /t REG_SZ /d " "
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\SYSTEM\Setup" /f /v "RespecializeCmdLine" /t REG_SZ /d " "
cls
echo -----------------------------------------------------------------------------------------
echo Done! Would you like to restart?
set /p restart?=Please press Y or N: 
If /I "restart?%"=="Y" goto restart
:restart
shutdown /r
:no
pause
