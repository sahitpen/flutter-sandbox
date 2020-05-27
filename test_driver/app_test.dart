import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  FlutterDriver driver;
  // Connect to the FlutterDriver
  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });
  // After tests are done, close the driver
  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });
  group('Dismissible Demo Test', () {
    // Find Dismissible demo card
    final findDimissibleCard = find.text("Dismissible");
    // Run tests
    test('Tapping Dismissible demo card navigates to Dismissible demo page', () async {
      await driver.tap(findDimissibleCard);
      final findDismissibleTile = find.byValueKey('dismissible_1_text');
      expect(await driver.getText(findDismissibleTile), 'Swipe to dismiss (basic)');
      // Tap the back arrow to get back to home page
      await driver.tap(find.byTooltip('Back'));
    });
  });
  group('Draggable Demo Test', () {
    // Find Draggable demo card
    final findDraggableCard = find.text('Draggable');
    // Run tests
    test('Tapping Draggable demo card navigates to Draggable demo page', () async {
      await driver.tap(findDraggableCard);
      final findDraggableTile = find.byValueKey('Basic');
      expect(await driver.getText(findDraggableTile), 'Basic');
      // Tap the back arrow to get back to home page
      await driver.tap(find.byTooltip('Back'));
    });
  });
}
