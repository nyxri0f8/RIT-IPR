# RIT IPR 🎓

**Rajalakshmi Institute of Technology**  
AI-Powered Patent Filing Assistant for Indian Patent Office (IPO)

*Believe in the Possibilities*

## ✨ Features

### 🔐 User Authentication
- Secure login and registration system
- Cookie-based session management (30-day auto-login)
- API key storage for Claude and Gemini
- No server required - all data stored locally

### 🤖 Dual AI Support
- **Claude Sonnet 4**: Direct browser access or API key
- **Gemini 2.0 Flash**: Free API key from Google AI Studio
- Switch between models for best results

### 📊 Comprehensive Patent Analysis
- Innovation, Novelty, and Readiness scoring
- Prior art search and comparison
- Patent abstract generation
- Technical description drafting
- Patent claims creation
- IPC classification codes
- Grant probability assessment

### 📄 Professional PDF Reports
- Beautifully formatted patent reports
- RIT branding and color scheme
- Multi-page support with auto-pagination
- Tables for scores, inventors, and IPC codes
- Downloadable with descriptive filenames

### 📋 IPO Form Generation
- Auto-generates all Indian Patent Office forms
- Form 1, 2, 3, 5, 26 + NOC documents
- Pre-filled with your details
- Ready for submission

### 🎨 Modern UI/UX
- Clean white, blue, and orange color scheme
- RIT logo and branding throughout
- Responsive design for all devices
- Professional academic appearance

## About

Developed for Rajalakshmi Institute of Technology to streamline the patent filing process for students, faculty, and researchers. This platform leverages cutting-edge AI to make intellectual property protection accessible and efficient.

## Quick Start

### Installation

```bash
npm install
```

### Development

```bash
npm run dev
```

Open [http://localhost:3000](http://localhost:3000) in your browser.

### First Time Setup

1. Create an account with your details
2. (Optional) Add API keys for AI models
3. Start filing patents!

### Build for Production

```bash
npm run build
```

The production-ready files will be in the `dist` folder.

## Documentation

- **[USER_GUIDE.md](USER_GUIDE.md)** - Complete user guide for filing patents
- **[FEATURES.md](FEATURES.md)** - Detailed feature documentation
- **[DEPLOYMENT.md](DEPLOYMENT.md)** - Deployment instructions
- **[COLOR_SCHEME.md](COLOR_SCHEME.md)** - Design system documentation

## Deployment Options

### 1. Vercel (Recommended)
```bash
npm install -g vercel
vercel
```

### 2. Netlify
```bash
npm run build
# Drag and drop the 'dist' folder to netlify.com/drop
```

### 3. GitHub Pages
```bash
npm run build
# Push the 'dist' folder to gh-pages branch
```

### 4. Cloudflare Pages
- Connect your GitHub repo
- Build command: `npm run build`
- Output directory: `dist`

## API Keys

- **Claude**: Uses direct browser access (no key needed)
- **Gemini**: Get free API key from [Google AI Studio](https://aistudio.google.com/apikey)

## Tech Stack

- React 18
- Vite
- jsPDF + jsPDF-AutoTable (PDF generation)
- js-cookie (session management)
- Claude API (Anthropic)
- Gemini API (Google)

## Key Dependencies

```json
{
  "react": "^18.3.1",
  "react-dom": "^18.3.1",
  "jspdf": "^2.5.2",
  "jspdf-autotable": "^3.8.4",
  "js-cookie": "^3.0.5"
}
```

## Institution

**Rajalakshmi Institute of Technology**  
Chennai, Tamil Nadu, India  
[www.ritchennai.edu.in](https://www.ritchennai.edu.in)

## License

MIT

---

*Developed with ❤️ for RIT Innovation & IPR Cell*
