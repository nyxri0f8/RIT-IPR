# 🚀 Deploy to Render - Step by Step Guide

## 📋 PRE-DEPLOYMENT CHECKLIST

- [x] Frontend builds successfully (`npm run build`)
- [x] Backend serves frontend files
- [x] API endpoints work locally
- [x] No hardcoded URLs
- [x] Configuration files ready

**You're ready to deploy to Render!**

---

## 🎯 RENDER DEPLOYMENT STEPS

### Step 1: Push Code to GitHub

If you haven't already:

```bash
git add .
git commit -m "Unified deployment ready for Render"
git push origin main
```

### Step 2: Create Render Account & Service

1. **Go to https://render.com**
2. **Sign up/Login** (can use GitHub account)
3. **Click "New +"** → **"Web Service"**

### Step 3: Connect Repository

1. **Connect GitHub account** if not already connected
2. **Select your repository** (the one with RIT IPR code)
3. **Click "Connect"**

### Step 4: Configure Service Settings

**Basic Settings:**
- **Name:** `rit-ipr-app` (or any name you prefer)
- **Region:** Choose closest to your users
- **Branch:** `main` (or your default branch)
- **Root Directory:** Leave empty (use repository root)

**Build & Deploy Settings:**
- **Runtime:** `Node`
- **Build Command:** 
  ```
  npm install && npm run build && cd server && npm install
  ```
- **Start Command:**
  ```
  cd server && node server.js
  ```

### Step 5: Set Environment Variables

Click **"Advanced"** → **"Add Environment Variable"**

Add these variables:

```env
PORT=10000
NODE_ENV=production
JWT_SECRET=your-super-secret-jwt-key-change-this-now-for-production
GEMINI_API_KEYS=AIzaSyB3XXLRx0bBpJhCvGd9aloJZMLCiAGdH1c,AIzaSyDIMx9NazSB27MMP9n-fXJ6wWqgz_ZC-j0,AIzaSyBj4xa2hwvos69nGIonqYwB8TqTY5tMH0A,AIzaSyAkMnu2fLI_NPdn4s4x0gipe6VdOWMsKUw,AIzaSyBsZoJ9X6_Q41ES6T9NGWEtJtqLzflayko,AIzaSyDDZ-kpNuJD2_GPySsNwi4g42TnuAIYmd8,AIzaSyD40jiDjMzVcoGWnYfnHnbUObsUIXjPaFY,AIzaSyDl_LYHli0BI9oZN77Cq-LT58JngZ8V-VY,AIzaSyDdamxVtYmlnmCv2iYzJcICTBXJoBJgLwY,AIzaSyCgEqT_DBnZW9u1Rv1ilaGr1jiFlDU-Zbo
```

**Important Notes:**
- **PORT=10000** (Render uses port 10000, not 5000)
- **Change JWT_SECRET** to a strong, unique secret
- **GEMINI_API_KEYS** should be your actual API keys (comma-separated)

### Step 6: Deploy!

1. **Click "Create Web Service"**
2. **Wait for deployment** (usually 5-10 minutes)
3. **Watch the build logs** for any errors

---

## 📊 DEPLOYMENT PROCESS

Render will:

```
1. 📦 Clone your repository
2. 🔧 Run: npm install (install frontend dependencies)
3. 🏗️  Run: npm run build (build React app to /dist)
4. 📦 Run: cd server && npm install (install backend dependencies)
5. 🚀 Run: cd server && node server.js (start server)
6. 🌐 Make your app available at: https://your-app.onrender.com
```

---

## 🧪 VERIFY DEPLOYMENT

After deployment completes, Render will give you a URL like:
`https://rit-ipr-app.onrender.com`

### Test 1: Frontend
Visit: `https://your-app.onrender.com/`
- ✅ Should load your React app
- ✅ Should see login/register page
- ❌ Should NOT show 404 or error

### Test 2: API Health Check
Visit: `https://your-app.onrender.com/api/health`
- ✅ Should return JSON: `{"status":"ok","message":"RIT IPR Backend is running"}`
- ❌ Should NOT return HTML

### Test 3: Full Integration
1. **Register a new account** from the frontend
2. **Login with credentials**
3. **Try creating a patent application**
4. **Check browser DevTools → Network tab**
   - API calls should go to `/api/*` (same domain)
   - Should see 200 responses (not 405 errors)

---

## 🎉 SUCCESS INDICATORS

Your deployment is successful when:

- [ ] Render build completes without errors
- [ ] Frontend loads at root URL
- [ ] `/api/health` returns JSON
- [ ] Can register/login
- [ ] Can create patents
- [ ] No 405 errors in browser console
- [ ] All features work as expected

---

## 🐛 TROUBLESHOOTING

### Build Fails

**Check Render logs for:**
- Missing dependencies in `package.json`
- Build command errors
- Node.js version issues

**Solutions:**
- Ensure `package.json` has all dependencies
- Check build command is correct
- Verify Node.js version compatibility

### Server Won't Start

**Check for:**
- Missing environment variables
- Port configuration issues
- Database initialization errors

**Solutions:**
- Verify all environment variables are set
- Check `PORT=10000` (Render's requirement)
- Review server startup logs

### Frontend Loads but API Fails

**Check:**
- `/api/health` endpoint
- Environment variables (especially GEMINI_API_KEYS)
- Server logs for errors

**Solutions:**
- Test API endpoints individually
- Verify JWT_SECRET is set
- Check GEMINI_API_KEYS format

### 404 on Page Refresh

**Should be fixed automatically** - your server serves `index.html` for all non-API routes.

If still happening:
- Check server logs
- Verify static file serving is working
- Test different routes

---

## 📱 RENDER DASHBOARD FEATURES

After deployment, you can:

- **View Logs:** Real-time server logs
- **Monitor Performance:** CPU, memory usage
- **Manage Environment Variables:** Add/edit variables
- **Custom Domains:** Add your own domain
- **SSL Certificates:** Automatic HTTPS
- **Auto-Deploy:** Redeploy on GitHub pushes

---

## 🔧 POST-DEPLOYMENT CONFIGURATION

### Enable Auto-Deploy
1. **Go to your service dashboard**
2. **Settings → Build & Deploy**
3. **Enable "Auto-Deploy"**
4. **Choose branch:** `main`

Now every push to GitHub will automatically redeploy!

### Add Custom Domain (Optional)
1. **Settings → Custom Domains**
2. **Add your domain**
3. **Configure DNS** as instructed
4. **SSL certificate** will be automatically provisioned

---

## 💰 RENDER PRICING

- **Free Tier:** Available for testing
  - Spins down after 15 minutes of inactivity
  - Slower cold starts
  - Perfect for development/testing

- **Paid Tier:** $7/month
  - Always running
  - Faster performance
  - Better for production

---

## 🚀 DEPLOYMENT COMMAND SUMMARY

For quick reference:

```bash
# 1. Push to GitHub
git add .
git commit -m "Deploy to Render"
git push origin main

# 2. Go to render.com
# 3. New Web Service
# 4. Connect GitHub repo
# 5. Settings:
#    Build: npm install && npm run build && cd server && npm install
#    Start: cd server && node server.js
# 6. Add environment variables
# 7. Deploy!
```

---

## 📞 NEED HELP?

If deployment fails:

1. **Check Render build logs** for specific errors
2. **Test locally first:** `npm run build && cd server && node server.js`
3. **Verify environment variables** are correctly set
4. **Check GitHub repository** has all files

**Common issues:**
- Missing `package.json` dependencies
- Incorrect build/start commands
- Missing environment variables
- Port configuration (use 10000 for Render)

---

## ✅ FINAL CHECKLIST

Before clicking "Create Web Service":

- [ ] Repository pushed to GitHub
- [ ] Build command: `npm install && npm run build && cd server && npm install`
- [ ] Start command: `cd server && node server.js`
- [ ] Environment variables added (PORT, JWT_SECRET, GEMINI_API_KEYS)
- [ ] Node.js runtime selected

**Click "Create Web Service" and watch your app come to life!** 🎉

Your 405 errors will be completely resolved because Render will properly run your backend server with all the API routes working correctly!