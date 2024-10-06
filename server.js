import express from 'express';
import cors from 'cors';
import fs from 'fs/promises';

const app = express();
const port = 3000;

app.use(cors());

app.get('/api/characters', async (req, res) => {
  try {
    const data = await fs.readFile('characters.json', 'utf8');
    const characters = JSON.parse(data);
    res.json(characters);
  } catch (error) {
    console.error('Error reading character data:', error);
    res.status(500).json({ error: 'Error reading character data' });
  }
});

app.get('/api/characters/:id', async (req, id) => {
  try {
    const data = await fs.readFile('characters.json', 'utf8');
    const characters = JSON.parse(data);
    const character = characters.find(c => c.id === parseInt(req.params.id));
    if (character) {
      res.json(character);
    } else {
      res.status(404).json({ error: 'Character not found' });
    }
  } catch (error) {
    console.error('Error reading character data:', error);
    res.status(500).json({ error: 'Error reading character data' });
  }
});

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});