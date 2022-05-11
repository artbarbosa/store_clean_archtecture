import 'package:flutter_test/flutter_test.dart';

import '../../../../../../mocks/mock.dart';

void main() {
  group('UserEntity - isValid', () {
    test('Should return true', () async {
      final result = userEntity.isValid();

      expect(result, true);
    });
    test('Should return false', () async {
      final result = userEntityInvalid.isValid();

      expect(result, false);
    });
  });
}
