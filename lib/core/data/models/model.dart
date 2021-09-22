import '../../../core.dart';

abstract class Model extends Equatable {
  Map<String, dynamic> get toMap;
  Entity get toEntity;
}
