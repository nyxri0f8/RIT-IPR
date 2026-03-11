#!/bin/bash

# RIT IPR Portal - Development Startup Script

echo "╔═══════════════════════════════════════════╗"
echo "║   🚀 Starting RIT IPR Portal              ║"
echo "╚═══════════════════════════════════════════╝"
echo ""

# Check if server directory exists
if [ ! -d "server" ]; then
    echo "❌ Error: server directory not found"
    exit 1
fi

# Check if node_modules exists in server
if [ ! -d "server/node_modules" ]; then
    echo "📦 Installing backend dependencies..."
    cd server && npm install && cd ..
fi

# Check if node_modules exists in root
if [ ! -d "node_modules" ]; then
    echo "📦 Installing frontend dependencies..."
    npm install
fi

# Check if .env exists in server
if [ ! -f "server/.env" ]; then
    echo "⚙️  Creating backend .env file..."
    cp server/.env.example server/.env
fi

# Check if .env exists in root
if [ ! -f ".env" ]; then
    echo "⚙️  Creating frontend .env file..."
    cp .env.example .env
fi

echo ""
echo "✅ Setup complete!"
echo ""
echo "Starting servers..."
echo "  - Backend: http://localhost:5000"
echo "  - Frontend: http://localhost:5173"
echo ""
echo "Press Ctrl+C to stop both servers"
echo ""

# Start backend in background
cd server && npm run dev &
BACKEND_PID=$!

# Wait a bit for backend to start
sleep 2

# Start frontend
cd .. && npm run dev &
FRONTEND_PID=$!

# Wait for both processes
wait $BACKEND_PID $FRONTEND_PID
