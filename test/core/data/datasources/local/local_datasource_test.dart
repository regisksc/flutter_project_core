// Dart imports:
import 'dart:convert';

import 'package:faker/faker.dart';
import 'package:flutter_project_core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/constants/data_type_test_constants.dart';

// Project imports:

class StorageMock extends Mock implements FlutterSecureStorage {}

void main() {
  late StorageMock storageMock;
  late LocalDatasource sut;
  setUp(() {
    storageMock = StorageMock();
    sut = LocalDatasource(storageMock);
  });

  test(
    'should properly save data',
    () async {
      // arrange
      final key = faker.lorem.word();
      final value = json.encode(anyMap);
      when(() => storageMock.write(key: key, value: value)).thenAnswer((_) => Future.value());

      // act
      sut.save(key: key, value: value);

      // assert
      verify(() => storageMock.write(key: key, value: value));
    },
  );

  test(
    'should properly retrieve data',
    () async {
      // arrange
      final key = faker.lorem.word();
      final value = json.encode(anyMap);
      when(() => storageMock.containsKey(key: key)).thenAnswer((_) async => true);
      when(() => storageMock.read(key: key)).thenAnswer((_) async => value);

      // act
      final result = await sut.read(key);

      // assert
      verify(() => storageMock.containsKey(key: key));
      verify(() => storageMock.read(key: key));
      expect(result, equals(value));
    },
  );
}
