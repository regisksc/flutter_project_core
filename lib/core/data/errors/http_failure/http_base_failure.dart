import '../../../domain/errors/errors.dart';

abstract class HttpFailure extends Failure {
  const HttpFailure(
    this.code, {
    String? message,
    String? title,
  }) : super(loggingMessage: message, title: title);

  final int? code;
}
