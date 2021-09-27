import 'failures.dart';

class UnrecognizedFailure extends Failure {
  const UnrecognizedFailure()
      : super(
          title: 'Erro desconhecido',
          loggingMessage: 'Ops, algo deu errado. Tente novamente daqui uns minutos',
        );
}
