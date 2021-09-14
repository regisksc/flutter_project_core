import '../../../../core.dart';

abstract class Failure extends Equatable with Exception {
  const Failure({this.title = 'Erro', this.message});

  final String? title;
  final String? message;

  @override
  List<Object?> get props => [title, message];

  @override
  String toString() => message ?? '';
}
