# GitHub Deployment Guide

## 🚀 Deployment Strategy

Since GitHub Pages only hosts static sites, we'll deploy:
- **Frontend**: GitHub Pages (free)
- **Backend**: Railway/Render/Heroku (free tier)

## 📋 Step 1: Push to GitHub

### Initialize Git (if not already done)
```bash
git init
git add .
git commit -m "Initial commit: RIT IPR Portal with backend"
```

### Create GitHub Repository
1. Go to https://github.com/new
2. Repository name: `rit-ipr-portal`
3. Description: "AI-powered patent filing system for RIT"
4. Keep it Public or Private
5. Don't initialize with README (we have one)
6. Click "Create repository"

### Push to GitHub
```bash
git remote add origin https://github.com/YOUR_USERNAME/rit-ipr-portal.git
git branch -M main
git push -u origin main
```

## 🌐 Step 2: Deploy Backend (Choose One)

### Option A: Railway (Recommended - Easiest)

1. Go to https://railway.app
2. Sign up with GitHub
3. Click "New Project" → "Deploy from GitHub repo"
4. Select your `rit-ipr-portal` repository
5. Railway will auto-detect Node.js
6. Add these settings:
   - **Root Directory**: `server`
   - **Start Command**: `node server.js`
   - **Environment Variables**:
     ```
     PORT=5000
     JWT_SECRET=your-super-secret-key-change-this
     NODE_ENV=production
     ```
7. Click "Deploy"
8. Copy your Railway URL (e.g., `https://your-app.railway.app`)

### Option B: Render

1. Go to https://render.com
2. Sign up with GitHub
3. Click "New" → "Web Service"
4. Connect your GitHub repository
5. Settings:
   - **Name**: rit-ipr-backend
   - **Root Directory**: `server`
   - **Build Command**: `npm install`
   - **Start Command**: `node server.js`
   - **Environment Variables**:
     ```
     PORT=5000
     JWT_SECRET=your-super-secret-key
     NODE_ENV=production
     ```
6. Click "Create Web Service"
7. Copy your Render URL (e.g., `https://rit-ipr-backend.onrender.com`)

### Option C: Heroku

```bash
# Install Heroku CLI first
cd server
heroku create rit-ipr-backend
heroku config:set JWT_SECRET=your-secret-key
heroku config:set NODE_ENV=production
git subtree push --prefix server heroku main
```

## 📱 Step 3: Deploy Frontend to GitHub Pages

### Update Frontend API URL

1. Edit `.env`:
```env
VITE_API_URL=https://your-backend-url.railway.app/api
```

Replace with your actual backend URL from Step 2.

### Deploy to GitHub Pages

#### Method 1: Using Vercel (Recommended)

1. Go to https://vercel.com
2. Sign up with GitHub
3. Click "New Project"
4. Import your `rit-ipr-portal` repository
5. Settings:
   - **Framework Preset**: Vite
   - **Root Directory**: `./`
   - **Build Command**: `npm run build`
   - **Output Directory**: `dist`
   - **Environment Variables**:
     ```
     VITE_API_URL=https://your-backend-url.railway.app/api
     ```
6. Click "Deploy"
7. Your site will be live at `https://your-project.vercel.app`

#### Method 2: Using Netlify

1. Go to https://netlify.com
2. Sign up with GitHub
3. Click "Add new site" → "Import an existing project"
4. Select your repository
5. Settings:
   - **Build command**: `npm run build`
   - **Publish directory**: `dist`
   - **Environment variables**:
     ```
     VITE_API_URL=https://your-backend-url.railway.app/api
     ```
6. Click "Deploy"
7. Your site will be live at `https://your-project.netlify.app`

#### Method 3: GitHub Pages (Manual)

```bash
# Install gh-pages
npm install --save-dev gh-pages

# Add to package.json scripts:
"predeploy": "npm run build",
"deploy": "gh-pages -d dist"

# Update vite.config.js:
export default defineConfig({
  plugins: [react()],
  base: '/rit-ipr-portal/'  // Your repo name
})

# Deploy
npm run deploy
```

Then enable GitHub Pages:
1. Go to your repo → Settings → Pages
2. Source: `gh-pages` branch
3. Your site: `https://YOUR_USERNAME.github.io/rit-ipr-portal/`

## ✅ Step 4: Test Everything

1. Open your deployed frontend URL
2. Register a new account
3. Create a patent
4. Verify it saves to backend
5. Check history loads correctly

## 🔧 Troubleshooting

### CORS Errors
If you get CORS errors, the backend needs to allow your frontend domain:

In `server/server.js`, update CORS:
```javascript
app.use(cors({
  origin: [
    'http://localhost:5173',
    'https://your-frontend.vercel.app',
    'https://your-frontend.netlify.app'
  ]
}));
```

### API Connection Failed
- Check backend is running (visit backend URL directly)
- Verify VITE_API_URL in frontend environment variables
- Check browser console for errors

### Database Issues
- Railway/Render use ephemeral storage
- For production, consider upgrading to PostgreSQL
- Or use a managed database service

## 📊 Recommended Setup

**Best Free Deployment:**
- **Frontend**: Vercel (fast, easy, free SSL)
- **Backend**: Railway (generous free tier, easy setup)
- **Database**: Railway PostgreSQL (when you upgrade)

## 🎯 Quick Deploy Commands

```bash
# 1. Push to GitHub
git add .
git commit -m "Ready for deployment"
git push origin main

# 2. Deploy backend to Railway
# (Use Railway dashboard - easier)

# 3. Deploy frontend to Vercel
# (Use Vercel dashboard - easier)

# Done! 🎉
```

## 🔐 Security Notes

1. **Never commit**:
   - `.env` files
   - API keys
   - Database files
   - `node_modules`

2. **Always use**:
   - Environment variables for secrets
   - HTTPS in production
   - Strong JWT secrets

3. **Backend security**:
   - Add rate limiting
   - Add request validation
   - Use helmet.js for security headers

## 📝 Post-Deployment Checklist

- [ ] Backend is accessible
- [ ] Frontend loads correctly
- [ ] Can register new users
- [ ] Can login
- [ ] Can create patents
- [ ] Patents save to database
- [ ] History loads correctly
- [ ] PDF download works
- [ ] Gemini AI analysis works
- [ ] Institution defaults to "Rajalakshmi Institute of Technology"

## 🎉 Success!

Your RIT IPR Portal is now live and accessible from anywhere!

**Share your URLs:**
- Frontend: `https://your-app.vercel.app`
- Backend: `https://your-backend.railway.app`

---

Need help? Check the troubleshooting section or create an issue on GitHub.
