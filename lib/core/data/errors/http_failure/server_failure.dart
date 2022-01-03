import '../../../../core.dart';

class ServerFailure extends HttpFailure {
  const ServerFailure({String? message, int? code})
      : super(
          code,
          message: message ?? ErrorStrings.server,
          title: '$code Problemas de servidor',
        );
}
