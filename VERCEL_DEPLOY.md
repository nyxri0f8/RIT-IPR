# Deploy Frontend to Vercel 🚀

## ✅ Backend is Ready!
Your backend is deployed at: **https://rit-ipr-production.up.railway.app**

## 📱 Deploy Frontend Now (3 minutes)

### Step 1: Go to Vercel
Open: **https://vercel.com**

### Step 2: Sign Up/Login
- Click **"Sign Up"** or **"Login"**
- Choose **"Continue with GitHub"**
- Authorize Vercel to access your GitHub

### Step 3: Import Project
1. Click **"Add New..."** → **"Project"**
2. Find **"RIT-IPR"** in the list
3. Click **"Import"**

### Step 4: Configure Project
Vercel will auto-detect Vite. Just verify:
- **Framework Preset**: Vite ✅
- **Root Directory**: `./` ✅
- **Build Command**: `npm run build` ✅
- **Output Directory**: `dist` ✅

### Step 5: Add Environment Variable
This is the MOST IMPORTANT step!

1. Click **"Environment Variables"** section
2. Add variable:
   - **Name**: `VITE_API_URL`
   - **Value**: `https://rit-ipr-production.up.railway.app/api`
3. Make sure it's for **Production**, **Preview**, and **Development**

### Step 6: Deploy!
1. Click **"Deploy"**
2. Wait 2-3 minutes ⏳
3. Vercel will build and deploy your app

### Step 7: Get Your URL
Once deployed, you'll see:
- **Visit** button - Click it!
- Your URL will be something like: `https://rit-ipr.vercel.app`

## ✅ Test Your App

1. Open your Vercel URL
2. Click **"Create Account"**
3. Register:
   - Name: Your Name
   - Email: your@email.com
   - Password: test123
   - Department: Computer Science
4. Click **"Create Account"**
5. You should be logged in!
6. Try creating a patent
7. Check if it saves to history

## 🎉 You're Live!

Your RIT IPR Portal is now accessible worldwide at:
- **Frontend**: https://rit-ipr.vercel.app (or your custom URL)
- **Backend**: https://rit-ipr-production.up.railway.app
- **GitHub**: https://github.com/nyxri0f8/RIT-IPR

## 🔧 If You Get Errors

### CORS Error
If frontend can't connect to backend, update `server/server.js`:

```javascript
app.use(cors({
  origin: [
    'http://localhost:5173',
    'https://rit-ipr.vercel.app',  // Add your Vercel URL
    'https://rit-ipr-nyxri0f8.vercel.app'  // And any preview URLs
  ],
  credentials: true
}));
```

Then push to GitHub - Railway will auto-redeploy.

### Environment Variable Not Working
1. Go to Vercel Dashboard
2. Select your project
3. Go to **Settings** → **Environment Variables**
4. Verify `VITE_API_URL` is set correctly
5. Redeploy from **Deployments** tab

## 🎯 Auto-Deploy Setup

Now whenever you push to GitHub:
- Railway will auto-deploy backend
- Vercel will auto-deploy frontend

Just run:
```bash
git add .
git commit -m "Your changes"
git push
```

## 📊 Monitor Your App

- **Vercel Dashboard**: https://vercel.com/dashboard
- **Railway Dashboard**: https://railway.app/dashboard
- **GitHub Repo**: https://github.com/nyxri0f8/RIT-IPR

## 🎨 Custom Domain (Optional)

Both Vercel and Railway support custom domains:
1. Buy a domain (e.g., from Namecheap, GoDaddy)
2. Add it in Vercel/Railway settings
3. Update DNS records
4. Your app will be at your custom domain!

## 🆘 Need Help?

- Vercel Docs: https://vercel.com/docs
- Railway Docs: https://docs.railway.app
- Check `GITHUB_DEPLOYMENT.md` for more details

---

**Ready?** Go to https://vercel.com and deploy! 🚀
