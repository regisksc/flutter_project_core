import '../../../../core.dart';

class AuthorizeHttpClientDecorator implements HttpClient {
  AuthorizeHttpClientDecorator({
    required HttpClient decoratee,
    required LocalStorage localStorage,
  })  : _decoratee = decoratee,
        _localStorage = localStorage;

  final HttpClient _decoratee;
  final LocalStorage _localStorage;

  Future<HttpResponse> request({
    required String method,
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      final authorizedHeaders = headers ?? {};
      final token = await _localStorage.read('token');
      if (token != null) authorizedHeaders..addAll({'authorization': token});
      return await _decoratee.request(
        url: url,
        method: method,
        body: body,
        headers: authorizedHeaders,
      );
    } on Failure catch (error) {
      if (error is ForbiddenFailure) await _localStorage.delete('token');
      rethrow;
    }
  }
}
