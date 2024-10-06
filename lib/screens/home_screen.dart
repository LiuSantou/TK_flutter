import 'package:flutter/material.dart';
import 'character_list_screen.dart';
import 'formation_screen.dart';
import 'battle_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Three Kingdoms Strategy'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CharacterListScreen()),
                );
              },
              child: const Text('Characters'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FormationScreen()),
                );
              },
              child: const Text('Formation'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BattleScreen()),
                );
              },
              child: const Text('Battle'),
            ),
          ],
        ),
      ),
    );
  }
}