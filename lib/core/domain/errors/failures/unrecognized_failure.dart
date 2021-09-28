import 'failures.dart';

class UnrecognizedFailure extends Failure {
  const UnrecognizedFailure({String? loggingMessage, String? userMessage, String? title})
      : super(
          title: title ?? 'Erro desconhecido',
          loggingMessage: loggingMessage ?? 'Ops, algo deu errado. Tente novamente daqui uns minutos',
          userMessage: userMessage ?? 'Ops, algo deu errado. Tente novamente daqui uns minutos',
        );
}
