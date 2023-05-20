import 'dart:convert';
import 'dart:io';

import 'package:fimber_io/fimber_io.dart';
import 'package:service_pro/core/models/client_model.dart';
import 'package:service_pro/dtos/paginated_result.dart';

import '../base_exception.dart';
import '../constants/constants.dart';
import '../enums/enums.dart';
import '../models/user_details.dart';
import '../models/user_model.dart';
import 'base_http_service.dart';

class UserService extends BaseHttpService {
  static const _registerPath = 'Authenticate/register';
  static const _usersPath = 'Users';
  static const _getUsersPath = 'Users/paginated';
  static const _getClientsPath = 'Users/clients';
  static const _createClientPath = 'Users/createClient';

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

  Future<PaginatedResult<UserDetails>> getUsers(
    int pageIndex,
    int itemsNumber,
    String searchTerm,
  ) async {
    try {
      final res = await post(
        buildUri(
          Constants.apiBaseUrl,
          _getUsersPath,
        ),
        json.encode(
          {
            'pageIndex': pageIndex,
            'itemsNumber': itemsNumber,
            'searchTerm': searchTerm,
          },
        ),
        token,
      );
      if (res.statusCode == HttpStatus.ok) {
        Map<String, dynamic> body = jsonDecode(res.body);
        PaginatedResult<UserDetails> result = PaginatedResult.fromJson(
          body,
          (jsonData) => UserDetails.fromJson(jsonData),
        );
        return result;
      }
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
    return PaginatedResult(rowscount: 0, data: []);
  }

  Future<List<ClientModel>> getClients() async {
    try {
      final res = await get(
        buildUri(
          Constants.apiBaseUrl,
          _getClientsPath,
        ),
        token,
      );
      if (res.statusCode == HttpStatus.ok) {
        List<dynamic> body = jsonDecode(res.body);
        List<ClientModel> result = body
            .map(
              (item) => ClientModel.fromJson(item),
            )
            .toList();
        return result;
      }
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
    return List<ClientModel>.empty();
  }

  Future<ClientModel?> getUserById(int id) async {
    try {
      final res = await get(
        buildUri(
          Constants.apiBaseUrl,
          "$_usersPath/$id",
        ),
        token,
      );
      if (res.statusCode == HttpStatus.ok) {
        Map<String, dynamic> body = jsonDecode(res.body);
        ClientModel result = ClientModel.fromJson(body);
        return result;
      }
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
    return null;
  }

  Future<dynamic> deleteUser(
    int userId,
  ) async {
    try {
      final res = await delete(
        buildUri(
          Constants.apiBaseUrl,
          "Users/$userId/fromUser/$loggedInUserId",
        ),
        token,
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
        errorId: 'delete_user_error',
      );
    }
  }

  Future<dynamic> createClient(
    ClientModel model,
  ) async {
    try {
      final res = await post(
        buildUri(
          Constants.apiBaseUrl,
          _createClientPath,
        ),
        json.encode(
          model,
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

  Future<dynamic> updateAccountDetails(
    ClientModel model,
  ) async {
    try {
      final res = await put(
        buildUri(
          Constants.apiBaseUrl,
          _usersPath,
        ),
        json.encode(
          model,
        ),
        token,
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
