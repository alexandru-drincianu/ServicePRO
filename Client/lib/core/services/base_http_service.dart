import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../locator.dart';
import 'user_settings_service.dart';

// TODO: check all methods

/// [BaseHttpService] is the service used for managing Http requests.
/// All future HttpServices can extend this service in order to call get, post, put, delete methods.
class BaseHttpService {
  static const _timeout = Duration(seconds: 15);
  final _userSettingsService = locator<UserSettingsService>();

  String? get token => _userSettingsService.user?.token;
  int? get loggedInUserId => _userSettingsService.user?.id;

  Future<Response> get(String path, [String? token]) async {
    var response = await http
        .get(Uri.parse(path), headers: _getHeaders(token))
        .timeout(_timeout);

    return response;
  }

  Future<Response> post(
    String path,
    Object? body, [
    String? token,
  ]) async {
    var response = await http
        .post(
          Uri.parse(path),
          headers: _getHeaders(token),
          body: body,
        )
        .timeout(_timeout);

    return response;
  }

  Future<Response> put(
    String path,
    Object? body, [
    String? token,
  ]) async {
    var response = await http
        .put(
          Uri.parse(path),
          headers: _getHeaders(token),
          body: body,
        )
        .timeout(_timeout);

    return response;
  }

  Future<Response> delete(String path, [String? token]) async {
    var response = await http
        .delete(Uri.parse(path), headers: _getHeaders(token))
        .timeout(_timeout);

    return response;
  }

  String buildUri(String baseUri, String resource) {
    if (!baseUri.endsWith('/')) {
      baseUri = '$baseUri/';
    }

    return baseUri + resource;
  }

  Map<String, String> _getHeaders(String? token) {
    if (token != null) {
      return {
        'content-type': 'application/json',
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
    }
    return {'content-type': 'application/json', 'accept': 'application/json'};
  }
}
