// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';

import 'package:freerasp/freerasp.dart';

/// Starts freeRASP protection of your application with given configuration.
///
/// You can find more details about implementation on GitHub Wiki Page:
/// https://github.com/talsec/Free-RASP-Community/wiki/FlutterFlow-Integration
Future runRASP(
  String watcherMail,
  bool isProd,
  String packageName,
  String signingCertHash,
  String supportedStore,
  String bundleId,
  String teamId,
  Future<dynamic> Function()? onAppIntegrity,
  Future<dynamic> Function()? onObfuscationIssues,
  Future<dynamic> Function()? onDebug,
  Future<dynamic> Function()? onDeviceBinding,
  Future<dynamic> Function()? onDeviceID,
  Future<dynamic> Function()? onPasscode,
  Future<dynamic> Function()? onPrivilegedAccess,
  Future<dynamic> Function()? onSecureHardwareNotAvailable,
  Future<dynamic> Function()? onSimulator,
  Future<dynamic> Function()? onUnofficialStore,
  Future<dynamic> Function()? onHooks,
) async {
  // If it's not Android or iOS, don't try to run it.
  if (!Platform.isAndroid && !Platform.isIOS) {
    return;
  }

  // Create config
  final config = TalsecConfig(
    watcherMail: watcherMail,
    isProd: isProd,
    androidConfig: getAndroidConfig(
      packageName,
      signingCertHash,
      supportedStore,
    ),
    iosConfig: getIOSConfig(teamId, bundleId),
  );

  // Map callbacks to Actions
  final callback = ThreatCallback(
    onAppIntegrity: () async {
      await onAppIntegrity?.call();
    },
    onDebug: () async {
      await onDebug?.call();
    },
    onDeviceBinding: () async {
      await onDeviceBinding?.call();
    },
    onDeviceID: () async {
      await onDeviceID?.call();
    },
    onHooks: () async {
      await onHooks?.call();
    },
    onPasscode: () async {
      await onPasscode?.call();
    },
    onObfuscationIssues: () async {
      await onObfuscationIssues?.call();
    },
    onPrivilegedAccess: () async {
      await onPrivilegedAccess?.call();
    },
    onSecureHardwareNotAvailable: () async {
      await onSecureHardwareNotAvailable?.call();
    },
    onSimulator: () async {
      await onSimulator?.call();
    },
    onUnofficialStore: () async {
      await onUnofficialStore?.call();
    },
  );

  // Attach listener
  Talsec.instance.attachListener(callback);

  // Start freeRASP
  Talsec.instance.start(config);
}

AndroidConfig? getAndroidConfig(
  String packageName,
  String signingCertHash,
  String supportedStore,
) {
  if (!Platform.isAndroid) {
    return null;
  }

  if (packageName.isEmpty || signingCertHash.isEmpty) {
    throw ArgumentError(
      'Package name and signing certificate hashes cannot be empty',
    );
  }

  return AndroidConfig(
    packageName: packageName,
    signingCertHashes: [signingCertHash],
    supportedStores: supportedStore.isNotEmpty ? [supportedStore] : [],
  );
}

IOSConfig? getIOSConfig(
  String teamId,
  String bundleId,
) {
  if (!Platform.isIOS) {
    return null;
  }

  if (bundleId.isEmpty || teamId.isEmpty) {
    throw ArgumentError(
      'Team ID and bundle ID cannot be empty',
    );
  }

  return IOSConfig(bundleIds: [bundleId], teamId: teamId);
}
