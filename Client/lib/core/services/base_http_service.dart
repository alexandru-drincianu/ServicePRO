import 'dart:io';

import 'package:camera/camera.dart';
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

  Future<Response> sendPhoto(
    String path,
    XFile photo, [
    String? token,
  ]) async {
    var request = http.MultipartRequest('POST', Uri.parse(path));
    request.headers.addAll(_getHeaders(token));

    var photoStream = http.ByteStream(photo.openRead());
    var photoLength = await photo.length();

    var multipartFile = http.MultipartFile(
      'photo',
      photoStream,
      photoLength,
      filename: photo.path,
    );

    request.files.add(multipartFile);

    var response = await request.send();
    var streamedResponse = await response.stream.toBytes();

    var responseData = String.fromCharCodes(streamedResponse);

    return Response(
      responseData,
      response.statusCode,
      headers: response.headers,
      request: response.request,
    );
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
