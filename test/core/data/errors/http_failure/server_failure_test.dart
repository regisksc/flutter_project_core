import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_project_core/core.dart';

void main() {
  test('should throw failure with params', () {
    // arrange
    final randomCode = faker.randomGenerator.integer(500);
    final failure = ServerFailure(code: randomCode, message: 'server');

    // assert
    expect(failure.title, '$randomCode Problemas de servidor');
  });
}
