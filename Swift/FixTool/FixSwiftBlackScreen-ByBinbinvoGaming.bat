@echo off
set "yellow=[33m"
set "green=[1;32m"
set "red=[1;31m"
set "reset_color=[0m"
set "path1=%localappdata%\Bloxstrap\Bloxstrap.exe"
set "path2=%localappdata%\Bloxstrap\Roblox\Player\RobloxPlayerBeta.exe"
if not exist "%path1%" (
    echo %red%Bloxstrap.exe not found at the specified path.
	echo Install the latest Bloxstrap and try again.%reset_color%
	echo Press any key to exit...
	pause >nul
    exit /b 1
)
if not exist "%path2%" (
    echo %red%RobloxPlayerBeta.exe not found at the specified path.
	echo Launch Roblox through Bloxstrap and try again.%reset_color%
	echo Press any key to exit...
	pause >nul
    exit /b 2
)
reg add "HKCU\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%path1%" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE" /f
reg add "HKCU\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%path2%" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE" /f
cls
echo Swift Fix Black Screen Made By BinbinvoGaming
echo Fixing Erorrs...
timeout /t 5 >nul
echo %yellow%[WARNING]: JOIN MY DISCORD SERVER TO GET NEW UPDATE:https://discord.gg/xFZHte86EH%reset_color%
echo %green%Black screen hopefully fixed, try injecting Swift.%reset_color%
echo Press any key to exit...
pause >nul
exit /b 0
set "roblox_dir=%localappdata%\Roblox\Versions"
if not exist "%roblox_dir%" (
    echo Roblox directory not found.
    pause
    exit /b
)
for /d %%d in ("%roblox_dir%\*") do (
    if exist "%%d\RobloxPlayerBeta.exe" (
        reg add "HKCU\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%%d\RobloxPlayerBeta.exe" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE" /f
        if %errorlevel% neq 0 (
            echo Failed to modify compatibility settings for %%d\RobloxPlayerBeta.exe.
        ) else (
            echo Fullscreen optimizations disabled for %%d\RobloxPlayerBeta.exe.
        )
    ) else (
        echo RobloxPlayerBeta.exe not found in %%d.
    )
)
echo All versions processed.
pause