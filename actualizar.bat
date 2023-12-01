@echo off
setlocal enabledelayedexpansion
.\PortableGit\cmd\git add .
.\PortableGit\cmd\git reset --hard
.\PortableGit\cmd\git pull --rebase
echo Done!
pause