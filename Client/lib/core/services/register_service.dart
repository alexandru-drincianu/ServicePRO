import 'dart:convert';

import 'package:fimber_io/fimber_io.dart';

import '../base_exception.dart';
import '../constants/constants.dart';
import '../enums/enums.dart';
import '../models/user_model.dart';
import 'base_http_service.dart';

class RegisterService extends BaseHttpService {
  static const _registerPath = 'Authenticate/register';

  Future<dynamic> register(
    String username,
    String password,
    String fullname,
    UserRole role,
  ) async {
    try {
      final res = await post(
        buildUri(
          Constants.apiBaseUrl,
          _registerPath,
        ),
        json.encode(
          {
            'username': username,
            'password': password,
            'fullName': fullname,
            'role': role.index,
          },
        ),
      );
      return res;
    } on BaseException {
      rethrow;
    } catch (e, stacktrace) {
      Fimber.e(
        'Unhandled error',
        ex: e,
        stacktrace: stacktrace,
      );
      throw const BaseException(
        errorId: 'registration_error',
      );
    }
  }
}
