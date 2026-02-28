@echo off
setlocal

docker compose down
if %errorlevel% neq 0 (
    echo Failed to stop containers.
    exit /b %errorlevel%
)
echo.
echo PostgreSQL container stopped.
endlocal
