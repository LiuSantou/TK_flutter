export async function fetchCharacters() {
  const response = await fetch('http://localhost:3000/api/characters');
  if (!response.ok) {
    throw new Error('Failed to fetch characters');
  }
  return response.json();
}