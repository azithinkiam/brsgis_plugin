@echo off
cd "Z:\0 - Settings\Programs\GIS"
@echo INSTALLING QGIS 3.0.2 (Girona) w/ BRSGIS_plugin (LAN) - if already installed, please cancel when prompted.
@echo.
@echo NOTE: Administrative rights are required for installation.
@echo.
rem QGIS-OSGeo4W-3.0.2-1-Setup-x86_64.exe
xcopy "Z:\0 - Settings\GIS\QGIS\Plugins\BRSGIS.Install\BRSGIS.Install.*" "C:\Program Files\QGIS 3.0\" /y
c:
cd\
cd "C:\Program Files\QGIS 3.0"
call BRSGIS.Install.cmd

