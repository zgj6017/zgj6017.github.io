@echo off
chcp 65001 >nul
title 博客一键部署工具
cd /d "%~dp0"

echo ==========================================
echo        正在开始自动部署博客...
echo ==========================================
echo.

echo [1/3] 清理旧文件 (hexo clean)...
call npx hexo clean
if %errorlevel% neq 0 (
    echo [错误] 清理失败！
    pause
    exit /b %errorlevel%
)
echo.

echo [2/3] 生成新页面 (hexo generate)...
call npx hexo generate
if %errorlevel% neq 0 (
    echo [错误] 生成失败！
    pause
    exit /b %errorlevel%
)
echo.

echo [3/3] 推送到 GitHub (hexo deploy)...
call npx hexo deploy
if %errorlevel% neq 0 (
    echo [错误] 推送失败！请检查网络或配置。
    pause
    exit /b %errorlevel%
)

echo.
echo ==========================================
echo        恭喜！博客已成功部署到线上
echo ==========================================
echo.
pause
