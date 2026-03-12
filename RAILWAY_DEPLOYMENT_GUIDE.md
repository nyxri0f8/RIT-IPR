# 🚂 Deploy to Railway - Complete Guide

## 📋 PRE-DEPLOYMENT STATUS

- [x] Unified deployment setup complete
- [x] Frontend builds successfully
- [x] Backend serves frontend files
- [x] API endpoints work locally
- [x] Railway configuration files ready
- [x] No hardcoded URLs

**Ready for Railway deployment!**

---

## 🎯 RAILWAY DEPLOYMENT METHODS

### Method 1: Railway CLI (Recommended)

#### Step 1: Install Railway CLI
```bash
# Install Railway CLI
npm install -g @railway/cli

# Or using other package managers:
# yarn global add @railway/cli
# pnpm add -g @railway/cli
```

#### Step 2: Login to Railway
```bash
railway login
```
This will open your browser to authenticate with Railway.

#### Step 3: Initialize Project
```bash
# In your project root directory
railway init
```
Choose:
- **Create new project** (or link existing if you have one)
- **Project name:** `rit-ipr-app` (or your preferred name)

#### Step 4: Deploy
```bash
railway up
```

Railway will automatically:
1. Detect it's a Node.js project
2. Use the configuration files I created
3. Build and deploy your app

---

### Method 2: Railway Dashboard (GitHub Integration)

#### Step 1: Push to GitHub
```bash
git add .
git commit -m "Railway unified deployment ready"
git push origin main
```

#### Step 2: Railway Dashboard Setup
1. **Go to https://railway.app**
2. **Sign up/Login** (can use GitHub account)
3. **Click "New Project"**
4. **Select "Deploy from GitHub repo"**
5. **Choose your repository**
6. **Click "Deploy Now"**

---

## ⚙️ RAILWAY CONFIGURATION

Railway will automatically use these files I created:

### `railway.json`
```json
{
  "build": {
    "builder": "NIXPACKS",
    "buildCommand": "npm install && npm run build && cd server && npm install"
  },
  "deploy": {
    "startCommand": "cd server && node server.js"
  }
}
```

### `nixpacks.toml`
```toml
[phases.setup]
nixPkgs = ["nodejs_20"]

[phases.install]
cmds = ["npm ci", "cd server && npm ci"]

[phases.build]
cmds = ["npm run build"]

[start]
cmd = "cd server && node server.js"
```

### `Procfile`
```
web: npm run build && cd server && node server.js
```

---

## 🔧 ENVIRONMENT VARIABLES

After deployment, set these environment variables in Railway Dashboard:

### Go to: Project → Variables Tab

Add these variables:

```env
PORT=5000
NODE_ENV=production
JWT_SECRET=your-super-secret-jwt-key-change-this-for-production-security
GEMINI_API_KEYS=AIzaSyB3XXLRx0bBpJhCvGd9aloJZMLCiAGdH1c,AIzaSyDIMx9NazSB27MMP9n-fXJ6wWqgz_ZC-j0,AIzaSyBj4xa2hwvos69nGIonqYwB8TqTY5tMH0A,AIzaSyAkMnu2fLI_NPdn4s4x0gipe6VdOWMsKUw,AIzaSyBsZoJ9X6_Q41ES6T9NGWEtJtqLzflayko,AIzaSyDDZ-kpNuJD2_GPySsNwi4g42TnuAIYmd8,AIzaSyD40jiDjMzVcoGWnYfnHnbUObsUIXjPaFY,AIzaSyDl_LYHli0BI9oZN77Cq-LT58JngZ8V-VY,AIzaSyDdamxVtYmlnmCv2iYzJcICTBXJoBJgLwY,AIzaSyCgEqT_DBnZW9u1Rv1ilaGr1jiFlDU-Zbo
```

**Important:**
- **Change JWT_SECRET** to a strong, unique secret for production
- **GEMINI_API_KEYS** should be your actual API keys (comma-separated)
- **PORT=5000** (Railway auto-assigns, but good to be explicit)

---

## 📊 DEPLOYMENT PROCESS

Railway will execute:

```
1. 🔍 Detect Node.js project
2. 📦 Install frontend dependencies (npm install)
3. 🏗️  Build React app (npm run build) → creates /dist
4. 📦 Install backend dependencies (cd server && npm install)
5. 🚀 Start server (cd server && node server.js)
6. 🌐 Assign URL: https://your-app.up.railway.app
```

---

## 🧪 VERIFY DEPLOYMENT

After deployment, Railway will provide a URL like:
`https://rit-ipr-app.up.railway.app`

### Test 1: Frontend
Visit: `https://your-app.up.railway.app/`
- ✅ Should load React app (login/register page)
- ❌ Should NOT show 404 or "Cannot GET /"

### Test 2: API Health Check
Visit: `https://your-app.up.railway.app/api/health`
- ✅ Should return JSON: `{"status":"ok","message":"RIT IPR Backend is running"}`
- ❌ Should NOT return HTML or 404

### Test 3: Integration Test
1. **Register new account** from frontend
2. **Login with credentials**
3. **Create patent application**
4. **Check browser Network tab:**
   - API calls go to `/api/*` (same domain)
   - See 200 responses (not 405 errors)

---

## 🎉 SUCCESS INDICATORS

Deployment is successful when:

- [ ] Railway build completes without errors
- [ ] Frontend loads at root URL
- [ ] `/api/health` returns JSON (not HTML)
- [ ] Can register/login users
- [ ] Can create patent applications
- [ ] No 405 errors in browser console
- [ ] All app features work correctly

---

## 📱 RAILWAY DASHBOARD FEATURES

After deployment:

### Deployments Tab
- View build logs
- See deployment history
- Redeploy if needed

### Variables Tab
- Add/edit environment variables
- Secure storage for secrets

### Metrics Tab
- Monitor CPU/memory usage
- View request analytics
- Performance insights

### Settings Tab
- Custom domains
- Auto-deploy configuration
- Service settings

---

## 🔄 AUTO-DEPLOY SETUP

Enable automatic deployments on GitHub pushes:

1. **Railway Dashboard → Your Project**
2. **Settings → Service**
3. **Source Repo:** Already connected
4. **Auto Deploy:** Should be enabled by default
5. **Branch:** `main` (or your default branch)

Now every `git push` will automatically redeploy!

---

## 🐛 TROUBLESHOOTING

### Build Fails

**Check Railway logs for:**
- Missing dependencies
- Build command errors
- Node.js version issues

**Solutions:**
```bash
# Test locally first
npm install
npm run build
cd server && npm install
cd .. && cd server && node server.js
```

### Server Won't Start

**Common issues:**
- Missing environment variables
- Database initialization errors
- Port binding issues

**Check:**
1. Environment variables are set
2. Railway logs for specific errors
3. Server startup sequence

### Frontend Shows but API Fails

**Symptoms:**
- Frontend loads but login fails
- 405 errors in Network tab
- API endpoints return HTML

**Solutions:**
1. Check `/api/health` endpoint directly
2. Verify environment variables (especially GEMINI_API_KEYS)
3. Review Railway deployment logs

### Database Issues

**If you see database errors:**
1. Check Railway logs for SQLite initialization
2. Verify file permissions
3. Consider Railway's persistent storage options

---

## 💰 RAILWAY PRICING

- **Hobby Plan:** $5/month
  - 512MB RAM, 1GB storage
  - Perfect for this application
  - Always-on (no cold starts)

- **Pro Plan:** $20/month
  - More resources
  - Priority support
  - Advanced features

---

## 🚀 QUICK DEPLOYMENT COMMANDS

### Using Railway CLI:
```bash
# Install CLI
npm install -g @railway/cli

# Login
railway login

# Deploy
railway init
railway up

# Check status
railway status

# View logs
railway logs
```

### Using GitHub:
```bash
# Push code
git add .
git commit -m "Deploy to Railway"
git push origin main

# Then use Railway Dashboard to deploy
```

---

## 🔧 POST-DEPLOYMENT CONFIGURATION

### Custom Domain (Optional)
1. **Railway Dashboard → Settings → Domains**
2. **Add custom domain**
3. **Configure DNS** as instructed
4. **SSL certificate** automatically provisioned

### Environment Management
- Use Railway Dashboard for sensitive variables
- Keep development variables in `.env` files
- Never commit secrets to GitHub

### Monitoring
- Check Railway metrics regularly
- Set up alerts for downtime
- Monitor resource usage

---

## 📞 RAILWAY CLI USEFUL COMMANDS

```bash
# View project info
railway status

# View real-time logs
railway logs

# Open project in browser
railway open

# Connect to database (if using Railway DB)
railway connect

# Run commands in Railway environment
railway run node --version

# Link to existing project
railway link

# Environment variables
railway variables
```

---

## ✅ DEPLOYMENT CHECKLIST

Before deploying:

- [ ] Code pushed to GitHub
- [ ] Railway CLI installed (if using CLI method)
- [ ] Environment variables ready
- [ ] Build tested locally (`npm run build`)
- [ ] Server tested locally (`cd server && node server.js`)

During deployment:

- [ ] Railway build completes successfully
- [ ] No errors in deployment logs
- [ ] Environment variables set in dashboard
- [ ] Service starts without errors

After deployment:

- [ ] Frontend loads correctly
- [ ] API health check works
- [ ] User registration/login works
- [ ] Patent creation works
- [ ] No 405 errors in browser

---

## 🎯 FINAL DEPLOYMENT COMMAND

Choose your method:

**Method 1 - Railway CLI:**
```bash
railway login
railway init
railway up
```

**Method 2 - GitHub Integration:**
1. Push to GitHub
2. Go to railway.app
3. New Project → Deploy from GitHub
4. Select repository → Deploy

**Your 405 errors will be completely fixed!** Railway will properly run your backend server with all API routes working correctly. 🚂✨

---

## 📋 WHAT HAPPENS NEXT

1. **Railway builds your app** using the config files
2. **Assigns a URL** like `https://rit-ipr-app.up.railway.app`
3. **Your app is live** with both frontend and backend working
4. **Users can access** your patent filing system
5. **No more 405 errors** - all API routes work perfectly!

Ready to deploy? Follow the steps above! 🚀