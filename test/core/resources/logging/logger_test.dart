import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_project_core/core.dart';

void main() {
  setUp(() async {
    await initCore();
  });

  test('loggin methods', () {
    logInfo('Info');
    logDebug('Debug');
    logWarning('Warning');
    logError('Error');
  });
}
