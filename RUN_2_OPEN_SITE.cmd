@echo off
setlocal EnableExtensions
pushd "%~dp0"
if exist "index_standalone.html" (
  start "" "%~dp0index_standalone.html"
) else (
  start "" "%~dp0index.html"
)
popd
exit /b 0
