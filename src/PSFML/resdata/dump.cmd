@echo off
cd /d %~dp0

call tdump PSFML.dll > PSFML.dll.txt
call PSFML.dll.txt
