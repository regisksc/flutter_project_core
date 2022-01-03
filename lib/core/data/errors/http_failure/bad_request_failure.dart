import '../../../../core.dart';

class BadRequestFailure extends HttpFailure {
  const BadRequestFailure({String? message, int? code})
      : super(
          code,
          message: message ?? ErrorStrings.badRequest,
          title: '${code ?? ''} - Falha ao processar a requisição',
        );
}
