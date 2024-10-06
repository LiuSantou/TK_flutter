import { fetchCharacters } from './api.js';

export async function initGame() {
  const gameContainer = document.getElementById('game-container');
  gameContainer.innerHTML = '<p>Loading characters...</p>';

  try {
    const characters = await fetchCharacters();
    const playerTeam = characters.slice(0, 3); // First 3 characters for player
    const enemyTeam = characters.slice(0, 3);  // Same 3 characters for enemy (for simplicity)

    const formation = createFormation(playerTeam);
    const enemyFormation = createFormation(enemyTeam);

    const battleResult = simulateBattle(formation, enemyFormation);

    displayBattleResult(battleResult);
  } catch (error) {
    gameContainer.innerHTML = '<p>Error loading game data.</p>';
    console.error('Error:', error);
  }
}

function createFormation(characters) {
  return characters.map((character, index) => ({
    ...character,
    position: index + 1,
    currentHealth: character.健康,
    morale: 0
  }));
}

function simulateBattle(playerFormation, enemyFormation) {
  let round = 0;
  const maxRounds = 50;
  const battleLog = [];

  while (round < maxRounds) {
    round++;
    for (let i = 1; i <= 9; i++) {
      const attacker = playerFormation.find(c => c.position === i);
      const defender = enemyFormation.find(c => c.position === i);

      if (attacker && attacker.currentHealth > 0) {
        const damage = calculateDamage(attacker, defender);
        defender.currentHealth = Math.max(0, defender.currentHealth - damage);
        attacker.morale += 10;
        battleLog.push(`Round ${round}: ${attacker.名前} attacks ${defender.名前} for ${damage} damage`);
      }

      if (defender && defender.currentHealth > 0) {
        const damage = calculateDamage(defender, attacker);
        attacker.currentHealth = Math.max(0, attacker.currentHealth - damage);
        defender.morale += 10;
        battleLog.push(`Round ${round}: ${defender.名前} counter-attacks ${attacker.名前} for ${damage} damage`);
      }

      if (isTeamDefeated(playerFormation) || isTeamDefeated(enemyFormation)) {
        return { winner: isTeamDefeated(playerFormation) ? 'Enemy' : 'Player', battleLog };
      }
    }
  }

  return { winner: 'Draw', battleLog };
}

function calculateDamage(attacker, defender) {
  return Math.max(0, attacker.武力 - defender.防御力 / 2);
}

function isTeamDefeated(formation) {
  return formation.every(character => character.currentHealth <= 0);
}

function displayBattleResult(result) {
  const gameContainer = document.getElementById('game-container');
  gameContainer.innerHTML = `
    <h2>Battle Result: ${result.winner} wins!</h2>
    <div id="battle-log">
      ${result.battleLog.map(log => `<p>${log}</p>`).join('')}
    </div>
  `;
}