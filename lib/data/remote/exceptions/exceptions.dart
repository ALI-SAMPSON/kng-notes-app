class NoInternetException implements Exception {
  @override
  String toString() => 'No Internet';
}

class TimeoutException implements Exception {
  const TimeoutException({
    required this.message,
  });
  final String message;
}

class NoDetailException implements Exception {
  const NoDetailException({
    required this.message,
  });
  final String message;
}

class NonFieldException implements Exception {
  const NonFieldException({
    required this.message,
  });
  final String message;
}

class ServerException implements Exception {
  const ServerException({
    required this.message,
  });
  final String message;
}

class CacheException implements Exception {}

class NullException implements Exception {
  @override
  String toString() => 'null ';
}
