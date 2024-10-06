class Skill {
  final int id;
  final String name;
  final String description;
  final int moraleCost;

  Skill({
    required this.id,
    required this.name,
    required this.description,
    required this.moraleCost,
  });

  factory Skill.fromMap(Map<String, dynamic> map) {
    return Skill(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      moraleCost: map['morale_cost'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'morale_cost': moraleCost,
    };
  }
}