@echo off
echo 🔍 RIT IPR Production Verification Script
echo ==========================================
echo.

REM Check .env file
echo 1. Checking .env configuration...
if exist .env (
    echo    ✅ .env file exists
    findstr /C:"VITE_API_URL=https://" .env >nul
    if %errorlevel% equ 0 (
        for /f "tokens=2 delims==" %%a in ('findstr "VITE_API_URL" .env') do set BACKEND_URL=%%a
        echo    ✅ Backend URL configured: %BACKEND_URL%
    ) else (
        echo    ❌ Backend URL not set to HTTPS
        exit /b 1
    )
) else (
    echo    ❌ .env file not found!
    exit /b 1
)

echo.
echo 2. Testing backend health...
echo    Testing: %BACKEND_URL%/health
curl -s -o nul -w "HTTP %%{http_code}" "%BACKEND_URL%/health"
echo.

echo.
echo 3. Checking for hardcoded localhost...
findstr /S /C:"localhost:5000" src\*.* 2>nul
if %errorlevel% equ 0 (
    echo    ❌ Found hardcoded localhost URLs!
) else (
    echo    ✅ No hardcoded localhost URLs found
)

echo.
echo 4. Checking API configuration...
findstr /C:"const API_URL = import.meta.env.VITE_API_URL;" src\api.js >nul
if %errorlevel% equ 0 (
    echo    ✅ API URL properly configured (no fallback)
) else (
    echo    ⚠️  API URL might have fallback - check src\api.js
)

echo.
echo ==========================================
echo ✅ Verification complete!
echo.
echo Next steps:
echo 1. Run: npm run build
echo 2. Deploy to Netlify/Vercel
echo 3. Set VITE_API_URL in hosting platform
echo 4. Test login/register on production site
