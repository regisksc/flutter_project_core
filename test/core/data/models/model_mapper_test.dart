import 'dart:convert';

import 'package:flutter_project_core/core.dart';
import 'package:flutter_project_core/core/exports/test_dependencies.dart';

import '../../../utils/fixtures/fixture_reader.dart';

class MappableMock extends Model {
  const MappableMock(this.field1, this.field2);

  factory MappableMock.fromJson(Map<String, dynamic> json) => MappableMock(
        json['field1'].toString(),
        json['field2'].toString(),
      );

  final String field1;
  final String field2;

  @override
  List<Object?> get props => [field1, field2];

  @override
  Entity get toEntity => throw UnimplementedError();

  @override
  Map<String, dynamic> get toJson => throw UnimplementedError();
}

void main() {
  late ModelMapper sut;

  setUpAll(() {
    registerFallbackValue(HttpResponse());
    registerFallbackValue(HttpRequestParams(
      url: faker.internet.httpsUrl(),
      httpMethod: HttpMethod.get,
    ));
  });

  setUp(() {
    sut = const ModelMapper();
  });

  group('fetch list test group', () {
    late Map<String, dynamic> bannerListResponse;

    setUp(() {
      bannerListResponse = {
        'data': [
          {'field1': 'a', 'field2': 'a'},
          {'field1': 'b', 'field2': 'b'},
        ]
      };
    });

    test(
      'should return a list of given Object Type on api status 200',
      () async {
        // arrange

        // act
        final result = await sut.mapMany(
          source: bannerListResponse,
          serializer: MappableMock.fromJson,
          keyToMap: 'banners',
        );

        // assert
        expect(result, isA<List>());
        expect(result, isNotEmpty);
      },
    );

    test(
      'should return a list of a single given Object Type on api status 200 when response is not a List',
      () async {
        // arrange
        final bannerResponseItem = bannerListResponse['banners'][0];

        // act
        final result = await sut.mapMany(
          source: bannerResponseItem as Map<String, dynamic>,
          serializer: MappableMock.fromJson,
        );

        // assert
        expect(result, isA<List>());
        expect(result.length, equals(1));
      },
    );
  });
}
