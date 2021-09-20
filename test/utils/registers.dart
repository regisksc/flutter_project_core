import 'package:flutter_project_core/core/exports/test_dependencies.dart';

import 'fakes.dart';

void registerFakesAndMocks() {
  registerFallbackValue(HttpRequestParamsFake());
}
