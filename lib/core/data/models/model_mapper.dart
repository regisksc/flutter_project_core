import '../../../core.dart';

class ModelMapper {
  const ModelMapper();

  Future<Output> mapOne<Output extends Model>({
    required Map<String, dynamic> source,
    required ModelSerializer<Output> serializer,
    String? keyToMap,
  }) async {
    //
    throw UnimplementedError();
  }

  Future<List<Output>> mapMany<Output extends Model>({
    required Map<String, dynamic> source,
    required ModelSerializer<Output> serializer,
    String? keyToMap,
  }) async {
    final mappingTarget = keyToMap != null ? source[keyToMap] : source;

    if (mappingTarget is Iterable) {
      final mapFunction = (json) => serializer(json as Map<String, dynamic>);
      final modelList = mappingTarget.map<Output>(mapFunction).toList();
      return modelList;
    } else {
      return [serializer(mappingTarget as Map<String, dynamic>)];
    }
  }
}
