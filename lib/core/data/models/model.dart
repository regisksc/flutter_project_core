import '../../../core.dart';

abstract class Model extends Equatable {
  Map<String, dynamic> get toMap;
  BaseEntity get toEntity;
}
