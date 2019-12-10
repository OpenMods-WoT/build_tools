@echo off
:::git checkout develop
py -2 source/scripts/compile/compiler.py -p PJOrion/PJOrion -d scripts/client/ -o build/scripts/client/ source/scripts/client/
py -2 source/scripts/compile/packer.py -q -v build_data/GAME_VERSION.conf build_data/wotmods/ build/wotmods/
echo Launching Beyond Compare...
set /p ver=<build_data\GAME_VERSION.conf
"BCompare.exe" build\wotmods\ "D:\Games\World_of_Tanks\mods\%ver%\" /solo
echo Exiting.
pause
exit
