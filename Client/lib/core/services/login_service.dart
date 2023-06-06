import 'dart:convert';

import 'package:fimber_io/fimber_io.dart';
import 'package:service_pro/core/models/UserModels/user_model.dart';

import '../base_exception.dart';
import '../constants/constants.dart';
import 'base_http_service.dart';

class LoginService extends BaseHttpService {
  static const _loginResourceName = 'Authenticate/login';

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
