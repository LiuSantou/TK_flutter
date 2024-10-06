import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/game_state.dart';
import '../models/character.dart';

class FormationScreen extends StatelessWidget {
  const FormationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formation'),
      ),
      body: Consumer<GameState>(
        builder: (context, gameState, child) {
          return Column(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    int row = index ~/ 3;
                    int col = index % 3;
                    Character? character = gameState.formation[row][col];
                    return GestureDetector(
                      onTap: () {
                        // TODO: Implement character selection and placement
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: Center(
                          child: Text(character?.name ?? 'Empty'),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: gameState.characters.length,
                  itemBuilder: (context, index) {
                    Character character = gameState.characters[index];
                    return ListTile(
                      title: Text(character.name),
                      onTap: () {
                        // TODO: Implement character selection for formation
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}