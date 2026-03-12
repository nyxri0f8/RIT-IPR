#!/bin/bash

echo "🔍 RIT IPR Production Verification Script"
echo "=========================================="
echo ""

# Check .env file
echo "1. Checking .env configuration..."
if [ -f .env ]; then
    echo "   ✅ .env file exists"
    if grep -q "VITE_API_URL=https://" .env; then
        BACKEND_URL=$(grep VITE_API_URL .env | cut -d '=' -f2)
        echo "   ✅ Backend URL configured: $BACKEND_URL"
    else
        echo "   ❌ Backend URL not set to HTTPS"
        exit 1
    fi
else
    echo "   ❌ .env file not found!"
    exit 1
fi

echo ""
echo "2. Testing backend health..."
HEALTH_URL="${BACKEND_URL}/health"
HEALTH_URL="${HEALTH_URL//\/api\/health/\/health}"  # Remove duplicate /api if present
HEALTH_URL="${HEALTH_URL//\/api/}"  # Clean URL
HEALTH_URL="${HEALTH_URL%/}/api/health"  # Add /api/health properly

echo "   Testing: $HEALTH_URL"
RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" "$HEALTH_URL" 2>/dev/null)

if [ "$RESPONSE" = "200" ]; then
    echo "   ✅ Backend is responding (HTTP $RESPONSE)"
else
    echo "   ❌ Backend not responding (HTTP $RESPONSE)"
    echo "   Please check if backend is deployed and running"
fi

echo ""
echo "3. Checking for hardcoded localhost..."
if grep -r "localhost:5000" src/ 2>/dev/null | grep -v "node_modules"; then
    echo "   ❌ Found hardcoded localhost URLs!"
    grep -r "localhost:5000" src/ | grep -v "node_modules"
else
    echo "   ✅ No hardcoded localhost URLs found"
fi

echo ""
echo "4. Checking API configuration..."
if grep -q "const API_URL = import.meta.env.VITE_API_URL;" src/api.js; then
    echo "   ✅ API URL properly configured (no fallback)"
else
    echo "   ⚠️  API URL might have fallback - check src/api.js"
fi

echo ""
echo "=========================================="
echo "✅ Verification complete!"
echo ""
echo "Next steps:"
echo "1. Run: npm run build"
echo "2. Deploy to Netlify/Vercel"
echo "3. Set VITE_API_URL in hosting platform"
echo "4. Test login/register on production site"
