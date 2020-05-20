// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_sandbox/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());
    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('One Text widget on screen test.', (WidgetTester tester) async {
    // Request specific screen resolution for test
    await tester.binding.setSurfaceSize(
      Size(2436, 1125), // iPhone X screen resolution
    );
    // Add a sample widget to the tester
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(),
          body: Container(
            child: Text("This is sample text."),
          ),
        ),
      ),
    );
    // Find the added Text widget
    final Finder findText = find.text('This is sample text.');
    // Verify that there is 1 only text widget
    expect(findText, findsOneWidget);
  });

  testWidgets('Multiple Icon widgets on screen test.',
      (WidgetTester tester) async {
    // Add Icon widgets to the tester
    await tester.pumpWidget(
      MaterialApp(
        home: Column(
          children: <Widget>[
            Icon(Icons.check),
            Icon(Icons.check),
            Icon(Icons.check),
          ],
        ),
      ),
    );
    // Find the added Icon widgets
    final Finder findIcon = find.byIcon((Icons.check));
    // Verify that there are 3 Icon widgets
    expect(findIcon, findsNWidgets(3));
  });
}
