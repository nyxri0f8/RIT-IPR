@echo off
echo 🚂 Railway Deployment Script
echo ============================
echo.

echo Checking Railway CLI installation...
railway --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Railway CLI not found!
    echo.
    echo Installing Railway CLI...
    npm install -g @railway/cli
    if %errorlevel% neq 0 (
        echo ❌ Failed to install Railway CLI
        echo Please install manually: npm install -g @railway/cli
        pause
        exit /b 1
    )
    echo ✅ Railway CLI installed successfully!
)

echo ✅ Railway CLI found
echo.

echo Checking if logged in to Railway...
railway whoami >nul 2>&1
if %errorlevel% neq 0 (
    echo 🔐 Not logged in to Railway
    echo Opening browser for authentication...
    railway login
    if %errorlevel% neq 0 (
        echo ❌ Login failed
        pause
        exit /b 1
    )
)

echo ✅ Logged in to Railway
echo.

echo Building frontend...
call npm run build
if %errorlevel% neq 0 (
    echo ❌ Frontend build failed!
    pause
    exit /b 1
)
echo ✅ Frontend built successfully
echo.

echo Installing backend dependencies...
cd server
call npm install
if %errorlevel% neq 0 (
    echo ❌ Backend dependencies failed!
    pause
    exit /b 1
)
cd ..
echo ✅ Backend dependencies installed
echo.

echo Checking for existing Railway project...
railway status >nul 2>&1
if %errorlevel% neq 0 (
    echo 🆕 No Railway project found, initializing new project...
    railway init
    if %errorlevel% neq 0 (
        echo ❌ Failed to initialize Railway project
        pause
        exit /b 1
    )
    echo ✅ Railway project initialized
) else (
    echo ✅ Railway project already linked
)
echo.

echo 🚀 Deploying to Railway...
railway up
if %errorlevel% neq 0 (
    echo ❌ Deployment failed!
    echo Check the error messages above
    pause
    exit /b 1
)

echo.
echo ✅ Deployment successful!
echo.

echo Getting deployment URL...
railway status
echo.

echo 📋 NEXT STEPS:
echo 1. Set environment variables in Railway dashboard:
echo    - JWT_SECRET=your-secret-key
echo    - GEMINI_API_KEYS=your,api,keys
echo    - NODE_ENV=production
echo.
echo 2. Test your deployment:
echo    - Visit the URL shown above
echo    - Try registering/logging in
echo    - Create a patent application
echo.
echo 3. Monitor your deployment:
echo    - railway logs (view logs)
echo    - railway open (open in browser)
echo.
echo 🎉 Your app is now live on Railway!
pause