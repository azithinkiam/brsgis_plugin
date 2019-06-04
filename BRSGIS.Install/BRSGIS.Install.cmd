@echo off
rem Root OSGEO4W home dir to the same directory this script exists in
call "%~dp0\bin\o4w_env.bat"
call "%~dp0\bin\py3_env.bat"
python -m pip install --upgrade pip
python "%~dp0BRSGIS.Install.py"
@echo.
@echo INSTALLATION COMPLETE for %username%.
pause
exit
