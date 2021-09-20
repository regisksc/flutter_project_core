import 'package:mocktail/mocktail.dart';
import 'fakes.dart';

void registerFakesAndMocks() {
  registerFallbackValue(HttpRequestParamsFake());
}
