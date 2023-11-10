@echo off
setlocal enabledelayedexpansion

set "repositoryName=programas-tracasa"
set "desktopPath=%USERPROFILE%\Desktop"
set "repositoryPath=%desktopPath%\%repositoryName%"

if not exist "%repositoryPath%" (
    echo Cloning %repositoryName% into %desktopPath%...
    .\PortableGit\cmd\git clone https://github.com/Tracasa-Dev/programas-tracasa.git "%repositoryPath%"
    if errorlevel 1 (
        echo Cloning failed. Check your internet connection and try again.
        pause
        exit /b 1
    )
    echo Cloning successful!
    pause
) else (
    echo %repositoryName% already exists on the desktop.
    pause
)

cd "%repositoryPath%"

echo Hide all files and folders 
for /f "delims=" %%i in ('dir /b /a-d') do (
	attrib +h "%%i"
)
for /d %%i in (*) do (
	attrib +h "%%i"
)
echo Unhide .exe files
for %%i in (*.exe) do (
	attrib -h "%%i"
)

attrib -h actualizar.bat

echo Done!
pause
endlocal