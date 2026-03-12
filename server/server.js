import express from 'express';
import cors from 'cors';
import bcrypt from 'bcryptjs';
import jwt from 'jsonwebtoken';
import dotenv from 'dotenv';
import path from 'path';
import { fileURLToPath } from 'url';
import { userDb, patentDb } from './database-json.js';

dotenv.config();

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();
const PORT = process.env.PORT || 5000;
const JWT_SECRET = process.env.JWT_SECRET || 'your-secret-key-change-in-production';

// Middleware
app.use(cors());
app.use(express.json({ limit: '10mb' }));

// Serve static files from frontend build (dist folder)
app.use(express.static(path.join(__dirname, '../dist')));

// Auth middleware
const authenticateToken = (req, res, next) => {
  const authHeader = req.headers['authorization'];
  const token = authHeader && authHeader.split(' ')[1];

  if (!token) {
    return res.status(401).json({ error: 'Access token required' });
  }

  jwt.verify(token, JWT_SECRET, (err, user) => {
    if (err) {
      return res.status(403).json({ error: 'Invalid or expired token' });
    }
    req.user = user;
    next();
  });
};

// ═══════════════════════════════════
//  AUTH ROUTES
// ═══════════════════════════════════

// Register
app.post('/api/auth/register', async (req, res) => {
  try {
    const { name, email, password, institution, department } = req.body;

    // Validation
    if (!name || !email || !password) {
      return res.status(400).json({ error: 'Name, email, and password are required' });
    }

    if (password.length < 6) {
      return res.status(400).json({ error: 'Password must be at least 6 characters' });
    }

    // Check if user exists
    const existingUser = userDb.findByEmail(email);
    if (existingUser) {
      return res.status(400).json({ error: 'Email already registered' });
    }

    // Hash password
    const hashedPassword = await bcrypt.hash(password, 10);

    // Create user with default institution
    const result = userDb.create(
      name, 
      email, 
      hashedPassword, 
      institution || 'Rajalakshmi Institute of Technology', 
      department
    );

    // Generate token
    const token = jwt.sign(
      { id: result.lastInsertRowid, email },
      JWT_SECRET,
      { expiresIn: '30d' }
    );

    // Get user data
    const user = userDb.findById(result.lastInsertRowid);

    res.status(201).json({
      message: 'Account created successfully',
      token,
      user
    });
  } catch (error) {
    console.error('Register error:', error);
    res.status(500).json({ error: 'Registration failed' });
  }
});

// Login
app.post('/api/auth/login', async (req, res) => {
  try {
    const { email, password } = req.body;

    if (!email || !password) {
      return res.status(400).json({ error: 'Email and password are required' });
    }

    // Find user
    const user = userDb.findByEmail(email);
    if (!user) {
      return res.status(401).json({ error: 'Invalid email or password' });
    }

    // Check password
    const validPassword = await bcrypt.compare(password, user.password);
    if (!validPassword) {
      return res.status(401).json({ error: 'Invalid email or password' });
    }

    // Generate token
    const token = jwt.sign(
      { id: user.id, email: user.email },
      JWT_SECRET,
      { expiresIn: '30d' }
    );

    // Remove password from response
    delete user.password;

    res.json({
      message: 'Login successful',
      token,
      user
    });
  } catch (error) {
    console.error('Login error:', error);
    res.status(500).json({ error: 'Login failed' });
  }
});

// Get current user
app.get('/api/auth/me', authenticateToken, (req, res) => {
  try {
    const user = userDb.findById(req.user.id);
    if (!user) {
      return res.status(404).json({ error: 'User not found' });
    }
    res.json({ user });
  } catch (error) {
    console.error('Get user error:', error);
    res.status(500).json({ error: 'Failed to get user data' });
  }
});

// ═══════════════════════════════════
//  PATENT ROUTES
// ═══════════════════════════════════

// Create patent
app.post('/api/patents', authenticateToken, (req, res) => {
  try {
    const patentData = {
      user_id: req.user.id,
      title: req.body.title,
      problem: req.body.problem,
      components: req.body.components,
      working: req.body.working,
      industry: req.body.industry,
      unique_features: req.body.unique_features,
      innovation_score: req.body.innovation_score,
      novelty_score: req.body.novelty_score,
      readiness_score: req.body.readiness_score,
      grant_probability: req.body.grant_probability,
      status: req.body.status || 'completed',
      analysis_data: req.body.analysis_data || {},
      applicant_data: req.body.applicant_data || {}
    };

    const result = patentDb.create(patentData);

    res.status(201).json({
      message: 'Patent saved successfully',
      patentId: result.lastInsertRowid
    });
  } catch (error) {
    console.error('Create patent error:', error);
    res.status(500).json({ error: 'Failed to save patent' });
  }
});

// Get user's patents
app.get('/api/patents', authenticateToken, (req, res) => {
  try {
    const limit = parseInt(req.query.limit) || 20;
    const patents = patentDb.findByUserId(req.user.id, limit);
    res.json({ patents });
  } catch (error) {
    console.error('Get patents error:', error);
    res.status(500).json({ error: 'Failed to get patents' });
  }
});

// Get single patent
app.get('/api/patents/:id', authenticateToken, (req, res) => {
  try {
    const patent = patentDb.findById(req.params.id, req.user.id);
    if (!patent) {
      return res.status(404).json({ error: 'Patent not found' });
    }
    res.json({ patent });
  } catch (error) {
    console.error('Get patent error:', error);
    res.status(500).json({ error: 'Failed to get patent' });
  }
});

// Update patent status
app.patch('/api/patents/:id', authenticateToken, (req, res) => {
  try {
    const result = patentDb.update(req.params.id, req.user.id, {
      status: req.body.status
    });

    if (result.changes === 0) {
      return res.status(404).json({ error: 'Patent not found' });
    }

    res.json({ message: 'Patent updated successfully' });
  } catch (error) {
    console.error('Update patent error:', error);
    res.status(500).json({ error: 'Failed to update patent' });
  }
});

// Delete patent
app.delete('/api/patents/:id', authenticateToken, (req, res) => {
  try {
    const result = patentDb.delete(req.params.id, req.user.id);

    if (result.changes === 0) {
      return res.status(404).json({ error: 'Patent not found' });
    }

    res.json({ message: 'Patent deleted successfully' });
  } catch (error) {
    console.error('Delete patent error:', error);
    res.status(500).json({ error: 'Failed to delete patent' });
  }
});

// ═══════════════════════════════════
//  GEMINI API KEY ROUTE
// ═══════════════════════════════════

// Gemini API key rotation
let currentKeyIndex = 0;
const geminiApiKeys = process.env.GEMINI_API_KEYS ? process.env.GEMINI_API_KEYS.split(',') : [];

// Get Gemini API key (with rotation)
app.get('/api/gemini-key', (req, res) => {
  try {
    if (geminiApiKeys.length === 0) {
      return res.status(500).json({ error: 'No API keys configured' });
    }

    // Get current key and rotate
    const apiKey = geminiApiKeys[currentKeyIndex];
    currentKeyIndex = (currentKeyIndex + 1) % geminiApiKeys.length;

    res.json({ apiKey });
  } catch (error) {
    console.error('Get API key error:', error);
    res.status(500).json({ error: 'Failed to get API key' });
  }
});

// ═══════════════════════════════════
//  STATS ROUTES
// ═══════════════════════════════════

// Get user stats
app.get('/api/stats', authenticateToken, (req, res) => {
  try {
    const stats = userDb.getStats(req.user.id);
    res.json({ stats });
  } catch (error) {
    console.error('Get stats error:', error);
    res.status(500).json({ error: 'Failed to get statistics' });
  }
});

// ═══════════════════════════════════
//  ADMIN ROUTES (Optional)
// ═══════════════════════════════════

// Get all users (admin only)
app.get('/api/admin/users', authenticateToken, (req, res) => {
  try {
    // Add role check here if needed
    const users = userDb.getAll();
    res.json({ users });
  } catch (error) {
    console.error('Get users error:', error);
    res.status(500).json({ error: 'Failed to get users' });
  }
});

// Get all patents (admin only)
app.get('/api/admin/patents', authenticateToken, (req, res) => {
  try {
    const limit = parseInt(req.query.limit) || 100;
    const patents = patentDb.getAll(limit);
    res.json({ patents });
  } catch (error) {
    console.error('Get all patents error:', error);
    res.status(500).json({ error: 'Failed to get patents' });
  }
});

// ═══════════════════════════════════
//  HEALTH CHECK
// ═══════════════════════════════════

app.get('/api/health', (req, res) => {
  res.json({ 
    status: 'ok', 
    message: 'RIT IPR Backend is running',
    timestamp: new Date().toISOString()
  });
});

// ═══════════════════════════════════
//  SERVE FRONTEND (SPA)
// ═══════════════════════════════════

// Serve frontend for all non-API routes (must be last)
app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname, '../dist/index.html'));
});

// Start server
app.listen(PORT, () => {
  console.log(`
╔═══════════════════════════════════════════╗
║   🚀 RIT IPR Backend Server Running       ║
║   Port: ${PORT}                              ║
║   Environment: ${process.env.NODE_ENV || 'development'}              ║
║   Database: SQLite (rit-ipr.db)           ║
╚═══════════════════════════════════════════╝
  `);
});

export default app;
