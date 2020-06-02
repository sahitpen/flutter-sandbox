import 'package:flutter_test/flutter_test.dart';

void main() {
  group('boolean', () {
    test('Test should result in true', () {
      final val = true;
      expect(val, isTrue);
    });
    test('Test should be false', () {
      final val = false;
      expect(val, false);
    });
  });
}
