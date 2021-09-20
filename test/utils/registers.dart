import 'package:flutter_project_core/core.dart';
import 'fakes.dart';

void registerFakesAndMocks() {
  registerFallbackValue(HttpRequestParamsFake());
}
