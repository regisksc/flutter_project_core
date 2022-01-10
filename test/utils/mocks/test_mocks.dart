// Project imports:

import 'package:flutter_project_core/core.dart';
import 'package:flutter_project_core/core/exports/test_dependencies.dart';

class FailureMock extends Mock with EquatableMixin implements Failure {}

class ConnectionHandlerMock extends Mock implements ConnectionHandler {}

class HttpClientMock extends Mock implements HttpClient {}

class StorageMock extends Mock implements LocalStorage {}
