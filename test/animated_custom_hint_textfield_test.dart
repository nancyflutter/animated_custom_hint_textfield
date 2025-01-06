import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:animated_custom_hint_textfield/animated_custom_hint_textfield.dart';

void main() {
  testWidgets('AnimatedHintTextField widget test', (WidgetTester tester) async {
    // Provide hints for testing
    final testHints = [
      "'Pizza 🍕'",
      "'Burger 🍔'",
      "'Cake 🍰'",
    ];

    // Build the widget
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: AnimatedHintTextField(
          hints: testHints,
          hintChangeDuration: const Duration(seconds: 2),
        ),
      ),
    ));

    // Verify initial state (static text and first hint)
    expect(find.text("Type to search..."), findsOneWidget);
    expect(find.text(testHints[0]), findsOneWidget);

    // Check if the TextField exists
    expect(find.byType(TextField), findsOneWidget);

    // Simulate typing in the TextField
    await tester.enterText(find.byType(TextField), "Burger");
    await tester.pump();

    // Verify hints disappear when typing
    expect(find.text("Type to search..."), findsNothing);
    expect(find.text(testHints[0]), findsNothing);

    // Verify user input appears
    expect(find.text("Burger"), findsOneWidget);

    // Simulate clearing the TextField
    await tester.enterText(find.byType(TextField), "");
    await tester.pump();

    // Verify hints reappear after clearing input
    expect(find.text("Type to search..."), findsOneWidget);
    expect(find.text(testHints[0]), findsOneWidget);

    // Verify hint animation changes after a delay
    await tester.pumpAndSettle(const Duration(seconds: 3));
    expect(find.text(testHints[1]), findsOneWidget); // Next hint should appear
  });
}
