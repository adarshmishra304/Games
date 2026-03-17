import 'package:flutter/material.dart';
import 'screens/puzzle_screen.dart';
import 'screens/tictactoe_screen.dart';

void main() {
  runApp(const GameHubApp());
}

class GameHubApp extends StatelessWidget {
  const GameHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Game Hub"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [

          // 8 Puzzle Button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(20),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PuzzleScreen(),
                ),
              );
            },
            child: const Text(
              "🧩 8 Puzzle Game",
              style: TextStyle(fontSize: 18),
            ),
          ),

          const SizedBox(height: 20),

          // Tic Tac Toe Button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(20),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TicTacToeScreen(),
                ),
              );
            },
            child: const Text(
              "❌⭕ Tic Tac Toe",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
