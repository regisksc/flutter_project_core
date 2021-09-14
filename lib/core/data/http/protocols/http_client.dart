// Project imports:

import '../../../../core.dart';

abstract class HttpClient {
  Future<Either<Failure, HttpResponse>> request({
    required String url,
    required String method,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  });
}
