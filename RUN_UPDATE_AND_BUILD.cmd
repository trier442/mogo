@echo off
chcp 65001 > nul
cd /d "%~dp0"
where py >nul 2>nul
if %errorlevel%==0 (set PY=py) else (set PY=python)
%PY% -m pip install requests beautifulsoup4 lxml
%PY% scripts\extract_horaeng_links.py --max-pages 40 --delay 0.7
echo After collection, rebuild pages using scripts/build_analysis_pages.py or ask ChatGPT to regenerate the package.
pause
