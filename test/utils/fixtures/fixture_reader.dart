import 'dart:io';

String fixture(String path) => File('test/utils/fixtures/$path').readAsStringSync();
