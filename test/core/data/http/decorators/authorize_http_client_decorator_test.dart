import 'package:flutter_project_core/core.dart';
import 'package:flutter_project_core/core/exports/test_dependencies.dart';

import '../../../../test_utils/mocks/test_mocks.dart';

void main() {
  late AuthorizeHttpClientDecorator authorizeHttpClientDecorator;
  late StorageMock storageMock;
  late HttpClientMock httpClientMock;

  setUp(() {
    httpClientMock = HttpClientMock();
    storageMock = StorageMock();
    authorizeHttpClientDecorator = AuthorizeHttpClientDecorator(
      decoratee: httpClientMock,
      localStorage: storageMock,
    );
  });

  When mockRequest() => when(
        () => httpClientMock.request(
          method: any(named: 'method'),
          url: any(named: 'url'),
          body: any(named: 'body'),
          headers: any(named: 'headers'),
          queryParameters: any(named: 'queryParameters'),
        ),
      );

  void mockLocalStorageToken() {
    when(() => storageMock.read('token')).thenAnswer((_) async => 'token');
    when(() => storageMock.delete('token')).thenAnswer((_) => Future.value());
  }

  void mockSuccessRequest() {
    mockLocalStorageToken();
    mockRequest().thenAnswer((_) => Future.value(HttpResponse(code: httpOk)));
  }

  void mockFailedRequest(HttpFailure failure) {
    mockLocalStorageToken();
    mockRequest().thenThrow(failure);
  }

  test('should call http request with token on headers', () async {
    // arrange
    mockSuccessRequest();

    // act
    await authorizeHttpClientDecorator.request(method: httpGet, url: 'url');

    // assert
    verify(
      () => httpClientMock.request(
        method: any(named: 'method'),
        url: any(named: 'url'),
        body: any(named: 'body'),
        headers: {
          'authorization': 'token',
        },
        queryParameters: any(named: 'queryParameters'),
      ),
    );
  });

  test('should delete token from storage if error is ForbiddenFailure', () async {
    // arrange
    mockFailedRequest(const ForbiddenFailure());

    // act
    try {
      await authorizeHttpClientDecorator.request(method: httpGet, url: 'url');
    } on HttpFailure catch (error) {
      expect(error, isA<ForbiddenFailure>());
      verify(() => storageMock.delete('token'));
    }
  });

  test('should not delete token from storage if error is not ForbiddenFailure', () async {
    // arrange
    mockFailedRequest(const BadRequestFailure());

    // act
    try {
      await authorizeHttpClientDecorator.request(method: httpGet, url: 'url');
    } on HttpFailure catch (error) {
      expect(error, isA<BadRequestFailure>());
      verifyNever(() => storageMock.delete('token'));
    }
  });
}
