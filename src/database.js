import Dexie from 'dexie';

export const db = new Dexie('ThreeKingdomsDB');

db.version(1).stores({
  characters: '++id, name, attributes',
  skills: '++id, name, moraleRequired, effects'
});

export async function initDb() {
  await db.open();
  console.log("Database initialized");
}