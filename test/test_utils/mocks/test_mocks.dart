// Project imports:

import 'package:flutter_project_core/core.dart';
import 'package:flutter_project_core/core/exports/test_dependencies.dart';

class ModelMock extends Mock with EquatableMixin implements Model {
  dynamic field;

  Model fromMap(Map<String, dynamic> json) {
    field = json['field'];
    return this;
  }

  @override
  List<Object?> get props => [field];
}

class FailureMock extends Mock with EquatableMixin implements Failure {}

class ConnectionHandlerMock extends Mock implements ConnectionHandler {}

class HttpClientMock extends Mock implements HttpClient {}

class StorageMock extends Mock implements LocalStorage {}
