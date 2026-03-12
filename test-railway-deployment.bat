@echo off
echo 🚂 Testing Railway Deployment
echo ==============================
echo.

if "%1"=="" (
    echo Usage: test-railway-deployment.bat YOUR_RAILWAY_URL
    echo Example: test-railway-deployment.bat https://rit-ipr-app.up.railway.app
    echo.
    echo Or get your URL with: railway status
    pause
    exit /b 1
)

set RAILWAY_URL=%1

echo Testing Railway deployment at: %RAILWAY_URL%
echo.

echo 1. Testing Frontend (Root URL)...
echo    URL: %RAILWAY_URL%/
curl -s -I "%RAILWAY_URL%/" | findstr "HTTP\|content-type"
if %errorlevel% equ 0 (
    echo    ✅ Frontend responding
) else (
    echo    ❌ Frontend not responding
)
echo.

echo 2. Testing API Health Check...
echo    URL: %RAILWAY_URL%/api/health
curl -s "%RAILWAY_URL%/api/health"
echo.
if %errorlevel% equ 0 (
    echo    ✅ API Health endpoint responding
) else (
    echo    ❌ API Health endpoint failed
)
echo.

echo 3. Testing Login Endpoint...
echo    URL: %RAILWAY_URL%/api/auth/login
curl -s -X POST "%RAILWAY_URL%/api/auth/login" -H "Content-Type: application/json" -d "{\"email\":\"test@test.com\",\"password\":\"test123\"}"
echo.
echo.

echo 4. Testing Gemini Key Endpoint...
echo    URL: %RAILWAY_URL%/api/gemini-key
curl -s "%RAILWAY_URL%/api/gemini-key"
echo.
echo.

echo ==============================
echo 📊 DEPLOYMENT ANALYSIS:
echo.
echo ✅ SUCCESS INDICATORS:
echo   - Frontend: HTTP 200 + HTML content
echo   - API Health: JSON with "status":"ok"
echo   - Login: JSON error response (not 405)
echo   - Gemini: JSON with apiKey (or error)
echo.
echo ❌ FAILURE INDICATORS:
echo   - 404 Not Found errors
echo   - 405 Method Not Allowed
echo   - HTML responses from API endpoints
echo   - Connection timeouts
echo.
echo 🔧 IF ISSUES FOUND:
echo   1. Check Railway deployment logs
echo   2. Verify environment variables are set
echo   3. Ensure build completed successfully
echo   4. Check server startup in Railway dashboard
echo.
pause