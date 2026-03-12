@echo off
echo 🚀 Building Unified Frontend + Backend Deployment
echo ================================================
echo.

echo 1. Building frontend...
call npm run build
if %errorlevel% neq 0 (
    echo ❌ Frontend build failed!
    pause
    exit /b 1
)
echo ✅ Frontend built successfully!
echo.

echo 2. Installing backend dependencies...
cd server
call npm install
if %errorlevel% neq 0 (
    echo ❌ Backend dependencies failed!
    pause
    exit /b 1
)
echo ✅ Backend dependencies installed!
cd ..
echo.

echo 3. Testing unified server locally...
echo Starting server on http://localhost:5000
echo Press Ctrl+C to stop and continue with deployment
cd server
start /B node server.js
timeout /t 3 /nobreak >nul
echo.

echo 4. Testing endpoints...
curl -s http://localhost:5000/api/health
echo.
echo.

echo ✅ Ready for deployment!
echo.
echo Next steps:
echo 1. Push to GitHub
echo 2. Deploy to Railway/Render
echo 3. Set environment variables
echo.
pause