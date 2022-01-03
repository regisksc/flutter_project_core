// Project imports:

import '../../../../core.dart';

class ConcreteRemoteDatasource implements RemoteDatasource {
  ConcreteRemoteDatasource({
    required this.client,
  });
  final HttpClient client;

  Future<Either<Failure, HttpResponse>> _getRawDataFromRemote(HttpRequestParams httpParams) async {
    final response = await client.request(
      url: httpParams.url,
      method: httpParams.method,
      body: httpParams.body,
      headers: httpParams.headers,
      queryParameters: httpParams.queryParameters,
    );
    return response;
  }

  @override
  Future<Either<Failure, Output>> fetchOneOutput<Output extends Model>({
    required HttpRequestParams httpParams,
    required ModelSerializer modelSerializer,
  }) async {
    final returnedData = await _getRawDataFromRemote(httpParams);
    return returnedData.fold(
      (failure) => Left(failure),
      (result) {
        final mapOne = SingleOutputMappingStrategy(modelSerializer);
        return mapOne<Output>(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, List<Output>>> fetchMoreThanOneOutput<Output extends Model>({
    required HttpRequestParams httpParams,
    required ModelSerializer modelSerializer,
  }) async {
    final returnedData = await _getRawDataFromRemote(httpParams);
    return returnedData.fold(
      (failure) => Left(failure),
      (result) {
        final mapMany = MultipleOutputMappingStrategy(modelSerializer);
        final list = result.data is Iterable ? result.data : result.data['results'];
        return mapMany<Output>(list);
      },
    );
  }
}
