import 'dart:convert';

import 'package:fimber_io/fimber_io.dart';

import '../base_exception.dart';
import '../constants/constants.dart';
import '../models/user_model.dart';
import 'base_http_service.dart';

// TODO: add documentation
class LoginService extends BaseHttpService {
  // TODO: a path rather than a resource
  static const _loginResourceName = 'Authenticate/login';

  // TODO: make parameters named
  Future<UserModel> login(String username, String password) async {
    try {
      final res = await post(
        buildUri(
          Constants.apiBaseUrl,
          _loginResourceName,
        ),
        json.encode(
          {
            'username': username,
            'password': password,
          },
        ),
      );

      final body = jsonDecode(res.body);
      if (res.statusCode != 200) {
        final exception = BaseException.fromJson(
          json: body,
          errorId: 'login_error',
          statusCode: res.statusCode,
        );
        Fimber.e(exception.message ?? '');
        throw exception;
      }
      return UserModel.fromJson(body);
    } on BaseException {
      rethrow;
    } catch (e, stacktrace) {
      Fimber.e(
        'Unhandled error',
        ex: e,
        stacktrace: stacktrace,
      );
      throw const BaseException(
        errorId: 'login_error',
      );
    }
  }
}
