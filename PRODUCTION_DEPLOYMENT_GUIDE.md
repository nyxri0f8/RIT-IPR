# 🚀 Production Deployment Guide - RIT IPR System

## ✅ FIXES APPLIED

### 1. Removed Hardcoded API URLs
- ❌ **Before**: `const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:5000/api'`
- ✅ **After**: `const API_URL = import.meta.env.VITE_API_URL` (throws error if not set)

### 2. Fixed Files
- `src/api.js` - Removed localhost fallback
- `src/App.jsx` - Removed localhost fallback in Gemini key fetch
- `.env.example` - Updated with clear production instructions

---

## 📋 DEPLOYMENT CHECKLIST

### Backend Deployment (Railway/Render/Heroku)

1. **Deploy Backend First**
   ```bash
   cd server
   # Push to your hosting platform
   ```

2. **Set Environment Variables on Backend**
   ```env
   PORT=5000
   NODE_ENV=production
   JWT_SECRET=your-super-secret-jwt-key-change-this
   GEMINI_API_KEYS=key1,key2,key3,key4,key5
   ```

3. **Get Your Backend URL**
   - Railway: `https://your-app.up.railway.app`
   - Render: `https://your-app.onrender.com`
   - Heroku: `https://your-app.herokuapp.com`

### Frontend Deployment (Netlify/Vercel)

1. **Update `.env` File**
   ```env
   VITE_API_URL=https://your-backend-url.com/api
   ```
   
   Example:
   ```env
   VITE_API_URL=https://rit-ipr-production.up.railway.app/api
   ```

2. **Set Environment Variable on Netlify/Vercel**
   
   **Netlify:**
   - Go to Site Settings → Environment Variables
   - Add: `VITE_API_URL` = `https://your-backend-url.com/api`
   
   **Vercel:**
   - Go to Project Settings → Environment Variables
   - Add: `VITE_API_URL` = `https://your-backend-url.com/api`

3. **Deploy Frontend**
   ```bash
   npm run build
   # Or push to GitHub (auto-deploy)
   ```

---

## 🔍 TESTING PRODUCTION

### 1. Test Backend Health
```bash
curl https://your-backend-url.com/api/health
```

Expected response:
```json
{
  "status": "ok",
  "message": "RIT IPR Backend is running",
  "timestamp": "2024-..."
}
```

### 2. Test Frontend Connection
- Open browser console on your deployed frontend
- Try to login/register
- Check Network tab for API calls
- Should see calls to your production backend URL (NOT localhost)

### 3. Common Issues

**Issue: "Backend API URL not configured"**
- ✅ Solution: Set `VITE_API_URL` in your hosting platform's environment variables

**Issue: CORS errors**
- ✅ Solution: Backend already has `cors()` enabled, but verify your backend URL is correct

**Issue: 404 on API calls**
- ✅ Solution: Ensure backend URL includes `/api` at the end
  - ✅ Correct: `https://backend.com/api`
  - ❌ Wrong: `https://backend.com`

---

## 📝 DEPLOYMENT PLATFORMS

### Option 1: Railway (Backend) + Netlify (Frontend)

**Backend (Railway):**
```bash
cd server
railway login
railway init
railway up
```

**Frontend (Netlify):**
```bash
netlify deploy --prod
```

### Option 2: Render (Backend) + Vercel (Frontend)

**Backend (Render):**
- Connect GitHub repo
- Root directory: `server`
- Build command: `npm install`
- Start command: `node server.js`

**Frontend (Vercel):**
```bash
vercel --prod
```

---

## 🔐 SECURITY CHECKLIST

- [ ] Changed `JWT_SECRET` from default
- [ ] Added all 10 Gemini API keys
- [ ] Set `NODE_ENV=production` on backend
- [ ] Verified HTTPS on both frontend and backend
- [ ] Tested login/register flow
- [ ] Tested patent creation and retrieval

---

## 📊 MONITORING

### Backend Logs
Check your hosting platform's logs for:
- API requests
- Database operations
- Error messages

### Frontend Errors
- Open browser console
- Check for API connection errors
- Verify environment variables loaded

---

## 🆘 TROUBLESHOOTING

### Frontend shows "Backend API URL not configured"
1. Check `.env` file exists in root
2. Verify `VITE_API_URL` is set
3. Rebuild frontend: `npm run build`
4. Redeploy

### API calls go to localhost in production
1. Clear browser cache
2. Hard refresh (Ctrl+Shift+R)
3. Check Network tab - should see production URL
4. If still localhost, environment variable not loaded

### Backend not responding
1. Check backend logs
2. Verify backend is running: `curl https://backend-url/api/health`
3. Check environment variables on hosting platform
4. Restart backend service

---

## ✅ FINAL VERIFICATION

Run this checklist before going live:

1. [ ] Backend health endpoint responds
2. [ ] Frontend loads without console errors
3. [ ] Can register new account
4. [ ] Can login with credentials
5. [ ] Can create patent application
6. [ ] Can view patent history
7. [ ] Can download PDF forms
8. [ ] No localhost URLs in Network tab
9. [ ] All environment variables set
10. [ ] HTTPS enabled on both services

---

## 🎉 YOU'RE LIVE!

Your RIT IPR system is now running in production with:
- ✅ No hardcoded URLs
- ✅ Environment-based configuration
- ✅ Secure backend API
- ✅ Scalable architecture

Share your production URL with users! 🚀
