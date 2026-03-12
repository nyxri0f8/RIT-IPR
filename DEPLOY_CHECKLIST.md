# ✅ Production Deployment Checklist

## 🎯 FIXES COMPLETED

- [x] Removed hardcoded `localhost:5000` from `src/api.js`
- [x] Removed hardcoded `localhost:5000` from `src/App.jsx`
- [x] Added proper error handling for missing `VITE_API_URL`
- [x] Backend health check: ✅ PASSING (HTTP 200)
- [x] No localhost references in source code

---

## 🚀 DEPLOYMENT STEPS

### Step 1: Verify Backend is Running
```bash
# Your backend URL:
https://rit-ipr-production.up.railway.app/api

# Test it:
curl https://rit-ipr-production.up.railway.app/api/health
```

**Expected Response:**
```json
{
  "status": "ok",
  "message": "RIT IPR Backend is running",
  "timestamp": "2024-..."
}
```

✅ **Status: VERIFIED - Backend is responding!**

---

### Step 2: Build Frontend for Production

```bash
# Install dependencies (if needed)
npm install

# Build for production
npm run build
```

This will create a `dist` folder with your production-ready files.

---

### Step 3: Deploy to Netlify

#### Option A: Netlify CLI
```bash
# Install Netlify CLI (if not installed)
npm install -g netlify-cli

# Login
netlify login

# Deploy
netlify deploy --prod
```

#### Option B: Netlify Dashboard
1. Go to https://app.netlify.com
2. Click "Add new site" → "Import an existing project"
3. Connect your GitHub repository
4. **IMPORTANT**: Set environment variable:
   - Key: `VITE_API_URL`
   - Value: `https://rit-ipr-production.up.railway.app/api`
5. Build settings:
   - Build command: `npm run build`
   - Publish directory: `dist`
6. Click "Deploy site"

---

### Step 4: Deploy to Vercel (Alternative)

#### Option A: Vercel CLI
```bash
# Install Vercel CLI (if not installed)
npm install -g vercel

# Login
vercel login

# Deploy
vercel --prod
```

#### Option B: Vercel Dashboard
1. Go to https://vercel.com
2. Click "Add New" → "Project"
3. Import your GitHub repository
4. **IMPORTANT**: Set environment variable:
   - Key: `VITE_API_URL`
   - Value: `https://rit-ipr-production.up.railway.app/api`
5. Framework preset: Vite
6. Click "Deploy"

---

## 🔍 POST-DEPLOYMENT VERIFICATION

### 1. Check Frontend Loads
- [ ] Visit your deployed URL
- [ ] No console errors
- [ ] Login/Register page appears

### 2. Test API Connection
Open browser console and check Network tab:
- [ ] API calls go to `https://rit-ipr-production.up.railway.app/api`
- [ ] NOT `localhost:5000`

### 3. Test User Flow
- [ ] Register new account
- [ ] Login with credentials
- [ ] Create patent application
- [ ] View patent history
- [ ] Download PDF forms

### 4. Check Environment Variables
On your hosting platform (Netlify/Vercel):
- [ ] `VITE_API_URL` is set
- [ ] Value is `https://rit-ipr-production.up.railway.app/api`
- [ ] Redeploy if you just added it

---

## 🐛 TROUBLESHOOTING

### Issue: "Backend API URL not configured"

**Cause:** `VITE_API_URL` environment variable not set

**Solution:**
1. Go to your hosting platform (Netlify/Vercel)
2. Settings → Environment Variables
3. Add: `VITE_API_URL` = `https://rit-ipr-production.up.railway.app/api`
4. Redeploy the site

### Issue: API calls still going to localhost

**Cause:** Browser cache or old build

**Solution:**
1. Clear browser cache
2. Hard refresh: `Ctrl + Shift + R` (Windows) or `Cmd + Shift + R` (Mac)
3. Check Network tab - should see production URL
4. If still localhost, rebuild and redeploy

### Issue: CORS errors

**Cause:** Backend not allowing frontend domain

**Solution:**
Your backend already has `cors()` enabled for all origins. If you still see CORS errors:
1. Check backend logs
2. Verify backend URL is correct
3. Ensure backend is running

### Issue: 404 on API calls

**Cause:** Incorrect backend URL

**Solution:**
Verify your `VITE_API_URL` ends with `/api`:
- ✅ Correct: `https://rit-ipr-production.up.railway.app/api`
- ❌ Wrong: `https://rit-ipr-production.up.railway.app`

---

## 📊 MONITORING

### Check Backend Logs (Railway)
```bash
railway logs
```

### Check Frontend Logs (Netlify)
1. Go to Netlify Dashboard
2. Your site → Deploys
3. Click on latest deploy
4. View deploy logs

### Check Frontend Logs (Vercel)
1. Go to Vercel Dashboard
2. Your project → Deployments
3. Click on latest deployment
4. View function logs

---

## 🎉 SUCCESS CRITERIA

Your deployment is successful when:

- [x] Backend health check returns 200 OK
- [ ] Frontend loads without errors
- [ ] Can register new user
- [ ] Can login
- [ ] Can create patent application
- [ ] Can view history
- [ ] Can download PDFs
- [ ] No localhost URLs in Network tab
- [ ] All API calls use production backend URL

---

## 📞 SUPPORT

If you encounter issues:

1. Check browser console for errors
2. Check Network tab for failed requests
3. Verify environment variables are set
4. Check backend logs
5. Try clearing cache and hard refresh

---

## 🔐 SECURITY NOTES

Before going live, ensure:

- [ ] Backend `JWT_SECRET` is changed from default
- [ ] All 10 Gemini API keys are configured
- [ ] Backend `NODE_ENV=production`
- [ ] HTTPS enabled on both services
- [ ] No sensitive data in frontend code

---

## 📝 YOUR CONFIGURATION

**Backend URL:** `https://rit-ipr-production.up.railway.app/api`

**Frontend URL:** (Will be provided by Netlify/Vercel after deployment)

**Environment Variable:**
```
VITE_API_URL=https://rit-ipr-production.up.railway.app/api
```

---

## 🚀 READY TO DEPLOY!

Run this command to build and verify:

```bash
npm run build
```

Then deploy using Netlify or Vercel! 🎉
