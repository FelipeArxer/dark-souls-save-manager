@echo off
title Dark Souls SaveManager
color 0B

set backup-path="%systemdrive%\_DarkSoulsBackup"

:main-menu
cls 
echo Warning: The backup folder is %backup-path%.
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
if %choice% equ 1 goto choice1
if %choice% equ 2 goto choice2
if %choice% equ 3 goto choice3
if %choice% equ 4 goto choice4
if %choice% equ 5 goto choice5
if %choice% equ 6 goto choice6
if %choice% equ 7 goto choice7
if %choice% equ 8 goto choice8
if %choice% equ 9 goto :eof

goto main-menu

:: DARK SOULS 2
:choice1
cls
if exist "%appdata%\DarkSoulsII" (
    xcopy "%appdata%\DarkSoulsII\*.*" "%backup-path%\DarkSouls2" /s /y /i > nul
    goto complete
 ) else (
    goto not-exist
)

:choice2
cls
if exist "%backup-path%\DarkSouls2" (
    xcopy "%backup-path%\DarkSouls2\*.*" "%appdata%\DarkSoulsII" /s /y /i > nul
    goto complete
) else (
    goto not-exist
)

:choice3
cls
if exist "%appdata%\DarkSoulsII" (
    rd "%appdata%\DarkSoulsII" /s /q > nul
    goto complete
) else (
    goto not-exist
)

:choice4
cls
if exist "%backup-path%\DarkSouls2" (
    rd "%backup-path%\DarkSouls2" /s /q > nul
    goto complete
) else (
    goto not-exist
)

:: DARK SOULS 3
:choice5
cls
if exist "%appdata%\DarkSoulsIII" (
    xcopy "%appdata%\DarkSoulsIII\*.*" "%backup-path%\DarkSouls3" /s /y /i > nul
    goto complete
 ) else (
    goto not-exist
)

:choice6
cls
if exist "%backup-path%\DarkSouls3" (
    xcopy "%backup-path%\DarkSouls3\*.*" "%appdata%\DarkSoulsIII" /s /y /i > nul
    goto complete
) else (
    goto not-exist
)

:choice7
cls
if exist "%appdata%\DarkSoulsIII" (
    rd "%appdata%\DarkSoulsIII" /s /q > nul
    goto complete
) else (
    goto not-exist
)

:choice8
cls
if exist "%backup-path%\DarkSouls3" (
    rd "%backup-path%\DarkSouls3" /s /q > nul
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
