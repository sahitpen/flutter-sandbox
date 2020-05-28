import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_sandbox/models/demo_names.dart';
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
  group('HomePage Test', () {
    // Find the vertical scroll list
    final findCategoryList = find.byValueKey('widget_category_list');
    final demoNames = DemoNames.allDemos;
    test('Verify that the category list contains all demo pages', () async {
      // Verify that the category list contains all subcategories
      for (String category in demoNames.keys) {
        final findCategory = find.text(category);
        await driver.scrollUntilVisible(findCategoryList, findCategory, dyScroll: -50);
        expect(await driver.getText(findCategory), category);
        // Verify that each subcategory list contains all demo pages 
        final demoPages = demoNames[category];
        final findDemoList = find.byValueKey(category+'_demos_list');
        for (final demo in demoPages){
          final findDemo = find.text(demo);
          await driver.scrollUntilVisible(findDemoList, findDemo, dxScroll: 50);
          expect(await driver.getText(findDemo), demo);
        }
      }
    });
  });
}
