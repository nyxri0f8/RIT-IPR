# Full Stack Setup Guide - RIT IPR Portal

## 🎯 Overview

The RIT IPR Portal now has a complete backend system with:
- User authentication (JWT tokens)
- Patent storage in database
- Default institution: "Rajalakshmi Institute of Technology"
- User statistics and history

## 📋 Prerequisites

- Node.js (v16 or higher)
- npm or yarn

## 🚀 Quick Start

### Step 1: Install Backend Dependencies

```bash
cd server
npm install
```

### Step 2: Configure Backend

```bash
# Copy environment file
cp .env.example .env

# Edit .env (optional - defaults work fine)
nano .env
```

Default `.env` values:
```env
PORT=5000
JWT_SECRET=your-super-secret-jwt-key-change-this-in-production
NODE_ENV=development
```

### Step 3: Start Backend Server

```bash
# From server directory
npm run dev
```

You should see:
```
╔═══════════════════════════════════════════╗
║   🚀 RIT IPR Backend Server Running       ║
║   Port: 5000                              ║
║   Environment: development                ║
║   Database: SQLite (rit-ipr.db)           ║
╚═══════════════════════════════════════════╝
```

### Step 4: Start Frontend (New Terminal)

```bash
# From project root
npm run dev
```

Frontend will run on `http://localhost:5173`

## ✅ Testing the Integration

### 1. Register a New User

1. Open `http://localhost:5173`
2. Click "Create Account"
3. Fill in:
   - Name: Your Name
   - Email: your@email.com
   - Password: test123
   - Department: Computer Science
4. Click "Create Account"

**Note**: Institution is automatically set to "Rajalakshmi Institute of Technology"

### 2. Create a Patent

1. Click "New Patent"
2. Upload a document or fill manually
3. Click "Analyze with Gemini AI"
4. Review results
5. Click "Generate IPO Forms"

### 3. View History

1. Go to "History" from sidebar
2. See all your saved patents
3. Click "View Details" to load a patent
4. Click "Download PDF" to get the document

### 4. Check Account

1. Go to "Account" from sidebar
2. See your profile info
3. View statistics (total patents, avg scores)

## 🔧 What Changed

### Frontend Changes

1. **Removed Cookie Storage**
   - Now uses localStorage for tokens
   - Backend stores all data

2. **Added API Service** (`src/api.js`)
   - `authAPI` - Login, register, logout
   - `patentAPI` - CRUD operations
   - `statsAPI` - User statistics

3. **Updated Authentication**
   - JWT token-based auth
   - Automatic token refresh
   - Secure logout

4. **Backend Integration**
   - All data saved to database
   - Real-time sync
   - Multi-device support

### Backend Features

1. **User Management**
   - Secure registration
   - Password hashing (bcrypt)
   - JWT authentication
   - Default institution

2. **Patent Storage**
   - Complete patent data
   - Analysis results
   - Applicant information
   - Status tracking

3. **Statistics**
   - Total patents
   - Average scores
   - Completion rates

## 📁 Project Structure

```
rit-ipr/
├── server/                    # Backend
│   ├── server.js             # Express server
│   ├── database.js           # SQLite database
│   ├── package.json          # Backend dependencies
│   ├── .env                  # Environment variables
│   └── rit-ipr.db           # SQLite database file (auto-created)
│
├── src/                      # Frontend
│   ├── App.jsx              # Main React app
│   ├── api.js               # API service layer
│   └── main.jsx             # Entry point
│
├── .env                      # Frontend environment
└── package.json             # Frontend dependencies
```

## 🔐 Security Features

- ✅ Password hashing with bcrypt
- ✅ JWT token authentication
- ✅ Token expiration (30 days)
- ✅ Protected API routes
- ✅ SQL injection prevention
- ✅ CORS protection

## 📊 Database Schema

### Users Table
```sql
CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL,
  institution TEXT DEFAULT 'Rajalakshmi Institute of Technology',
  department TEXT,
  role TEXT DEFAULT 'user',
  created_at DATETIME,
  updated_at DATETIME
);
```

### Patents Table
```sql
CREATE TABLE patents (
  id INTEGER PRIMARY KEY,
  user_id INTEGER,
  title TEXT NOT NULL,
  problem TEXT,
  components TEXT,
  working TEXT,
  industry TEXT,
  unique_features TEXT,
  innovation_score INTEGER,
  novelty_score INTEGER,
  readiness_score INTEGER,
  grant_probability INTEGER,
  status TEXT DEFAULT 'draft',
  analysis_data TEXT,
  applicant_data TEXT,
  created_at DATETIME,
  updated_at DATETIME,
  FOREIGN KEY (user_id) REFERENCES users(id)
);
```

## 🌐 API Endpoints

### Authentication
- `POST /api/auth/register` - Create account
- `POST /api/auth/login` - Login
- `GET /api/auth/me` - Get current user

### Patents
- `POST /api/patents` - Save patent
- `GET /api/patents` - Get user's patents
- `GET /api/patents/:id` - Get single patent
- `PATCH /api/patents/:id` - Update patent
- `DELETE /api/patents/:id` - Delete patent

### Statistics
- `GET /api/stats` - Get user statistics

## 🐛 Troubleshooting

### Backend won't start

**Error**: Port 5000 already in use
```bash
# Change port in server/.env
PORT=5001
```

**Error**: Module not found
```bash
cd server
rm -rf node_modules
npm install
```

### Frontend can't connect to backend

**Check**: Backend is running
```bash
curl http://localhost:5000/api/health
```

**Check**: API URL in frontend `.env`
```env
VITE_API_URL=http://localhost:5000/api
```

### Database issues

**Reset database**:
```bash
cd server
rm rit-ipr.db
npm run dev
```

### CORS errors

**Check**: Backend CORS is enabled (it is by default)

**Check**: Frontend is using correct API URL

## 🚀 Production Deployment

### Backend Deployment Options

1. **Heroku** (Free tier available)
   ```bash
   cd server
   heroku create rit-ipr-backend
   git push heroku main
   ```

2. **Railway** (Free tier)
   - Connect GitHub repo
   - Deploy automatically

3. **Render** (Free tier)
   - Connect GitHub repo
   - Set environment variables

### Frontend Deployment

1. **Vercel** (Recommended)
   ```bash
   npm run build
   vercel --prod
   ```

2. **Netlify**
   ```bash
   npm run build
   netlify deploy --prod
   ```

### Environment Variables for Production

**Backend** (server/.env):
```env
PORT=5000
JWT_SECRET=<generate-strong-secret>
NODE_ENV=production
```

**Frontend** (.env):
```env
VITE_API_URL=https://your-backend.herokuapp.com/api
```

## 📝 Testing Checklist

- [ ] Backend starts successfully
- [ ] Frontend starts successfully
- [ ] Can register new user
- [ ] Can login with credentials
- [ ] Can create patent
- [ ] Can view patent history
- [ ] Can download PDF
- [ ] Can logout
- [ ] Institution defaults to "Rajalakshmi Institute of Technology"
- [ ] Statistics show correctly

## 🎉 Success!

If all steps work, you now have a fully functional full-stack patent filing system with:
- Secure user authentication
- Database storage
- Patent analysis with Gemini AI
- PDF generation
- Complete history tracking

## 📞 Support

For issues:
1. Check console logs (browser & terminal)
2. Verify both servers are running
3. Check API URL configuration
4. Review error messages

## 🔄 Next Steps

1. Add more features (patent search, collaboration)
2. Implement admin dashboard
3. Add email notifications
4. Export to Excel/CSV
5. Add patent status workflow
6. Implement file attachments

Enjoy your full-stack RIT IPR Portal! 🚀
