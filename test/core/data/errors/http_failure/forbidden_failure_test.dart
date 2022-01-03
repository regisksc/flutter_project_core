import 'package:flutter_project_core/core.dart';
import 'package:flutter_project_core/core/exports/test_dependencies.dart';

void main() {
  test('should throw failure with params', () {
    // arrange
    final randomCode = faker.randomGenerator.integer(500);
    final failure = ForbiddenFailure(code: randomCode, message: 'forbidden');

    // assert
    expect(failure.title, '$randomCode Não autorizado');
  });
}
