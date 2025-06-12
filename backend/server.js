import express from 'express';
import cors from 'cors';
import { Pool } from 'pg';

const app = express();
app.use(cors());
app.use(express.json());

// Replace with your actual RDS credentials
const pool = new Pool({
  host: 'your-rds-endpoint', // e.g. database-1.cle6xyz.us-east-1.rds.amazonaws.com
  user: 'postgres',
  password: 'fGxsU0UB5txlLF4s1xkj',
  database: 'postgres',
  port: 5432
});

pool.connect()
  .then(() => console.log('✅ Connected to PostgreSQL RDS'))
  .catch(err => console.error('❌ DB connection error:', err));

// Test API
app.get('/api/hello', (req, res) => {
  const name = req.query.name || "Tiffin Lover";
  res.json({ message: `Hello, ${name}! Welcome to Tiffin Time Trolls.` });
});

// Save contact
app.post('/api/contact', async (req, res) => {
  const { name } = req.body;
  try {
    await pool.query('INSERT INTO contacts(name) VALUES($1)', [name]);
    res.json({ success: true, message: 'Contact saved!' });
  } catch (err) {
    console.error(err);
    res.status(500).json({ success: false, error: 'DB Error' });
  }
});

app.listen(5000, () => console.log("🚀 Backend running on port 5000"));
