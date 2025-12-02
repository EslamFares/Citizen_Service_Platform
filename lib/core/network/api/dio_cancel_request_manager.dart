import 'package:dio/dio.dart';

class DioCancelRequestManager {
  static final Map<String, CancelToken> _tokens = {};

  static CancelToken addRequest(String id) {
    final token = CancelToken();
    _tokens[id] = token;
    return token;
  }

  static void cancel(String id, [String? reason]) {
    if (_tokens.containsKey(id)) {
      _tokens[id]?.cancel(reason ?? 'Cancelled by user');
      _tokens.remove(id);
    }
  }

  static void cancelAll() {
    _tokens.forEach((_, token) => token.cancel('Cancelled all'));
    _tokens.clear();
  }
}
