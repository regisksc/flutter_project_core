import '../../../core.dart';

abstract class Model extends Equatable {
  const Model();
  Map<String, dynamic> get toJson;
  Entity get toEntity;
}

extension EntityConverter on List<Model> {
  List<Output> mapToEntities<Output extends Entity>() {
    final list = <Entity>[];
    list.addAll(map((model) => model.toEntity).toList());
    return list as List<Output>;
  }
}
