import '../../../core.dart';

class InvalidMapFailure extends Failure {
  InvalidMapFailure(Type type) : super(title: 'Invalid subtype', loggingMessage: type.toString());
}
