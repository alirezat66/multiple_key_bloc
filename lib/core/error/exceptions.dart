import 'package:freezed_annotation/freezed_annotation.dart';
part 'exceptions.freezed.dart';

@freezed
class AppException with _$AppException implements Exception {
  // Network related exceptions
  const factory AppException.connectionTimeout() = ConnectionTimeout;
  const factory AppException.connectionFailed() = ConnectionFailed;
  const factory AppException.serverError([String? message]) = ServerError;

  // Authentication related exceptions
  const factory AppException.unauthorized() = Unauthorized;
  const factory AppException.forbidden() = Forbidden;

  // Data related exceptions
  const factory AppException.notFound([String? resource]) = NotFound;
  const factory AppException.invalidData([String? message]) = InvalidData;
  const factory AppException.cacheError([String? message]) = CacheError;

  // General exception
  const factory AppException.unexpected([String? message]) = UnexpectedError;
}

extension AppExceptionMessage on AppException {
  /// Returns a user-friendly message based on the type of [AppException].
  String get userFriendlyMessage {
    return switch (this) {
      ConnectionTimeout _ => 'Connection timed out. Please try again.',
      ConnectionFailed _ =>
        'Failed to connect to the server. Please check your internet connection.',
      ServerError(:final message) => _formatError('Server error', message),
      Unauthorized _ => 'You are not authorized to access this resource.',
      Forbidden _ => 'Access to this resource is forbidden.',
      NotFound(:final resource) => '${resource ?? "Resource"} not found.',
      InvalidData(:final message) => _formatError('Invalid data', message),
      CacheError(:final message) => _formatError('Cache error', message),
      UnexpectedError(:final message) => _formatError(
        'An unexpected error occurred',
        message,
      ),
      _ => 'An unknown error occurred.',
    };
  }

  /// Formats an error message with an optional detailed [message].
  String _formatError(String baseMessage, String? message) {
    return message != null ? '$baseMessage: $message.' : '$baseMessage.';
  }
}
