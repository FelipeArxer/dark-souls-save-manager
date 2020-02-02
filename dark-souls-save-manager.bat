@echo off
title Dark Souls Save Manager
color 0B

set backup-location="%systemdrive%\Backup"

:main-menu
cls 
echo Warning: The backup folder is %backup-location%.
echo.
echo ==================================
echo *          Dark Souls 2          *
echo ==================================
echo * 1. Save To Backup              *
echo * 2. Backup To Save              *
echo * 3. Delete Save                 *
echo * 4. Delete Backup               *
echo ==================================
echo *          Dark Souls 3          *
echo ==================================
echo * 5. Save To Backup              *
echo * 6. Backup To Save              *
echo * 7. Delete Save                 *
echo * 8. Delete Backup               *
echo ==================================
echo * 9. Exit                        *
echo ==================================
echo.

set /p choice= Choose an option: 
if %choice% equ 1 goto number1
if %choice% equ 2 goto number2
if %choice% equ 3 goto number3
if %choice% equ 4 goto number4
if %choice% equ 5 goto number5
if %choice% equ 6 goto number6
if %choice% equ 7 goto number7
if %choice% equ 8 goto number8
if %choice% equ 9 goto :eof

:: DARK SOULS 2
:number1
cls
if exist "%appdata%\DarkSoulsII" (
    xcopy "%appdata%\DarkSoulsII\*.*" "%backup-location%\DarkSouls2" /s /y /i > nul
    goto complete
 ) else (
    goto not-exist
)

:number2
cls
if exist "%backup-location%\DarkSouls2" (
    xcopy "%backup-location%\DarkSouls2\*.*" "%appdata%\DarkSoulsII" /s /y /i > nul
    goto complete
) else (
    goto not-exist
)

:number3
cls
if exist "%appdata%\DarkSoulsII" (
    rd "%appdata%\DarkSoulsII" /s /q
    goto complete
) else (
    goto not-exist
)

:number4
cls
if exist "%backup-location%\DarkSouls2" (
    rd "%backup-location%\DarkSouls2" /s /q
    goto complete
) else (
    goto not-exist
)

:: DARK SOULS 3
:number5
cls
if exist "%appdata%\DarkSoulsIII" (
    xcopy "%appdata%\DarkSoulsIII\*.*" "%backup-location%\DarkSouls3" /s /y /i > nul
    goto complete
 ) else (
    goto not-exist
)

:number6
cls
if exist "%backup-location%\DarkSouls3" (
    xcopy "%backup-location%\DarkSouls3\*.*" "%appdata%\DarkSoulsIII" /s /y /i > nul
    goto complete
) else (
    goto not-exist
)

:number7
cls
if exist "%appdata%\DarkSoulsIII" (
    rd "%appdata%\DarkSoulsIII" /s /q
    goto complete
) else (
    goto not-exist
)

:number8
cls
if exist "%backup-location%\DarkSouls3" (
    rd "%backup-location%\DarkSouls3" /s /q
    goto complete
) else (
    goto not-exist
)

:not-exist
echo ==================================
echo *         File not exist         *
echo ==================================
echo.
pause
goto main-menu

:complete
echo ==================================
echo *            Complete            *
echo ==================================
echo.
pause
goto main-menu