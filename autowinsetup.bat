@echo off
title Automatic Windows Setup
color 9
echo Please make you you run this as administrator and in audit mode.
echo V1.2.0
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
if %errorlevel% EQU 0 (cscript //nologo slmgr.vbs /ipk NPPR9-FWDCX-D2C8J-H872K-2YT43 >nul||cscript //nologo slmgr.vbs /ipk DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4 >nul||cscript //nologo slmgr.vbs /ipk YYVX9-NTFWV-6MDM3-9PT4T-4M68B >nul||cscript //nologo slmgr.vbs /ipk 44RPN-FTY23-9VTTB-MP9BX-T84FV >nul||cscript //nologo slmgr.vbs /ipk WNMTR-4C88C-JK8YV-HQ7T2-76DF9 >nul||cscript //nologo slmgr.vbs /ipk 2F77B-TNFGY-69QQF-B8YKP-D69TJ >nul||cscript //nologo slmgr.vbs /ipk DCPHK-NFMTC-H88MJ-PFHPY-QJ4BJ >nul||cscript //nologo slmgr.vbs /ipk QFFDN-GRT3P-VKWWX-X7T3R-8B639 >nul||cscript //nologo slmgr.vbs /ipk M7XTQ-FN8P6-TTKYV-9D4CC-J462D >nul||cscript //nologo slmgr.vbs /ipk 92NFX-8DJQP-P6BBQ-THF9C-7CG2H >nul&goto skms) else wmic os | findstr /I "home" >nul
if %errorlevel% EQU 0 (cscript //nologo slmgr.vbs /ipk TX9XD-98N7V-6WMQ6-BX7FG-H8Q99 >nul||cscript //nologo slmgr.vbs /ipk 3KHY7-WNT83-DGQKR-F7HPR-844BM >nul||cscript //nologo slmgr.vbs /ipk 7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH >nul||cscript //nologo slmgr.vbs /ipk PVMJN-6DFY6-9CCP6-7BKTT-D3WVR >nul&goto skms) else wmic os | findstr /I "education" >nul
if %errorlevel% EQU 0 (cscript //nologo slmgr.vbs /ipk NW6C2-QMPVW-D7KKK-3GKT6-VCFB2 >nul||cscript //nologo slmgr.vbs /ipk 2WH4N-8QGBV-H22JP-CT43Q-MDWWJ >nul&goto skms) else wmic os | findstr /I "10 pro" >nul
if %errorlevel% EQU 0 (cscript //nologo slmgr.vbs /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX >nul||cscript //nologo slmgr.vbs /ipk MH37W-N47XK-V7XM9-C7227-GCQG9 >nul||cscript //nologo slmgr.vbs /ipk NRG8B-VKK3Q-CXVCJ-9G2XF-6Q84J >nul||cscript //nologo slmgr.vbs /ipk 9FNHH-K3HBT-3W4TD-6383H-6XYWF >nul||cscript //nologo slmgr.vbs /ipk 6TP4R-GNPTD-KYYHQ-7B7DP-J447Y >nul||cscript //nologo slmgr.vbs /ipk YVWGF-BXNMC-HTQYQ-CPQ99-66QFC >nul&goto skms) else (goto notsupported)
:skms
if %i% GTR 10 goto busy
if %i% EQU 1 set KMS=kms7.MSGuides.com
if %i% EQU 2 set KMS=s8.uk.to
if %i% EQU 3 set KMS=s9.us.to
if %i% GTR 3 goto ato
cscript //nologo slmgr.vbs /skms %KMS%:1688 >nul
:ato
echo Done Activating Windows!
cls
echo -------------------------------------------------------------------------
echo Done! Would you like to restart?
set /p restart?=Please press Y or N: 
If /I "%Srestart?%"=="Y" goto restart
:restart
shutdown /r
:no
pause
