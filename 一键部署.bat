@echo off
setlocal
cd /d "%~dp0"

echo ==========================================
echo        Starting Auto Deploy...
echo ==========================================
echo.

echo [1/3] Cleaning (hexo clean)...
call npx hexo clean
if %errorlevel% neq 0 (
    echo [ERROR] Clean failed!
    pause
    exit /b %errorlevel%
)
echo.

echo [2/3] Generating (hexo generate)...
call npx hexo generate
if %errorlevel% neq 0 (
    echo [ERROR] Generate failed!
    pause
    exit /b %errorlevel%
)
echo.

echo [3/3] Deploying (hexo deploy)...
call npx hexo deploy
if %errorlevel% neq 0 (
    echo [ERROR] Deploy failed! Please check network.
    pause
    exit /b %errorlevel%
)

echo.
echo ==========================================
echo        SUCCESS! Blog is live.
echo ==========================================
echo.
pause
