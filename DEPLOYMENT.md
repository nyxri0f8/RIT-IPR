# Deployment Guide 🚀

## Prerequisites
- Node.js 18+ installed
- Git installed (for some platforms)

## Step 1: Install Dependencies

```bash
npm install
```

## Step 2: Test Locally

```bash
npm run dev
```

Visit http://localhost:3000 to test the app.

## Step 3: Choose Your Hosting Platform

### Option A: Vercel (Easiest - Recommended) ⭐

1. Install Vercel CLI:
```bash
npm install -g vercel
```

2. Deploy:
```bash
vercel
```

3. Follow the prompts:
   - Login to Vercel
   - Link to existing project or create new
   - Accept default settings
   - Done! You'll get a live URL

**Or use Vercel Dashboard:**
1. Go to [vercel.com](https://vercel.com)
2. Click "Add New Project"
3. Import your Git repository
4. Click "Deploy"

---

### Option B: Netlify (Very Easy)

**Method 1: Drag & Drop**
1. Build the project:
```bash
npm run build
```

2. Go to [netlify.com/drop](https://app.netlify.com/drop)
3. Drag the `dist` folder
4. Done! You'll get a live URL

**Method 2: Netlify CLI**
```bash
npm install -g netlify-cli
netlify deploy --prod
```

**Method 3: Git Integration**
1. Push code to GitHub
2. Go to [netlify.com](https://netlify.com)
3. Click "Add new site" → "Import from Git"
4. Select your repository
5. Build settings are auto-detected from `netlify.toml`
6. Click "Deploy"

---

### Option C: GitHub Pages

1. Install gh-pages:
```bash
npm install -D gh-pages
```

2. Add to package.json scripts:
```json
"scripts": {
  "deploy": "npm run build && gh-pages -d dist"
}
```

3. Deploy:
```bash
npm run deploy
```

4. Enable GitHub Pages in repo settings → Pages → Source: gh-pages branch

---

### Option D: Cloudflare Pages

1. Push code to GitHub
2. Go to [dash.cloudflare.com](https://dash.cloudflare.com)
3. Pages → Create a project
4. Connect to Git
5. Build settings:
   - Build command: `npm run build`
   - Output directory: `dist`
6. Click "Save and Deploy"

---

### Option E: Railway

1. Go to [railway.app](https://railway.app)
2. Click "New Project" → "Deploy from GitHub repo"
3. Select your repository
4. Railway auto-detects settings
5. Click "Deploy"

---

### Option F: Render

1. Go to [render.com](https://render.com)
2. New → Static Site
3. Connect your Git repository
4. Build command: `npm run build`
5. Publish directory: `dist`
6. Click "Create Static Site"

---

## Environment Variables (Optional)

If you want to add API keys as environment variables:

1. Create `.env` file:
```env
VITE_GEMINI_API_KEY=your_key_here
```

2. Update `src/App.jsx` to use:
```javascript
const defaultGeminiKey = import.meta.env.VITE_GEMINI_API_KEY || "";
```

3. Add environment variables in your hosting platform dashboard

---

## Custom Domain

All platforms above support custom domains:
1. Go to your project settings
2. Add custom domain
3. Update DNS records as instructed
4. Wait for SSL certificate (automatic)

---

## Troubleshooting

**Build fails:**
- Ensure Node.js 18+ is installed
- Delete `node_modules` and run `npm install` again
- Check for syntax errors in code

**API not working:**
- Check browser console for CORS errors
- Verify API keys are correct
- Claude uses direct browser access (may have limitations)

**Blank page after deployment:**
- Check browser console for errors
- Verify build completed successfully
- Check routing configuration

---

## Performance Tips

1. **Enable Caching**: Most platforms do this automatically
2. **Use CDN**: Vercel, Netlify, Cloudflare have built-in CDN
3. **Compress Assets**: Vite does this automatically in production build
4. **Monitor Usage**: Check API usage to avoid rate limits

---

## Cost

All recommended platforms offer generous free tiers:
- Vercel: Free for personal projects
- Netlify: 100GB bandwidth/month free
- Cloudflare Pages: Unlimited bandwidth free
- GitHub Pages: Free for public repos
- Railway: $5 credit/month free
- Render: Free tier available

---

## Need Help?

- Check platform-specific documentation
- Review build logs for errors
- Test locally first with `npm run dev`
- Ensure all dependencies are installed
