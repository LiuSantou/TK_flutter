class Character {
  final int id;
  final String name;
  final int attack;
  final int defense;
  final int health;
  int morale;

  Character({
    required this.id,
    required this.name,
    required this.attack,
    required this.defense,
    required this.health,
    this.morale = 0,
  });

  factory Character.fromMap(Map<String, dynamic> map) {
    return Character(
      id: map['id'],
      name: map['name'],
      attack: map['attack'],
      defense: map['defense'],
      health: map['health'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'attack': attack,
      'defense': defense,
      'health': health,
    };
  }
}