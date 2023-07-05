import 'package:equatable/equatable.dart';
import 'package:note_taking_app/presentation/resources/app_strings.dart';

abstract class Failure extends Equatable {
  const Failure();

  String getMessage();

  @override
  List<Object?> get props => [];
}

class NoInternetFailure extends Failure {
  @override
  List<Object> get props => [];
  @override
  String toString() => TAppStrings.tNoInternet;

  @override
  String getMessage() => TAppStrings.tNoInternet;
}

class TimeoutFailure extends Failure {
  const TimeoutFailure({
    required this.message,
  });
  final String message;

  @override
  List<Object> get props => [];

  @override
  String toString() => message;

  @override
  String getMessage() => message;
}

class TFailure extends Failure {
  const TFailure({
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => [message];

  @override
  String getMessage() => message;
}

class UnknownFailure extends Failure {
  @override
  List<Object> get props => [];

  @override
  String toString() => TAppStrings.tUnknownFailure;

  @override
  String getMessage() => TAppStrings.tUnknownFailure;
}
