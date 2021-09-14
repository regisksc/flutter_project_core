import 'dart:convert';

import '../../../../core.dart';

class CacheDataDecorator implements RemoteDatasource {
  CacheDataDecorator({
    required this.decoratee,
    required this.stash,
    required this.keyToStoreAt,
  });
  final String keyToStoreAt;
  final RemoteDatasource decoratee;
  final LocalDatasource stash;

  @override
  Future<Either<Failure, List<Output>>> fetchMoreThanOneOutput<Output extends Model>({
    required HttpRequestParams httpParams,
    required ModelSerializer modelSerializer,
  }) async {
    final fetchedModels = await decoratee.fetchMoreThanOneOutput<Output>(
      httpParams: httpParams,
      modelSerializer: modelSerializer,
    );
    return fetchedModels.fold(
      (failure) => Left(failure),
      (success) {
        final copyList = <Output>[];
        success..forEach((model) => copyList.add(model));
        stash.save(
          key: keyToStoreAt,
          value: json.encode(copyList.map((e) => jsonEncode(e.toMap.toString().replaceAll('\n', ''))).toList()),
        );
        return Right(success);
      },
    );
  }

  @override
  Future<Either<Failure, Output>> fetchOneOutput<Output extends Model>({
    required HttpRequestParams httpParams,
    required ModelSerializer modelSerializer,
  }) async {
    final fetchedModel = await decoratee.fetchOneOutput<Output>(
      httpParams: httpParams,
      modelSerializer: modelSerializer,
    );
    return fetchedModel.fold(
      (failure) => Left(failure),
      (success) {
        final copyModel = success;
        stash.save(key: keyToStoreAt, value: copyModel.toMap.toString());
        return Right(success);
      },
    );
  }
}
