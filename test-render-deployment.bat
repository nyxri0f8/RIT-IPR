@echo off
echo 🔍 Testing Render Deployment
echo ============================
echo.

if "%1"=="" (
    echo Usage: test-render-deployment.bat YOUR_RENDER_URL
    echo Example: test-render-deployment.bat https://rit-ipr-app.onrender.com
    pause
    exit /b 1
)

set RENDER_URL=%1

echo Testing Render deployment at: %RENDER_URL%
echo.

echo 1. Testing Frontend (Root URL)...
echo    URL: %RENDER_URL%/
curl -s -I "%RENDER_URL%/" | findstr "HTTP\|content-type"
echo.

echo 2. Testing API Health Check...
echo    URL: %RENDER_URL%/api/health
curl -s "%RENDER_URL%/api/health"
echo.
echo.

echo 3. Testing Login Endpoint...
echo    URL: %RENDER_URL%/api/auth/login
curl -s -X POST "%RENDER_URL%/api/auth/login" -H "Content-Type: application/json" -d "{\"email\":\"test@test.com\",\"password\":\"test123\"}"
echo.
echo.

echo ============================
echo 📊 RESULTS ANALYSIS:
echo.
echo ✅ SUCCESS INDICATORS:
echo   - Frontend: HTTP 200 + content-type: text/html
echo   - API Health: JSON with "status":"ok"
echo   - Login: JSON error (not 405)
echo.
echo ❌ FAILURE INDICATORS:
echo   - 404 errors
echo   - HTML responses from API endpoints
echo   - 405 Method Not Allowed errors
echo.
pause