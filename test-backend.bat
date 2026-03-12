@echo off
echo 🔍 Testing Railway Backend Deployment
echo ========================================
echo.

set BACKEND_URL=https://rit-ipr-production.up.railway.app

echo 1. Testing Root URL (should NOT return HTML)
echo    URL: %BACKEND_URL%/
curl -s -I "%BACKEND_URL%/" | findstr "content-type"
echo.

echo 2. Testing Health Endpoint
echo    URL: %BACKEND_URL%/api/health
curl -s "%BACKEND_URL%/api/health"
echo.
echo.

echo 3. Testing Login Endpoint (should return JSON, not 405)
echo    URL: %BACKEND_URL%/api/auth/login
curl -s -X POST "%BACKEND_URL%/api/auth/login" -H "Content-Type: application/json" -d "{\"email\":\"test@test.com\",\"password\":\"test123\"}"
echo.
echo.

echo ========================================
echo.
echo 📊 DIAGNOSIS:
echo.
echo If you see HTML or 405 errors:
echo   ❌ Railway is serving FRONTEND, not BACKEND
echo   ✅ Solution: See RAILWAY_BACKEND_FIX.md
echo.
echo If you see JSON responses:
echo   ✅ Backend is correctly deployed!
echo.
pause
