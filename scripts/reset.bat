@echo off
setlocal

echo Resetting database (will remove data)

docker compose down -v
if %errorlevel% neq 0 (
    echo Failed during shutdown.
    exit /b %errorlevel%
)

docker compose up -d
if %errorlevel% neq 0 (
    echo Failed during startup.
    exit /b %errorlevel%
)
echo.
echo Database reset complete.
endlocal
