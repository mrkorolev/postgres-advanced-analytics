@echo off
setlocal

docker compose up -d
if %errorlevel% neq 0 (
    echo.
    echo Failed to start containers.
    exit /b %errorlevel%
)
echo.
echo To view logs: docker logs -f pg-analytics
endlocal
