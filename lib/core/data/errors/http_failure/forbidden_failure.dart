import '../../../../core.dart';

class ForbiddenFailure extends HttpFailure {
  const ForbiddenFailure({String? message, int? code})
      : super(
          code,
          message: message ?? ErrorStrings.forbidden,
          title: '$code Não autorizado',
        );
}
