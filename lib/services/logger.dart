import 'package:logger/logger.dart';

class LoggerClass {
  static d(String message) {
    Logger logger = Logger();
    logger.d(message);
  }

  static e(String message) {
    Logger logger = Logger();
    logger.e(message);
  }
}
