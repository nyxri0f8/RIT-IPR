# Force Cache Clear & Deploy

## Step 1: Clear All Caches
```bash
# Clear build cache
rm -rf dist node_modules/.vite

# Rebuild
npm run build
```

## Step 2: Clear Browser Cache
1. Open browser Developer Tools (F12)
2. Right-click on refresh button
3. Select "Empty Cache and Hard Reload"

OR

1. Press Ctrl+Shift+Delete
2. Clear "Cached images and files"
3. Reload page

## Step 3: Deploy Fresh Version

### Vercel
```bash
vercel --prod --force
```

### Netlify
```bash
# Delete old deployment
netlify sites:delete

# Deploy fresh
netlify deploy --prod --dir=dist
```

## Step 4: Verify Fix
- Open in incognito/private window
- Test Gemini model selection
- Should now use gemini-1.5-flash (not gemini-2.0-flash-exp)

## Alternative: Add Cache Busting
Add this to vite.config.js:
```js
export default defineConfig({
  plugins: [react()],
  build: {
    rollupOptions: {
      output: {
        entryFileNames: `assets/[name].[hash].js`,
        chunkFileNames: `assets/[name].[hash].js`,
        assetFileNames: `assets/[name].[hash].[ext]`
      }
    }
  }
})
```