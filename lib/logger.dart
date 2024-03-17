import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

var logger = Logger();

void initLogger() {
  FlutterError.onError = (details) {
    logger.e(details);
    if (kReleaseMode) {
      exit(1);
    }
  };
  if (kDebugMode) {
    logger = Logger(
      printer: PrettyPrinter(),
    );
  }
  logger.i("start app");
}