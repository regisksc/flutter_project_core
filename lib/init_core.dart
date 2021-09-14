import 'package:logger/logger.dart';

late Logger logger;

Future<void> initCore() async {
  // ignore: invalid_use_of_visible_for_testing_member
  logger = Logger();
}
