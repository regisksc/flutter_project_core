import '../../../../core.dart';
import '../../../resources/constants/error_strings.dart';

class PaymentRequiredFailure extends HttpFailure {
  const PaymentRequiredFailure({String? message, int? code})
      : super(
          code,
          message: message ?? ErrorStrings.unauthorized,
          title: '$code Erro de acesso',
        );
}
