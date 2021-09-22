import 'package:flutter_project_core/core.dart';
import 'package:flutter_project_core/core/exports/test_dependencies.dart';

import '../../../../utils/mocks/test_mocks.dart';

void main() {
  late ModelMock model;
  late Map<String, dynamic> map;
  late List list;
  late MappingStrategy sut;

  setUp(() {
    model = ModelMock();
    map = <String, dynamic>{'field': ''};
    list = [];
    for (int i = 0; i < 2; i++) {
      list.add(Map<String, dynamic>.from(map));
    }
    sut = MultipleOutputMappingStrategy(model.fromMap);
  });

  test(
    'should return a list of needed Object',
    () async {
      // act
      final result = sut<ModelMock>(list);

      // assert
      expect(result, [
        ModelMock().fromMap(map),
        ModelMock().fromMap(map),
      ]);
    },
  );

  test(
    'should throw InvalidMapFailure if input map is not List<Map<String, dynamic>>',
    () async {
      // arrange
      const invalidMap = ['', false, 1];

      // assert
      expect(() => sut<ModelMock>(invalidMap), throwsA(InvalidMapFailure(invalidMap.runtimeType)));
    },
  );
}
