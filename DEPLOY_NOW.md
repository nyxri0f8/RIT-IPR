# 🚀 Deploy RIT IPR Portal NOW!

## ✅ Git is Ready!

Your code is committed and ready to push to GitHub.

## 📋 Next Steps:

### 1. Create GitHub Repository

Go to: https://github.com/new

- **Repository name**: `rit-ipr-portal`
- **Description**: `AI-powered patent filing system for Rajalakshmi Institute of Technology`
- **Visibility**: Public (or Private if you prefer)
- **DON'T** initialize with README, .gitignore, or license
- Click **"Create repository"**

### 2. Push Your Code

Copy and run these commands (replace YOUR_USERNAME with your GitHub username):

```bash
git remote add origin https://github.com/YOUR_USERNAME/rit-ipr-portal.git
git branch -M main
git push -u origin main
```

### 3. Deploy Backend (Railway - Easiest!)

#### Option A: Railway (Recommended)

1. Go to: https://railway.app
2. Click "Login" → Sign in with GitHub
3. Click "New Project"
4. Click "Deploy from GitHub repo"
5. Select `rit-ipr-portal`
6. Railway will detect Node.js automatically
7. Click on the service → Settings:
   - **Root Directory**: `server`
   - **Start Command**: `node server.js`
8. Go to Variables tab, add:
   ```
   PORT=5000
   JWT_SECRET=RIT-IPR-2024-SECRET-KEY-CHANGE-THIS
   NODE_ENV=production
   ```
9. Click "Deploy"
10. Go to Settings → Generate Domain
11. **Copy your Railway URL** (e.g., `https://rit-ipr-backend.up.railway.app`)

### 4. Deploy Frontend (Vercel - Easiest!)

1. Go to: https://vercel.com
2. Click "Sign Up" → Continue with GitHub
3. Click "Add New..." → "Project"
4. Import `rit-ipr-portal`
5. Configure:
   - **Framework Preset**: Vite
   - **Root Directory**: `./`
   - **Build Command**: `npm run build`
   - **Output Directory**: `dist`
6. Add Environment Variable:
   - **Name**: `VITE_API_URL`
   - **Value**: `https://YOUR-RAILWAY-URL.railway.app/api`
   (Replace with your actual Railway URL from step 3)
7. Click "Deploy"
8. Wait 2-3 minutes
9. **Your site is live!** 🎉

### 5. Test Your Deployment

1. Open your Vercel URL (e.g., `https://rit-ipr-portal.vercel.app`)
2. Click "Create Account"
3. Register with your details
4. Create a patent
5. Verify it saves and appears in history

## 🎯 Quick Commands

```bash
# Push to GitHub (after creating repo)
git remote add origin https://github.com/YOUR_USERNAME/rit-ipr-portal.git
git branch -M main
git push -u origin main
```

## ✨ Alternative: Deploy Frontend to Netlify

If you prefer Netlify over Vercel:

1. Go to: https://netlify.com
2. Sign up with GitHub
3. Click "Add new site" → "Import an existing project"
4. Select your repository
5. Settings:
   - **Build command**: `npm run build`
   - **Publish directory**: `dist`
6. Environment variables:
   - `VITE_API_URL` = `https://your-railway-url.railway.app/api`
7. Click "Deploy site"

## 🔧 If You Get CORS Errors

If frontend can't connect to backend, update `server/server.js`:

```javascript
app.use(cors({
  origin: [
    'http://localhost:5173',
    'https://your-app.vercel.app',  // Add your Vercel URL
    'https://your-app.netlify.app'  // Or Netlify URL
  ],
  credentials: true
}));
```

Then redeploy backend on Railway (it auto-deploys on git push).

## 📊 Deployment Status Checklist

- [ ] Code pushed to GitHub
- [ ] Backend deployed on Railway
- [ ] Backend URL copied
- [ ] Frontend deployed on Vercel/Netlify
- [ ] Environment variable set with backend URL
- [ ] Can access frontend URL
- [ ] Can register new account
- [ ] Can create patent
- [ ] Patent saves to backend
- [ ] History loads correctly

## 🎉 You're Done!

Your RIT IPR Portal is now live and accessible worldwide!

**Share these URLs:**
- **Frontend**: https://your-app.vercel.app
- **Backend API**: https://your-backend.railway.app
- **GitHub Repo**: https://github.com/YOUR_USERNAME/rit-ipr-portal

## 💡 Pro Tips

1. **Custom Domain**: Both Vercel and Railway support custom domains
2. **Auto Deploy**: Push to GitHub → Auto deploys to both services
3. **Monitoring**: Check Railway logs for backend issues
4. **Analytics**: Add Vercel Analytics for usage tracking

## 🆘 Need Help?

- Railway docs: https://docs.railway.app
- Vercel docs: https://vercel.com/docs
- Check `GITHUB_DEPLOYMENT.md` for detailed troubleshooting

---

**Ready? Let's deploy!** 🚀

Start with Step 1: Create your GitHub repository!
