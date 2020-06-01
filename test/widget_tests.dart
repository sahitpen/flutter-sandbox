// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sandbox/bloc/todo_bloc.dart';
import 'package:flutter_sandbox/screens/dismissible_page.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_sandbox/views/examples/cupertino_widget.dart';
import 'package:flutter_sandbox/screens/todo_list_page.dart';

void main() {
  group('Basic widget tests', () {
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
  });

  testWidgets('Cupertino widget displays all required sub-widgets test',
      (WidgetTester tester) async {
    // Add a Cupertino widget to the tester
    final text = Text('My favorite car is the Tesla roadster!');
    final image = Image.asset('images/tesla.jpg');
    final icon = Icon(Icons.drive_eta);
    await tester
        .pumpWidget(CupertinoWidget(text: text, image: image, icon: icon));
    // Verify that the sub-widgets render on the screen
    expect(find.byWidget(text), findsOneWidget);
    expect(find.byWidget(image), findsOneWidget);
    expect(find.byWidget(icon), findsOneWidget);
  });

  testWidgets('Adding a task to the TodoList widget test',
      (WidgetTester tester) async {
    // Add the widget
    await tester.pumpWidget(MaterialApp(
      home: BlocProvider(
        create: (context) => TodoBloc(),
        child: TodoListPage(),
      ),
    ));

    // Enter 'Take out the trash.' into the TextField
    final findTextField = find.byType(TextField);
    await tester.enterText(findTextField, 'Take out the trash.');

    // Press the add button
    final findButton = find.byType(FloatingActionButton);
    await tester.tap(findButton);

    // Build the widget again to reflect changes
    await tester.pump();

    // Verify that the Text was added to the screen
    expect(find.text('Take out the trash.'), findsNWidgets(2));
  });

  group('Dimissible Page widget tests', () {
    final dismissiblePage = MaterialApp(home: DismissiblePage());
    testWidgets('Three dismissible tiles display on screen test',
        (WidgetTester tester) async {
      // Add the DismissiblePage to the tester
      await tester.pumpWidget(dismissiblePage);
      // Verify that the 3 dismissibles show up on screen
      expect(find.byKey(ValueKey('dismissible_1')), findsOneWidget);
      expect(find.byKey(ValueKey('dismissible_2')), findsOneWidget);
      expect(find.byKey(ValueKey('dismissible_3')), findsOneWidget);
    });

    testWidgets(
        'Swiping dismissible tiles in correct direction removes them from screen test',
        (WidgetTester tester) async {
      // Add the DismissiblePage to the tester
      await tester.pumpWidget(dismissiblePage);
      // Perform swipe actions on the widgets in the correct direction
      await tester.drag(
          find.byKey(ValueKey('dismissible_1')), Offset(1000.0, 0.0));
      await tester.drag(
          find.byKey(ValueKey('dismissible_2')), Offset(1000.0, 0.0));
      await tester.drag(
          find.byKey(ValueKey('dismissible_3')), Offset(0.0, 1000.0));
      // Rebuild the widget until animation completes
      await tester.pumpAndSettle();
      // Verify that the 3 dismissibles are no longer on the screen
      expect(find.text('Swipe to dismiss (basic)'), findsNothing);
      expect(find.text('Swipe to dismiss (show snackbar)'), findsNothing);
      expect(find.text('Swipe vertically to dismiss'), findsNothing);
    });

    testWidgets(
        'Swiping dismissible tiles in wrong direction does not remove them from screen test',
        (WidgetTester tester) async {
      // Add the DismissiblePage to the tester
      await tester.pumpWidget(dismissiblePage);
      // Perform swipe actions on the widgets in the correct direction
      await tester.drag(
          find.byKey(ValueKey('dismissible_1')), Offset(0.0, 1000.0));
      await tester.drag(
          find.byKey(ValueKey('dismissible_2')), Offset(0.0, 1000.0));
      await tester.drag(
          find.byKey(ValueKey('dismissible_3')), Offset(1000.0, 0.0));
      // Rebuild the widget until animation completes
      await tester.pumpAndSettle();
      // Verify that the 3 dismissibles are no longer on the screen
      expect(find.text('Swipe to dismiss (basic)'), findsOneWidget);
      expect(find.text('Swipe to dismiss (show snackbar)'), findsOneWidget);
      expect(find.text('Swipe vertically to dismiss'), findsOneWidget);
    });
  });
}
