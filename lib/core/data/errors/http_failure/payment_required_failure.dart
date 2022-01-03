import '../../../../core.dart';

class PaymentRequiredFailure extends HttpFailure {
  const PaymentRequiredFailure({String? message, int? code})
      : super(
          code,
          message: message ?? ErrorStrings.unauthorized,
          title: '$code Erro de acesso',
        );
}
