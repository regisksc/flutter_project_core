// Project imports:

import 'package:flutter_project_core/core.dart';
import 'package:flutter_project_core/core/exports/test_dependencies.dart';

import '../../../../../utils/constants/data_type_test_constants.dart';

class ClientMock extends Mock implements Dio {}

class RequestOptionsMock extends Mock implements RequestOptions {}

void main() {
  late ClientMock client;
  late HttpClient sut;
  late String url;
  late RequestOptionsMock requestOptions;

  setUp(() {
    client = ClientMock();
    requestOptions = RequestOptionsMock();
    sut = HttpAdapter(client);
    url = faker.internet.httpsUrl();
  });

  test(
    'should return a failure on unrecognized http verb',
    () async {
      // act
      final future = await sut.request(url: url, method: 'invalid');

      // assert
      expect(future, throwsA(const UnrecognizedFailure()));
    },
  );

  Function() calledRequest() => () => client.get(
        any(),
        queryParameters: any(named: 'queryParameters'),
        options: any(named: 'options'),
      );

  When mockRequest() => when(calledRequest());

  void mockResponseForCode(int? code, {Map<String, dynamic>? body}) => mockRequest().thenAnswer(
        (_) async => Response(
          statusCode: code,
          data: body,
          requestOptions: requestOptions,
        ),
      );

  test('Should call get with correct values', () async {
    // arrange
    when(() => client.get(url, options: any(named: 'options'), queryParameters: anyMap))
        .thenAnswer((_) async => Response(requestOptions: requestOptions, statusCode: httpOk));

    // act
    sut.request(url: url, method: httpGet, queryParameters: anyMap);

    // assert
    verify(() => client.get(url, options: any(named: 'options'), queryParameters: anyMap));
  });

  test(
    'should return a status 200 response on success',
    () async {
      // arrange
      mockResponseForCode(httpOk, body: anyMap);

      // act
      await sut.request(url: url, method: httpGet);

      // assert
      verify(calledRequest());
      verifyNoMoreInteractions(client);
    },
  );

  test(
    'should return UnrecognizedFailure on failed result',
    () async {
      // arrange
      mockResponseForCode(httpUnauthorized);

      // act
      final response = sut.request(url: url, method: httpGet);

      // assert
      verify(calledRequest());
      expect(response, throwsA(const UnrecognizedFailure()));
      verifyNoMoreInteractions(client);
    },
  );
}
