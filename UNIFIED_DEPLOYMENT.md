# 🚀 Unified Frontend + Backend Deployment

## 🎯 SETUP COMPLETE

Your application is now configured to run both frontend and backend from a single server!

### What Changed:

1. **Backend serves frontend files** - Added static file serving to `server/server.js`
2. **API uses relative paths** - Frontend calls `/api/*` instead of full URLs
3. **Single deployment** - One Railway/Render service hosts everything

---

## 📁 DEPLOYMENT STRUCTURE

```
Your Railway/Render Deployment:
├── Frontend (served from /dist)
│   ├── index.html
│   ├── assets/
│   └── Static files
└── Backend API (Node.js server)
    ├── /api/auth/login
    ├── /api/auth/register
    ├── /api/patents
    ├── /api/health
    └── All other API routes
```

**Single URL serves everything:**
- `https://your-app.railway.app/` → Frontend (React app)
- `https://your-app.railway.app/api/health` → Backend API
- `https://your-app.railway.app/api/auth/login` → Backend API

---

## 🔧 BUILD & DEPLOY STEPS

### Step 1: Build Everything
```bash
# Run the build script
build-and-deploy.bat

# Or manually:
npm run build          # Builds frontend to /dist
cd server && npm install  # Install backend deps
```

### Step 2: Deploy to Railway

**Option A: Railway CLI**
```bash
railway login
railway init
railway up
```

**Option B: Railway Dashboard**
1. Connect your GitHub repository
2. **Root Directory:** Leave empty (use root)
3. **Build Command:** `npm run build && cd server && npm install`
4. **Start Command:** `cd server && node server.js`

### Step 3: Set Environment Variables

On Railway Dashboard → Variables:
```env
PORT=5000
NODE_ENV=production
JWT_SECRET=your-super-secret-jwt-key-change-this
GEMINI_API_KEYS=key1,key2,key3,key4,key5,key6,key7,key8,key9,key10
```

### Step 4: Deploy!

Railway will:
1. Build your frontend (`npm run build`)
2. Install backend dependencies
3. Start the server (`node server.js`)
4. Serve frontend at root URL
5. Serve API at `/api/*` routes

---

## 🧪 TESTING

### Test Locally First
```bash
# Build and test
build-and-deploy.bat

# Or manually:
npm run build
cd server
node server.js
```

Visit: `http://localhost:5000`
- Should show your React app
- API calls should work (login/register)

### Test Production
After deploying to Railway:

1. **Frontend Test:**
   - Visit: `https://your-app.railway.app/`
   - Should load React app

2. **API Test:**
   - Visit: `https://your-app.railway.app/api/health`
   - Should return JSON: `{"status":"ok",...}`

3. **Integration Test:**
   - Try login/register from frontend
   - Check browser Network tab
   - API calls should go to `/api/*` (relative)

---

## 📋 DEPLOYMENT PLATFORMS

### Railway (Recommended)
```bash
railway login
railway init
railway up
```

**Settings:**
- Build Command: `npm run build && cd server && npm install`
- Start Command: `cd server && node server.js`
- Environment Variables: See above

### Render
1. **New Web Service**
2. **Connect GitHub repo**
3. **Settings:**
   - Build Command: `npm run build && cd server && npm install`
   - Start Command: `cd server && node server.js`
   - Environment: Node

### Heroku
```bash
git add .
git commit -m "Unified deployment setup"
git push heroku main
```

**Procfile already created** - tells Heroku to run from server folder

---

## 🔍 VERIFICATION CHECKLIST

After deployment:

- [ ] Root URL loads React app (not 404)
- [ ] `/api/health` returns JSON (not HTML)
- [ ] Can register new account
- [ ] Can login with credentials
- [ ] Can create patent application
- [ ] Can view patent history
- [ ] No CORS errors in console
- [ ] No 405 errors in Network tab

---

## 🐛 TROUBLESHOOTING

### Issue: "Cannot GET /"
**Cause:** Frontend files not built or served correctly
**Solution:**
1. Run `npm run build` locally
2. Check `dist/` folder exists
3. Redeploy

### Issue: API calls fail
**Cause:** Backend not starting or environment variables missing
**Solution:**
1. Check Railway/Render logs
2. Verify environment variables set
3. Test `/api/health` endpoint

### Issue: 404 on page refresh
**Cause:** SPA routing not configured
**Solution:** Already fixed - server serves `index.html` for all non-API routes

### Issue: Build fails on Railway
**Cause:** Missing dependencies or build command
**Solution:**
1. Check build command: `npm run build && cd server && npm install`
2. Verify `package.json` in root has build script
3. Check Railway build logs

---

## 📊 ADVANTAGES OF UNIFIED DEPLOYMENT

✅ **Simpler:** One deployment instead of two
✅ **No CORS issues:** Same origin for frontend and API
✅ **Cost effective:** Single server hosting both
✅ **Easier environment management:** One set of variables
✅ **No URL configuration:** Uses relative paths

---

## 🎉 READY TO DEPLOY!

Your application is now configured for unified deployment:

1. **Run:** `build-and-deploy.bat`
2. **Push to GitHub**
3. **Deploy to Railway/Render**
4. **Set environment variables**
5. **Test and go live!**

The 405 errors will be fixed because now your backend API will be properly running and serving the routes! 🚀