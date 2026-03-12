@echo off
echo 🚨 FIXING RAILWAY DEPLOYMENT
echo ============================
echo.

echo Current issue: Railway serving frontend HTML instead of backend API
echo Solution: Redeploy with correct configuration
echo.

echo 1. Checking Railway CLI...
railway --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Installing Railway CLI...
    npm install -g @railway/cli
)

echo 2. Logging in to Railway...
railway login

echo 3. Checking current deployment...
echo Testing current API endpoint...
curl -s https://rit-ipr-production.up.railway.app/api/health
echo.
echo ☝️ If you see HTML above (not JSON), Railway is serving frontend!
echo.

echo 4. Pushing latest configuration...
git add .
git commit -m "Fix Railway deployment - serve backend API"
git push origin main

echo 5. Linking to Railway project...
railway link

echo 6. Redeploying with correct configuration...
railway up --detach

echo.
echo ✅ Redeployment initiated!
echo.
echo 📋 NEXT STEPS:
echo 1. Wait 2-3 minutes for deployment to complete
echo 2. Check Railway dashboard for build logs
echo 3. Test: https://rit-ipr-production.up.railway.app/api/health
echo    Should return JSON: {"status":"ok",...}
echo    NOT HTML: <!DOCTYPE html>
echo.
echo 4. If still HTML, go to Railway Dashboard:
echo    - Settings → Build Command: npm install ^&^& npm run build ^&^& cd server ^&^& npm install
echo    - Settings → Start Command: cd server ^&^& node server.js
echo    - Then redeploy manually
echo.
echo 🎯 SUCCESS = API returns JSON, login works, no 405 errors!
pause