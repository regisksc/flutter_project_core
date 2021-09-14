import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_project_core/core.dart';

void main() {
  test('should throw failure with params', () {
    // arrange
    const failure = NoConnectionFailure();

    // assert
    expect(failure.title, 'Falha de conexão');
    expect(failure.message, 'Ops, algo deu errado. Tente novamente daqui uns minutos');
  });
}
