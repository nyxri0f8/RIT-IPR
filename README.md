# 🎓 RIT IPR - AI-Powered Patent Filing System

**Rajalakshmi Institute of Technology - Intellectual Property Rights Management System**

An intelligent patent application assistant that helps students and faculty create professional patent documents for the Indian Patent Office using AI analysis and automated form generation.

## ✨ Features

- **🤖 AI Patent Analysis** - Gemini AI evaluates innovation, novelty, and grant probability
- **📄 Smart Document Processing** - OCR support for PDF, Word, and image files
- **📋 Automated Form Generation** - Creates all required IPO forms (Forms 1, 2, 3, 5, 26, NOCs)
- **👥 User Management** - Secure authentication and patent history tracking
- **📊 Visual Analytics** - Interactive charts and scoring dashboards

## 🚀 Quick Start

### Development
```bash
# Install dependencies
npm install
cd server && npm install

# Start development
npm run dev          # Frontend (http://localhost:5173)
cd server && node server.js  # Backend (http://localhost:5000)
```

### Production Deployment
```bash
# Build frontend
npm run build

# Deploy to Railway/Render
# The app will serve both frontend and backend from one server
```

## 📁 Project Structure

```
├── src/                 # React frontend
│   ├── App.jsx         # Main application
│   ├── api.js          # API service layer
│   └── main.jsx        # Entry point
├── server/             # Node.js backend
│   ├── server.js       # Express server
│   ├── database-json.js # Database operations
│   └── package.json    # Backend dependencies
├── public/             # Static assets
├── Procfile           # Railway deployment
├── railway.json       # Railway configuration
└── package.json       # Frontend dependencies
```

## 🔧 Environment Variables

### Frontend (.env)
```env
VITE_API_URL=/api  # Relative path for unified deployment
```

### Backend (server/.env)
```env
PORT=5000
NODE_ENV=production
JWT_SECRET=your-secret-key
GEMINI_API_KEYS=key1,key2,key3,key4,key5
```

## 🛠️ Technology Stack

- **Frontend**: React 18, Vite, JavaScript
- **Backend**: Node.js, Express, SQLite
- **AI**: Google Gemini API
- **OCR**: Tesseract.js, PDF.js, Mammoth.js
- **PDF**: jsPDF with AutoTable
- **Deployment**: Railway (unified frontend + backend)

## 📋 Patent Forms Generated

- **Form 1**: Application for Grant of Patent
- **Form 2**: Complete Specification with Claims
- **Form 3**: Statement and Undertaking
- **Form 5**: Declaration of Inventorship
- **Form 26**: Authorization of Patent Agent
- **NOC-I**: Institutional No Objection Certificate
- **NOC-S**: Student/Author No Objection Certificate

## 🎯 Usage Flow

1. **Register/Login** - Create account or sign in
2. **Upload Document** - PDF, Word, or image files (optional)
3. **Fill Details** - Smart auto-fill or manual entry
4. **AI Analysis** - Get innovation scores and recommendations
5. **Generate Forms** - Download complete patent package
6. **File Patent** - Submit to Indian Patent Office

## 🔐 Security

- JWT-based authentication
- Secure API key rotation
- Input validation and sanitization
- Environment-based configuration

## 📞 Support

For technical support or questions about the RIT IPR system, contact the development team.

---

**© 2024 Rajalakshmi Institute of Technology - All Rights Reserved**