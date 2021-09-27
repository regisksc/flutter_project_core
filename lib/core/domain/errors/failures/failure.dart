import '../../../../core.dart';

abstract class Failure extends Equatable with Exception {
  const Failure({this.title = 'Erro', this.userMessage, this.loggingMessage});

  final String? title;
  final String? loggingMessage;
  final String? userMessage;

  @override
  List<Object?> get props => [title, loggingMessage, userMessage];

  @override
  String toString() => loggingMessage ?? userMessage ?? '';
}
