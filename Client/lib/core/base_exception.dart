import 'dart:io';

/// [BaseException] is the base exception class used across the app. It is usually
/// issued by the service and can contain the error id and the error message.
class BaseException implements Exception {
  const BaseException({
    required this.errorId,
    this.message,
  });

  /// The error translation key
  final String errorId;

  /// The message of this exception
  final String? message;

  @override
  String toString() => errorId;

  factory BaseException.fromJson({
    required Map<String, dynamic> json,
    required String errorId,
    required int statusCode,
  }) {
    final message = statusCode == HttpStatus.unauthorized
        ? json['Unauthorized']['errors'][0]['errorMessage']
        : '1';
    return BaseException(
      errorId: errorId,
      message: message,
    );
  }
}
