sealed class APIException implements Exception {
  APIException(this.message);
  final String message;
}

class NoInternetConnectionException extends APIException {
  NoInternetConnectionException()
      : super('Please check your internet connection');
}

class UnknownException extends APIException {
  UnknownException() : super('Some error occurred');
}
