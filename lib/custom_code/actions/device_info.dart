// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!

import 'package:device_info_plus/device_info_plus.dart';
import 'package:logging_to_logcat/logging_to_logcat.dart';
import 'package:logging/logging.dart';

Future<List<String>> deviceInfo() async {
  Logger.root.activateLogcat();
  final Logger log = Logger("7thLogger");

  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  final String brand = androidInfo.brand;
  final String model = androidInfo.model;
  final String osVersion = androidInfo.version.release;
  log.info('Model: ${androidInfo.model}');
  log.info('Brand: ${androidInfo.brand}');
  log.info('Version ${androidInfo.version}');

  return [brand, model, osVersion];
}
