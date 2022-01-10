// Project imports:
import 'dart:convert';

import '../../../../core.dart';

class HttpAdapter implements HttpClient {
  HttpAdapter(Dio client) : _client = client;
  final Dio _client;

  @override
  Future<HttpResponse> request({
    required String method,
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    final options = _getRequestOptions(headers);

    try {
      final response = await _fetchResponse(
        method: method,
        url: url,
        body: body,
        queryParameters: queryParameters,
        options: options,
      );
      if (isSuccess(response?.statusCode)) return _handleSuccess(response!);
      throw const UnrecognizedFailure();
    } on DioError catch (err) {
      // ignore: avoid_print
      print(err.message);
      throw const UnrecognizedFailure();
    }
  }

  Options _getRequestOptions(Map<String, String>? headers) {
    final defaultHeaders = {contentType: applicationJson, accept: applicationJson};
    return Options(headers: defaultHeaders..addAll(headers ?? {}));
  }

  Future<Response?> _fetchResponse({
    required String method,
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    if (method.toLowerCase() == 'get') {
      return _client.get(url, queryParameters: queryParameters, options: options);
    }
  }

  HttpResponse _handleSuccess(Response response) {
    final decoded = json.decode(json.encode(response.data));
    return HttpResponse(
      code: response.statusCode,
      data: decoded,
    );
  }
}
