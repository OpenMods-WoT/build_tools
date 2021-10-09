@echo off
py -2 build_tools/packer.py -q -v build_data/GAME_VERSION build_data/archives/ build/archives/
where /Q "BCompare.exe"
if ERRORLEVEL 1 (
    echo Beyond Compare not found on PATH, skipping...
    goto not_found
)
where /Q "build_data:release_targets.txt"
if ERRORLEVEL 1 (
    echo Release targets not found, skipping...
    goto not_found
)
echo Launching Beyond Compare...
for /F "tokens=*" %%A in (build_data\release_targets.txt) do (start "" "BCompare.exe" build\archives\ "%%A")
:not_found
echo Exiting.
pause
exit /b
