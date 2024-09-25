@echo off
cd /d %~dp0
call brcc32.exe "resdata.rc" -v -fo..\..\..\lib\PSFML.Ext.res
