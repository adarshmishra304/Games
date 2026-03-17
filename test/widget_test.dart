import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:games/main.dart';

void main() {
  testWidgets('GameHub loads correctly', (WidgetTester tester) async {

    // Build the app
    await tester.pumpWidget(const GameHubApp());

    // Verify AppBar title
    expect(find.text("Game Hub"), findsOneWidget);

    // Verify both tabs exist
    expect(find.text("8 Puzzle"), findsOneWidget);
    expect(find.text("Tic Tac Toe"), findsOneWidget);
  });
}
