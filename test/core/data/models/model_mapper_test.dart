import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter_project_core/core.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/mocks/model_mock.dart';
import '../../../utils/mocks/test_mocks.dart';

void main() {
  late Map<String, dynamic> singleMapWithKey;
  late Map<String, dynamic> singleMapWithoutKey;
  late Map<String, dynamic> listOfMap;
  late String fakeName;
  late int fakeAge;
  setUp(() {
    fakeName = faker.person.name();
    fakeAge = Random().nextInt(40);
    singleMapWithKey = {
      'target': {
        'name': fakeName,
        'age': fakeAge,
      }
    };
    singleMapWithoutKey = {
      'name': fakeName,
      'age': fakeAge,
    };
    listOfMap = {
      'target': [
        singleMapWithoutKey,
        singleMapWithoutKey.map((key, value) => MapEntry(key, '$value 2')),
      ]
    };
  });

  group('fetch one object test group', () {
    test(
      'should return a given Object Type on json input when there is a key to map',
      () async {
        // act
        final result = await singleMapWithKey.mapOne(
          serializer: ModelMock.fromJson,
          keyToMap: 'target',
        );

        // assert
        expect(result, isA<ModelMock>());
        expect(result.name, equals(fakeName));
        expect(result.age, equals(fakeAge));
      },
    );

    test(
      'should return a given Object Type on json input when there is no key to map',
      () async {
        // act
        final result = await singleMapWithoutKey.mapOne(
          serializer: ModelMock.fromJson,
        );

        // assert
        expect(result, isA<ModelMock>());
        expect(result.name, equals(fakeName));
        expect(result.age, equals(fakeAge));
      },
    );

    test(
      'should throw when trying to convert a single object on json LIST input',
      () async {
        // act
        final result = listOfMap.mapOne(
          serializer: ModelMock.fromJson,
          keyToMap: 'target',
        );

        // assert
        expect(result, throwsException);
      },
    );

    test(
      'should throw when trying to map an unexistant key on json input',
      () async {
        // arrange
        const wrongKey = 'thisIsJustWrong';

        // act
        final result = listOfMap.mapOne(
          serializer: ModelMock.fromJson,
          keyToMap: wrongKey,
        );

        // assert
        expect(result, throwsException);
      },
    );
  });

  group('fetch list test group', () {
    test(
      'should return a list of given Object Type on api status 200',
      () async {
        // act
        final result = await listOfMap.mapMany(
          serializer: ModelMock.fromJson,
          keyToMap: 'target',
        );

        // assert
        expect(result, isA<List>());
        expect(result, isNotEmpty);
        expect(result[0].name, equals(fakeName));
        expect(result[1].name, equals('$fakeName 2'));
      },
    );

    test(
      'should throw when trying to map an unexistant key on json input',
      () async {
        // arrange
        const wrongKey = 'thisIsJustWrong';

        // act
        final result = listOfMap.mapMany(
          serializer: ModelMock.fromJson,
          keyToMap: wrongKey,
        );

        // assert
        expect(result, throwsException);
      },
    );

    test(
      'should return a list of a single given Object Type on api status 200 when response is not a List',
      () async {
        // arrange
        final bannerResponseItem = Map<String, dynamic>.from(listOfMap['target'][0] as Map);

        // act
        final result = await bannerResponseItem.mapMany(
          serializer: ModelMock.fromJson,
        );

        // assert
        expect(result, isA<List>());
        expect(result.length, equals(1));
      },
    );
  });
}
