import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class VisitAPICall {
  static Future<ApiCallResponse> call({
    String? langue = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'visitAPI',
      apiUrl: 'https://www.jorgeenparis.com/${langue}visiteAPI/',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }

  static dynamic listVisit(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      );
}

class PointAPICall {
  static Future<ApiCallResponse> call({
    String? langue = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'pointAPI',
      apiUrl: 'https://jorgeenparis.com/${langue}pointAPI/',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }

  static dynamic point(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      );
}

class VisitDetailCall {
  static Future<ApiCallResponse> call({
    int? id,
    String? langue = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'visitDetail',
      apiUrl: 'https://jorgeenparis.com/${langue}visiteAPI/${id}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }

  static dynamic visit(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      );
}

class PointDetailCall {
  static Future<ApiCallResponse> call({
    int? id,
    String? langue = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'pointDetail',
      apiUrl: 'https://jorgeenparis.com/${langue}pointAPI/${id}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }

  static dynamic point(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class StepAPICall {
  static Future<ApiCallResponse> call({
    int? idVisite,
    int? idItinerary,
    int? idStep,
    String? langue = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'stepAPI',
      apiUrl:
          'https://jorgeenparis.com/${langue}visiteAPI/${idVisite}/itin/${idItinerary}/step/${idStep}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }

  static dynamic step(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      );
}

class PointVisiteAPICall {
  static Future<ApiCallResponse> call({
    int? idVisite,
    int? idItinerary,
    int? idPoint,
    String? langue = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'pointVisiteAPI',
      apiUrl:
          'https://jorgeenparis.com/${langue}visiteAPI/${idVisite}/itin/${idItinerary}/point/${idPoint}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }

  static dynamic point(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      );
}

class HomeAPICall {
  static Future<ApiCallResponse> call({
    String? langue = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'HomeAPI',
      apiUrl: 'https://jorgeenparis.com/${langue}landingAPI',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }

  static dynamic home(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      );
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
