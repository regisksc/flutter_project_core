import 'package:flutter_project_core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should throw failure with params', () {
    // arrange
    const failure = UnrecognizedFailure();

    // assert
    expect(failure.title, 'Erro desconhecido');
    expect(failure.loggingMessage, 'Ops, algo deu errado. Tente novamente daqui uns minutos');
  });
}
