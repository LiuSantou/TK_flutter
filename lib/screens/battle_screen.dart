import 'package:flutter/material.dart';

class BattleScreen extends StatelessWidget {
  const BattleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Battle'),
      ),
      body: const Center(
        child: Text('Battle screen - To be implemented'),
      ),
    );
  }
}