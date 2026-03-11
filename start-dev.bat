@echo off
REM RIT IPR Portal - Development Startup Script for Windows

echo ╔═══════════════════════════════════════════╗
echo ║   🚀 Starting RIT IPR Portal              ║
echo ╚═══════════════════════════════════════════╝
echo.

REM Check if server directory exists
if not exist "server" (
    echo ❌ Error: server directory not found
    exit /b 1
)

REM Check if node_modules exists in server
if not exist "server\node_modules" (
    echo 📦 Installing backend dependencies...
    cd server
    call npm install
    cd ..
)

REM Check if node_modules exists in root
if not exist "node_modules" (
    echo 📦 Installing frontend dependencies...
    call npm install
)

REM Check if .env exists in server
if not exist "server\.env" (
    echo ⚙️  Creating backend .env file...
    copy server\.env.example server\.env
)

REM Check if .env exists in root
if not exist ".env" (
    echo ⚙️  Creating frontend .env file...
    copy .env.example .env
)

echo.
echo ✅ Setup complete!
echo.
echo Starting servers...
echo   - Backend: http://localhost:5000
echo   - Frontend: http://localhost:5173
echo.
echo Press Ctrl+C to stop both servers
echo.

REM Start backend in new window
start "RIT IPR Backend" cmd /k "cd server && npm run dev"

REM Wait a bit for backend to start
timeout /t 3 /nobreak > nul

REM Start frontend in new window
start "RIT IPR Frontend" cmd /k "npm run dev"

echo.
echo ✅ Both servers started in separate windows
echo.
pause
