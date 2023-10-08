import 'package:flutter/foundation.dart';

class Logger {
  static prints(dynamic value) {
    if (kDebugMode) {
      print(value);
    }
  }
}
