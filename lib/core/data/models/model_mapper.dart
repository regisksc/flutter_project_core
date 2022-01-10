import '../../../core.dart';

extension ModelMapper on Map<String, dynamic> {
  Future<Output> mapOne<Output extends Model>({
    required ModelSerializer<Output> serializer,
    String? keyToMap,
  }) async {
    final mappingTarget = keyToMap != null ? this[keyToMap] : this;
    if (mappingTarget == null) {
      throw Exception('the passed keyToMap in .mapOne was not found in $this');
    }
    if (mappingTarget is Iterable) {
      throw Exception('trying to map a list using api mapOne, use api mapMany instead');
    } else {
      return serializer(mappingTarget as Map<String, dynamic>);
    }
  }

  Future<List<Output>> mapMany<Output extends Model>({
    required ModelSerializer<Output> serializer,
    String? keyToMap,
  }) async {
    final mappingTarget = keyToMap != null ? this[keyToMap] : this;
    if (mappingTarget == null) {
      throw Exception('the passed keyToMap in .mapOne was not found in $this');
    }
    if (mappingTarget is Iterable) {
      final modelList = mappingTarget
          .map<Output>(
            (json) => serializer(json as Map<String, dynamic>),
          )
          .toList();
      return modelList;
    } else {
      return [serializer(mappingTarget as Map<String, dynamic>)];
    }
  }
}
