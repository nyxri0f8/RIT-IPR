# RIT IPR Portal 🚀

AI-powered patent filing system for Rajalakshmi Institute of Technology

[![Deploy](https://img.shields.io/badge/Deploy-Live-success)](https://vercel.com)
[![Backend](https://img.shields.io/badge/Backend-Railway-blue)](https://railway.app)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## 🎯 Overview

Complete full-stack patent filing system with AI-powered analysis, automatic form generation, and professional PDF output. Built specifically for Rajalakshmi Institute of Technology.

## ✨ Features

- 🤖 **AI Analysis** - Gemini AI powered patent analysis
- 📄 **Smart Upload** - PDF, DOC, DOCX, and image support with OCR
- 🎨 **Auto-Fill** - Intelligent form filling from uploaded documents
- 📊 **Scoring System** - Innovation, novelty, and readiness scores
- 📝 **Form Generation** - All Indian Patent Office forms (Form 1, 2, 3, 5, 26, NOC)
- 💾 **Database Storage** - Secure backend with user authentication
- 📱 **Responsive Design** - Works on desktop, tablet, and mobile
- 🔐 **Secure Auth** - JWT token-based authentication
- 📈 **Statistics** - Track your patents and scores
- 🏛️ **Default Institution** - Auto-set to "Rajalakshmi Institute of Technology"

## 🚀 Quick Start

### Local Development

```bash
# Clone repository
git clone https://github.com/YOUR_USERNAME/rit-ipr-portal.git
cd rit-ipr-portal

# Install dependencies
npm install
cd server && npm install && cd ..

# Start both servers
# Windows:
start-dev.bat

# Linux/Mac:
chmod +x start-dev.sh
./start-dev.sh
```

Access:
- Frontend: http://localhost:5173
- Backend: http://localhost:5000

### Deploy to Production

See [DEPLOY_NOW.md](DEPLOY_NOW.md) for step-by-step deployment guide.

## 📁 Project Structure

```
rit-ipr-portal/
├── src/                    # Frontend React app
│   ├── App.jsx            # Main application
│   ├── api.js             # API service layer
│   └── main.jsx           # Entry point
├── server/                # Backend Node.js server
│   ├── server.js          # Express server
│   ├── database-json.js   # Database operations
│   └── package.json       # Backend dependencies
├── public/                # Static assets
├── Documentation/         # Comprehensive guides
└── package.json           # Frontend dependencies
```

## 🛠️ Tech Stack

### Frontend
- React 18.3.1
- Vite 5.4.11
- jsPDF (PDF generation)
- Tesseract.js (OCR)
- PDF.js (PDF parsing)
- Mammoth.js (Word parsing)

### Backend
- Node.js + Express
- JWT Authentication
- bcryptjs (Password hashing)
- JSON file database
- CORS enabled

### AI
- Google Gemini 3 Flash
- 10 API keys with rotation
- Automatic analysis

## 📖 Documentation

- [Quick Start](QUICKSTART.md)
- [Full Stack Setup](FULLSTACK_SETUP.md)
- [Deployment Guide](GITHUB_DEPLOYMENT.md)
- [Deploy Now](DEPLOY_NOW.md)
- [Backend Setup](BACKEND_SETUP.md)
- [API Documentation](server/README.md)
- [User Guide](USER_GUIDE.md)
- [Features](FEATURES.md)

## 🎓 For Students

This system is designed for:
- Final year projects
- Research patent filing
- Innovation documentation
- IPR cell submissions

Default institution is automatically set to "Rajalakshmi Institute of Technology".

## 🔐 Security

- Password hashing with bcrypt
- JWT token authentication (30-day expiry)
- Protected API routes
- SQL injection prevention
- CORS protection
- Environment variables for secrets

## 📊 Database Schema

### Users
- id, name, email, password (hashed)
- institution (default: "Rajalakshmi Institute of Technology")
- department, role, timestamps

### Patents
- id, user_id, title, problem, components
- working, industry, unique_features
- scores (innovation, novelty, readiness, grant probability)
- analysis_data (JSON), applicant_data (JSON)
- status, timestamps

## 🌐 API Endpoints

### Authentication
- `POST /api/auth/register` - Create account
- `POST /api/auth/login` - Login
- `GET /api/auth/me` - Get current user

### Patents
- `POST /api/patents` - Create patent
- `GET /api/patents` - Get user's patents
- `GET /api/patents/:id` - Get single patent
- `PATCH /api/patents/:id` - Update patent
- `DELETE /api/patents/:id` - Delete patent

### Statistics
- `GET /api/stats` - Get user statistics

## 🎨 Design

- Modern gradient design
- Space Grotesk & Syne fonts
- RIT color scheme (Navy Blue & Orange)
- Smooth animations
- Responsive layout

## 📝 License

MIT License - feel free to use for educational purposes

## 👥 Contributors

Built for Rajalakshmi Institute of Technology

## 🆘 Support

For issues or questions:
1. Check the documentation
2. Review troubleshooting guides
3. Create an issue on GitHub

## 🎉 Acknowledgments

- Rajalakshmi Institute of Technology
- Google Gemini AI
- Open source community

---

**Made with ❤️ for RIT**

[Live Demo](https://your-app.vercel.app) | [Documentation](FULLSTACK_SETUP.md) | [Deploy Guide](DEPLOY_NOW.md)
