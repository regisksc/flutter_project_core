import '../../../../core.dart';

class InvalidMethodFailure extends HttpFailure {
  const InvalidMethodFailure({String? message, int? code})
      : super(
          code,
          message: message ?? ErrorStrings.invalidMethod,
          title: '$code Falha ao processar a requisição',
        );
}
