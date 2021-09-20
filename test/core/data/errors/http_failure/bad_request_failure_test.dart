import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_project_core/core.dart';

void main() {
  test('should throw failure with params', () {
    // arrange
    final randomCode = faker.randomGenerator.integer(500);
    final failure = BadRequestFailure(code: randomCode, message: 'bad request');

    // assert
    expect(failure.title, '$randomCode - Falha ao processar a requisição');
  });
}