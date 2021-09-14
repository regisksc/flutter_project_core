import '../../../../core.dart';
import '../../../resources/constants/error_strings.dart';

class NotFoundFailure extends HttpFailure {
  const NotFoundFailure({String? message, int? code})
      : super(
          code,
          message: message ?? ErrorStrings.notFound,
          title: '$code Não encontrado',
        );
}
