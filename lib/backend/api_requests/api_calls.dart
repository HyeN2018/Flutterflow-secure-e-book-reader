import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';
import '../cloud_functions/cloud_functions.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class TestCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'test',
      apiUrl: 'https://the7th.club/api-app/versionCheck.php',
      callType: ApiCallType.GET,
      headers: {
        'User-Agent': '991783788420',
        'Content-Type': 'Application/JSON',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AuthCall {
  static Future<ApiCallResponse> call({
    String? discordName = '',
    String? lastKey = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'AuthCall',
        'variables': {
          'discordName': discordName,
          'lastKey': lastKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class DeviceCheckCall {
  static Future<ApiCallResponse> call({
    String? discordName = '',
    String? device = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'DeviceCheckCall',
        'variables': {
          'discordName': discordName,
          'device': device,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class DiscordLogCall {
  static Future<ApiCallResponse> call({
    String? discordName = '',
    String? lastKey = '',
    String? ip = '',
    String? brand = '',
    String? device = '',
    String? osVersion = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'DiscordLogCall',
        'variables': {
          'discordName': discordName,
          'lastKey': lastKey,
          'ip': ip,
          'brand': brand,
          'device': device,
          'osVersion': osVersion,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class DiscordLogErrorCall {
  static Future<ApiCallResponse> call({
    String? discordName = '',
    String? lastKey = '',
    String? ip = '',
    String? brand = '',
    String? device = '',
    String? osVersion = '',
    String? error = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'DiscordLogErrorCall',
        'variables': {
          'discordName': discordName,
          'lastKey': lastKey,
          'ip': ip,
          'brand': brand,
          'device': device,
          'osVersion': osVersion,
          'error': error,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class VersionCheckCall {
  static Future<ApiCallResponse> call() async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'VersionCheckCall',
        'variables': {},
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class GetIPCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'GetIP',
      apiUrl: 'https://api.ipify.org?format=json',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic ip(dynamic response) => getJsonField(
        response,
        r'''$.ip''',
      );
}

class SubCheckCall {
  static Future<ApiCallResponse> call({
    String? discordName = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'SubCheckCall',
        'variables': {
          'discordName': discordName,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class UserInfoCall {
  static Future<ApiCallResponse> call({
    String? discordName = '',
    String? lastKey = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'UserInfoCall',
        'variables': {
          'discordName': discordName,
          'lastKey': lastKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class FileAccessCall {
  static Future<ApiCallResponse> call({
    String? discordName = '',
    String? lastKey = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'FileAccess',
      apiUrl: 'https://the7th.club/app-api/fileaccess.php',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/pdf',
        'Authorization':
            'Bearer JhruykFkcmmDDt3dFuXfLstOUgqXrneMlnjXYxtAPE6OHTLrtfDFH1iuYb2PDpnB',
      },
      params: {
        'discord_name': discordName,
        'last_key': lastKey,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
