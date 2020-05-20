// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_sandbox/widgets/cupertino_widget.dart';

void main() {
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
    // Verify that there are 3 Icon widgets rendered 
    expect(findIcon, findsNWidgets(3));
  });

  testWidgets('Cupertino widget displays all required sub-widgets test', (WidgetTester tester) async {
    // Add a Cupertino widget to the tester
    final text = Text('My favorite car is the Tesla roadster!');
    final image = Image.asset('images/tesla.jpg');
    final icon = Icon(Icons.drive_eta);
    await tester.pumpWidget(CupertinoWidget(text: text, image: image, icon: icon));
    // Verify that the sub-widgets render on the screen
    expect(find.byWidget(text), findsOneWidget);
    expect(find.byWidget(image), findsOneWidget);
    expect(find.byWidget(icon), findsOneWidget);
  });
}
