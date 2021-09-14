import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_project_core/core.dart';

void main() {
  test('isSuccess should return true if http status code is on the success range', () {
    expect(isSuccess(null), false);
    expect(isSuccess(100), false);

    expect(isSuccess(httpOk), true);
    expect(isSuccess(httpCreated), true);
    expect(isSuccess(httpAccepted), true);
    expect(isSuccess(httpNoContent), true);

    expect(isSuccess(httpBadRequest), false);
    expect(isSuccess(httpUnauthorized), false);
    expect(isSuccess(httpForbidden), false);
    expect(isSuccess(httpNotFound), false);
    expect(isSuccess(httpMethodNotAllowed), false);
    expect(isSuccess(httpConflict), false);
    expect(isSuccess(httpPreconditionFailed), false);

    expect(isSuccess(httpInternalError), false);
    expect(isSuccess(httpNotImplemented), false);
  });
}
