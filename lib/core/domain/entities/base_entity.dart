import '../../../core.dart';
import '../../data/models/models.dart';

abstract class BaseEntity extends Equatable {
  Model get toModel;
  @override
  bool? get stringify => true;
}
