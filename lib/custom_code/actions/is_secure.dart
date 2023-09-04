// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:safe_device/safe_device.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:logging_to_logcat/logging_to_logcat.dart';
import 'package:logging/logging.dart';

Future<bool> isSecure() async {
  Logger.root.activateLogcat();
  final Logger log = Logger("7thLogger");

  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  bool isReal2 = androidInfo.isPhysicalDevice;

  bool isSafe = true;
  bool isJailBroken = await SafeDevice.isJailBroken;
  bool isReal = await SafeDevice.isRealDevice;
  bool isMockLocation = await SafeDevice.canMockLocation;
  bool isOnExternalStorage = await SafeDevice.isOnExternalStorage;
  bool isDevMode = await SafeDevice.isDevelopmentModeEnable;

  log.info('isSecure initialized');

  if (isJailBroken) {
    //log.info('Root is on');
    isSafe = false;
  } else {
    //log.info('DevMode is off');
  }

  if (isDevMode) {
    //log.info('DevMode is on');
    isSafe = false;
  } else {
    //log.info('DevMode is off');
  }

  if (isMockLocation) {
    //log.info('isMockLocation is on');
    //isSafe = false;
  } else {
    //log.info('isMockLocation is off');
  }

  if (isOnExternalStorage) {
    //log.info('isOnExternalStorage is on');
    isSafe = false;
  } else {
    //log.info('isOnExternalStorage is off');
  }

  if (isReal) {
    log.info('Emulator1 detected');
    //isSafe = false;
  } else {
    log.info('Emulator2 not detected');
  }

  if (isReal2) {
    log.info('Emulator1 detected');
    //isSafe = false;
  } else {
    log.info('Emulator2 not detected');
  }

  return isSafe;
}
