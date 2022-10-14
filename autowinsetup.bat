@echo off
title Automatic Windows Setup
color 9
echo Please make you you run this as administrator and in audit mode.
echo V1.1.0
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
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\Setup" /v "OOBEInProgress" /t REG_DWORD /d 0
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\Setup" /v "SetupPhase" /t REG_DWORD /d 0
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\Setup" /v "SetupType" /t REG_DWORD /d 0
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\SYSTEM\Setup" /f /v "CmdLine" /t REG_SZ /d " "
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\SYSTEM\Setup" /f /v "RespecializeCmdLine" /t REG_SZ /d " "
echo Done adding necessary registry edits!
cls
echo Activating Windows!
&cscript //nologo slmgr.vbs /ckms >nul&cscript //nologo slmgr.vbs /upk >nul&cscript //nologo slmgr.vbs /cpky >nul&set i=1&wmic os | findstr /I "enterprise" >nul if %errorlevel% EQU 0 (cscript //nologo slmgr.vbs /ipk NPPR9-FWDCX-D2C8J-H872K-2YT43 >nul&cscript //nologo slmgr.vbs /ipk DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4 >nul&cscript //nologo slmgr.vbs /ipk WNMTR-4C88C-JK8YV-HQ7T2-76DF9 >nul&cscript //nologo slmgr.vbs /ipk 2F77B-TNFGY-69QQF-B8YKP-D69TJ >nul&cscript //nologo slmgr.vbs /ipk DCPHK-NFMTC-H88MJ-PFHPY-QJ4BJ >nul&cscript //nologo slmgr.vbs /ipk QFFDN-GRT3P-VKWWX-X7T3R-8B639 >nul&goto server) else wmic os | findstr /I "home" >nul if %errorlevel% EQU 0 (cscript //nologo slmgr.vbs /ipk TX9XD-98N7V-6WMQ6-BX7FG-H8Q99 >nul&cscript //nologo slmgr.vbs /ipk 3KHY7-WNT83-DGQKR-F7HPR-844BM >nul&cscript //nologo slmgr.vbs /ipk 7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH >nul&cscript //nologo slmgr.vbs /ipk PVMJN-6DFY6-9CCP6-7BKTT-D3WVR >nul&goto server) else wmic os | findstr /I "education" >nul if %errorlevel% EQU 0 (cscript //nologo slmgr.vbs /ipk NW6C2-QMPVW-D7KKK-3GKT6-VCFB2 >nul&cscript //nologo slmgr.vbs /ipk 2WH4N-8QGBV-H22JP-CT43Q-MDWWJ >nul&goto server) else wmic os | findstr /I "10 pro" >nul if %errorlevel% EQU 0 (cscript //nologo slmgr.vbs /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX >nul&cscript //nologo slmgr.vbs /ipk MH37W-N47XK-V7XM9-C7227-GCQG9 >nul&goto server) else (goto notsupported) :server if %i%==1 set KMS=kms7.MSGuides.com if %i%==2 set KMS=kms8.MSGuides.com if %i%==3 set KMS=kms9.MSGuides.com if %i%==4 goto notsupported cscript //nologo slmgr.vbs /skms %KMS%:1688 >nul&echo 
echo -------------------------------------------------------------------------
echo Done! Would you like to restart?
set /p restart?=Please press Y or N: 
If /I "%Srestart?%"=="Y" goto restart
:restart
shutdown /r
:no
pause
