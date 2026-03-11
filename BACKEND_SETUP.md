# Backend Setup Guide

## Quick Start

### 1. Install Backend Dependencies

```bash
cd server
npm install
```

### 2. Configure Environment

```bash
cp .env.example .env
```

Edit `.env`:
```env
PORT=5000
JWT_SECRET=change-this-to-a-random-secret-key
NODE_ENV=development
```

### 3. Start Backend Server

```bash
npm run dev
```

Server will run on `http://localhost:5000`

### 4. Update Frontend

The frontend needs to be updated to use the backend API instead of cookies.

## What the Backend Does

✅ **User Management**
- Register new users
- Login with email/password
- JWT token authentication
- Default institution: "Rajalakshmi Institute of Technology"

✅ **Patent Storage**
- Save patents to database
- Retrieve user's patent history
- Update patent status
- Delete patents

✅ **Statistics**
- Total patents per user
- Average scores
- Completion rates

✅ **Security**
- Password hashing with bcrypt
- JWT tokens (30-day expiration)
- Protected API routes
- SQL injection prevention

## Database

- **Type**: SQLite (file-based, no installation needed)
- **File**: `rit-ipr.db` (created automatically)
- **Tables**: `users`, `patents`

## API Endpoints

### Auth
- `POST /api/auth/register` - Create account
- `POST /api/auth/login` - Login
- `GET /api/auth/me` - Get current user

### Patents
- `POST /api/patents` - Save patent
- `GET /api/patents` - Get user's patents
- `GET /api/patents/:id` - Get single patent
- `PATCH /api/patents/:id` - Update patent
- `DELETE /api/patents/:id` - Delete patent

### Stats
- `GET /api/stats` - Get user statistics

### Admin
- `GET /api/admin/users` - Get all users
- `GET /api/admin/patents` - Get all patents

## Testing the Backend

### Using cURL

```bash
# Register
curl -X POST http://localhost:5000/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Test User",
    "email": "test@rit.edu",
    "password": "test123",
    "department": "Computer Science"
  }'

# Login
curl -X POST http://localhost:5000/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "test@rit.edu",
    "password": "test123"
  }'
```

### Using Postman

1. Import the API endpoints
2. Set `Authorization: Bearer <token>` for protected routes
3. Test all endpoints

## Frontend Integration

The frontend needs these changes:

1. **API Service**: Create `src/api.js` to handle API calls
2. **Auth**: Use JWT tokens instead of cookies
3. **Storage**: Save/load patents from backend
4. **State**: Update state management

## Production Deployment

### Backend Options:
1. **Heroku**: Easy deployment with free tier
2. **Railway**: Modern platform with free tier
3. **Render**: Free tier available
4. **DigitalOcean**: $5/month droplet
5. **AWS EC2**: Flexible but requires setup

### Steps:
1. Set environment variables
2. Use PostgreSQL instead of SQLite
3. Enable HTTPS
4. Add rate limiting
5. Set up monitoring

## Troubleshooting

**Port already in use:**
```bash
# Change PORT in .env
PORT=5001
```

**Database locked:**
```bash
# Delete and recreate database
rm rit-ipr.db
npm run dev
```

**Module not found:**
```bash
# Reinstall dependencies
rm -rf node_modules
npm install
```

## Next Steps

1. ✅ Backend is ready
2. ⏳ Update frontend to use backend API
3. ⏳ Test integration
4. ⏳ Deploy to production

Would you like me to update the frontend to connect to this backend?
