# RIT IPR Portal - Quick Reference Card

## 🚀 Quick Start

### Windows
```bash
start-dev.bat
```

### Linux/Mac
```bash
chmod +x start-dev.sh
./start-dev.sh
```

## 📍 URLs

- Frontend: http://localhost:5173
- Backend: http://localhost:5000
- API Health: http://localhost:5000/api/health

## 🔑 Default Settings

- **Institution**: Rajalakshmi Institute of Technology (automatic)
- **Filing Office**: Chennai
- **Token Expiry**: 30 days

## 📁 Important Files

```
server/
├── server.js       # Backend server
├── database.js     # Database operations
└── .env            # Backend config

src/
├── App.jsx         # Main React app
└── api.js          # API service

.env                # Frontend config (API URL)
```

## 🛠️ Common Commands

### Backend
```bash
cd server
npm install          # Install dependencies
npm run dev          # Start dev server
npm start            # Start production server
```

### Frontend
```bash
npm install          # Install dependencies
npm run dev          # Start dev server
npm run build        # Build for production
npm run preview      # Preview production build
```

### Database
```bash
cd server
rm rit-ipr.db        # Reset database
npm run dev          # Recreate database
```

## 🐛 Troubleshooting

### Backend won't start
```bash
# Check if port 5000 is in use
# Change PORT in server/.env to 5001
```

### Frontend can't connect
```bash
# Check backend is running
curl http://localhost:5000/api/health

# Check .env has correct API URL
VITE_API_URL=http://localhost:5000/api
```

### Database issues
```bash
cd server
rm rit-ipr.db
npm run dev
```

## 📊 API Quick Reference

### Register
```bash
POST /api/auth/register
{
  "name": "John Doe",
  "email": "john@example.com",
  "password": "password123",
  "department": "Computer Science"
}
```

### Login
```bash
POST /api/auth/login
{
  "email": "john@example.com",
  "password": "password123"
}
```

### Create Patent
```bash
POST /api/patents
Authorization: Bearer <token>
{
  "title": "IoT System",
  "problem": "...",
  "components": "...",
  ...
}
```

### Get Patents
```bash
GET /api/patents?limit=20
Authorization: Bearer <token>
```

## 🔐 Security

- Passwords: Hashed with bcrypt
- Auth: JWT tokens (30-day expiry)
- Storage: localStorage (frontend), SQLite (backend)
- CORS: Enabled for localhost

## 📦 Dependencies

### Backend
- express
- cors
- bcryptjs
- jsonwebtoken
- better-sqlite3
- dotenv

### Frontend
- react
- jspdf
- tesseract.js
- pdfjs-dist
- mammoth

## 🎯 User Flow

1. Register → Auto-set institution
2. Login → Get JWT token
3. Create Patent → Upload/Type details
4. Analyze → Gemini AI processes
5. Review → See scores & recommendations
6. Generate Forms → Download PDF
7. History → View all patents

## 📈 Statistics

Available in Account page:
- Total patents
- Completed patents
- Average innovation score
- Average novelty score
- Average readiness score

## 🌐 Deployment

### Backend
- Heroku: `heroku create && git push heroku main`
- Railway: Connect GitHub repo
- Render: Connect GitHub repo

### Frontend
- Vercel: `vercel --prod`
- Netlify: `netlify deploy --prod`

## 📞 Support

Check these files for help:
- `FULLSTACK_SETUP.md` - Complete setup guide
- `BACKEND_SETUP.md` - Backend details
- `server/README.md` - API documentation
- `BACKEND_INTEGRATION_COMPLETE.md` - What's new

## ✅ Testing Checklist

- [ ] Backend starts on port 5000
- [ ] Frontend starts on port 5173
- [ ] Can register new user
- [ ] Can login
- [ ] Institution shows "Rajalakshmi Institute of Technology"
- [ ] Can create patent
- [ ] Can view history
- [ ] Can download PDF
- [ ] Can logout

## 🎉 Success Indicators

✅ Backend console shows: "RIT IPR Backend Server Running"
✅ Frontend loads without errors
✅ Can register and login
✅ Patents save to database
✅ History loads from database

---

**Quick Help**: If stuck, restart both servers and clear browser cache!
