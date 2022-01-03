import '../../../../core.dart';

class UnauthorizedFailure extends HttpFailure {
  const UnauthorizedFailure({String? message, int? code})
      : super(
          code,
          message: message ?? ErrorStrings.unauthorized,
          title: '$code Erro de acesso',
        );
}
