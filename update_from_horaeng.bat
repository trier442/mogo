@echo off
setlocal EnableExtensions
chcp 65001 >nul

REM Move to the folder where this cmd file is located.
pushd "%~dp0"

REM Find Python. Try py launcher first, then python.
set "PY="
where py >nul 2>nul
if not errorlevel 1 set "PY=py -3"
if not defined PY (
  where python >nul 2>nul
  if not errorlevel 1 set "PY=python"
)

if not defined PY (
  echo.
  echo Python was not found on this computer.
  echo Install Python first. Make sure to check "Add python.exe to PATH" during installation.
  echo Opening the Python download page...
  start "" "https://www.python.org/downloads/windows/"
  echo.
  pause
  popd
  exit /b 1
)

echo.
echo [1/3] Installing required Python packages...
%PY% -m pip install --user requests beautifulsoup4 lxml
if errorlevel 1 (
  echo.
  echo Package installation failed.
  pause
  popd
  exit /b 1
)

echo.
echo [2/3] Extracting PDF links from the exam pages...
%PY% scripts\extract_horaeng_links.py --delay 0.8 --max-pages 40
if errorlevel 1 (
  echo.
  echo Link extraction failed.
  pause
  popd
  exit /b 1
)

echo.
echo [3/3] Done.
echo Open index_standalone.html to view the updated site.
echo.
start "" "%~dp0index_standalone.html"
pause
popd
exit /b 0
