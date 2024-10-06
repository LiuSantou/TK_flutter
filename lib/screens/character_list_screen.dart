import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/game_state.dart';
import '../models/character.dart';

class CharacterListScreen extends StatelessWidget {
  const CharacterListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Characters'),
      ),
      body: Consumer<GameState>(
        builder: (context, gameState, child) {
          return ListView.builder(
            itemCount: gameState.characters.length,
            itemBuilder: (context, index) {
              Character character = gameState.characters[index];
              return ListTile(
                title: Text(character.name),
                subtitle: Text('Attack: ${character.attack}, Defense: ${character.defense}, Health: ${character.health}'),
              );
            },
          );
        },
      ),
    );
  }
}