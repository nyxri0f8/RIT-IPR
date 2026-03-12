// API Service for RIT IPR Backend
// When deployed together, use relative path. When separate, use environment variable.
const API_URL = import.meta.env.VITE_API_URL || '/api';

console.log('API URL configured:', API_URL);

// Helper function to get auth token
const getToken = () => localStorage.getItem('rit_ipr_token');

// Helper function to handle API responses
async function handleResponse(response) {
  const data = await response.json();
  
  if (!response.ok) {
    throw new Error(data.error || 'API request failed');
  }
  
  return data;
}

// Auth API
export const authAPI = {
  register: async (userData) => {
    const response = await fetch(`${API_URL}/auth/register`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(userData)
    });
    const data = await handleResponse(response);
    
    // Save token and user
    if (data.token) {
      localStorage.setItem('rit_ipr_token', data.token);
      localStorage.setItem('rit_ipr_user', JSON.stringify(data.user));
    }
    
    return data;
  },

  login: async (credentials) => {
    const response = await fetch(`${API_URL}/auth/login`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(credentials)
    });
    const data = await handleResponse(response);
    
    // Save token and user
    if (data.token) {
      localStorage.setItem('rit_ipr_token', data.token);
      localStorage.setItem('rit_ipr_user', JSON.stringify(data.user));
    }
    
    return data;
  },

  logout: () => {
    localStorage.removeItem('rit_ipr_token');
    localStorage.removeItem('rit_ipr_user');
  },

  getCurrentUser: async () => {
    const token = getToken();
    if (!token) return null;

    try {
      const response = await fetch(`${API_URL}/auth/me`, {
        headers: { 
          'Authorization': `Bearer ${token}`
        }
      });
      return await handleResponse(response);
    } catch (error) {
      // Token expired or invalid
      authAPI.logout();
      return null;
    }
  },

  getStoredUser: () => {
    const user = localStorage.getItem('rit_ipr_user');
    return user ? JSON.parse(user) : null;
  }
};

// Patent API
export const patentAPI = {
  create: async (patentData) => {
    const token = getToken();
    const response = await fetch(`${API_URL}/patents`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${token}`
      },
      body: JSON.stringify(patentData)
    });
    return await handleResponse(response);
  },

  getAll: async (limit = 20) => {
    const token = getToken();
    const response = await fetch(`${API_URL}/patents?limit=${limit}`, {
      headers: {
        'Authorization': `Bearer ${token}`
      }
    });
    return await handleResponse(response);
  },

  getById: async (id) => {
    const token = getToken();
    const response = await fetch(`${API_URL}/patents/${id}`, {
      headers: {
        'Authorization': `Bearer ${token}`
      }
    });
    return await handleResponse(response);
  },

  update: async (id, updates) => {
    const token = getToken();
    const response = await fetch(`${API_URL}/patents/${id}`, {
      method: 'PATCH',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${token}`
      },
      body: JSON.stringify(updates)
    });
    return await handleResponse(response);
  },

  delete: async (id) => {
    const token = getToken();
    const response = await fetch(`${API_URL}/patents/${id}`, {
      method: 'DELETE',
      headers: {
        'Authorization': `Bearer ${token}`
      }
    });
    return await handleResponse(response);
  }
};

// Stats API
export const statsAPI = {
  getUserStats: async () => {
    const token = getToken();
    const response = await fetch(`${API_URL}/stats`, {
      headers: {
        'Authorization': `Bearer ${token}`
      }
    });
    return await handleResponse(response);
  }
};

// Admin API (optional)
export const adminAPI = {
  getAllUsers: async () => {
    const token = getToken();
    const response = await fetch(`${API_URL}/admin/users`, {
      headers: {
        'Authorization': `Bearer ${token}`
      }
    });
    return await handleResponse(response);
  },

  getAllPatents: async (limit = 100) => {
    const token = getToken();
    const response = await fetch(`${API_URL}/admin/patents?limit=${limit}`, {
      headers: {
        'Authorization': `Bearer ${token}`
      }
    });
    return await handleResponse(response);
  }
};

export default {
  auth: authAPI,
  patents: patentAPI,
  stats: statsAPI,
  admin: adminAPI
};
