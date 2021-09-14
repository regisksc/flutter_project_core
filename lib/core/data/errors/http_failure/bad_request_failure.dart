import '../../../../core.dart';
import '../../../resources/constants/constants.dart';
import 'http_base_failure.dart';

class BadRequestFailure extends HttpFailure {
  const BadRequestFailure({String? message, int? code})
      : super(
          code,
          message: message ?? ErrorStrings.badRequest,
          title: '${code ?? ''} - Falha ao processar a requisição',
        );
}
