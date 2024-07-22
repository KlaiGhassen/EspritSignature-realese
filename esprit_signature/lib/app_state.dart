import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import 'backend/api_requests/api_manager.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _search = '';
  String get search => _search;
  set search(String value) {
    _search = value;
  }

  String _sort = '';
  String get sort => _sort;
  set sort(String value) {
    _sort = value;
  }

  final _dashboardManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> dashboard({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _dashboardManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearDashboardCache() => _dashboardManager.clear();
  void clearDashboardCacheKey(String? uniqueKey) =>
      _dashboardManager.clearRequest(uniqueKey);
}
