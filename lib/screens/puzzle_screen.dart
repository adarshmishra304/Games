import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class PuzzleScreen extends StatefulWidget {
  const PuzzleScreen({super.key});

  @override
  State<PuzzleScreen> createState() => _PuzzleScreenState();
}

class _PuzzleScreenState extends State<PuzzleScreen> {
  List<int> board = [];
  int moves = 0;

  final AudioPlayer _player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    generatePuzzle();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  void generatePuzzle() {
    List<int> nums = List.generate(9, (index) => index);

    do {
      nums.shuffle();
    } while (!isSolvable(nums));

    setState(() {
      board = nums;
      moves = 0;
    });
  }

  bool isSolvable(List<int> arr) {
    int inv = 0;
    for (int i = 0; i < arr.length; i++) {
      for (int j = i + 1; j < arr.length; j++) {
        if (arr[i] != 0 && arr[j] != 0 && arr[i] > arr[j]) {
          inv++;
        }
      }
    }
    return inv % 2 == 0;
  }

  Future<void> moveTile(int index) async {
    int blankIndex = board.indexOf(0);

    int row = index ~/ 3;
    int col = index % 3;
    int blankRow = blankIndex ~/ 3;
    int blankCol = blankIndex % 3;

    if ((row - blankRow).abs() + (col - blankCol).abs() == 1) {
      setState(() {
        board[blankIndex] = board[index];
        board[index] = 0;
        moves++;
      });



      if (isSolved()) {
        await _player.play(AssetSource('sounds/win.mp3'));

        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("🎉 Puzzle Solved!"),
            content: Text("Solved in $moves moves"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  generatePuzzle();
                },
                child: const Text("Play Again"),
              )
            ],
          ),
        );
      }
    }
  }

  bool isSolved() {
    for (int i = 0; i < 8; i++) {
      if (board[i] != i + 1) return false;
    }
    return board[8] == 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("8 Puzzle")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Moves: $moves",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Center(
            child: SizedBox(
              width: 300,
              height: 300,
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  int value = board[index];
                  return GestureDetector(
                    onTap: () => moveTile(index),
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: value == 0 ? Colors.grey[300] : Colors.blue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          value == 0 ? "" : value.toString(),
                          style: const TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: generatePuzzle,
            child: const Text("Restart"),
          )
        ],
      ),
    );
  }
}
