import 'package:flutter/material.dart';
import 'package:note_taking_app/data/remote/exceptions/failure.dart';

abstract class CatchApiErrorWrapper {
  dynamic handleError(dynamic err);
}

class CatchApiErrorWrapperImpl extends CatchApiErrorWrapper {
  @override
  dynamic handleError(err) {
    debugPrint('Error: ${err.toString()}');
    switch (err.code) {
      case 'user-not-found':
        return TFailure(message: err.message ?? err.toString());
      case 'wrong-password':
        return TFailure(message: err.message ?? err.toString());
      case 'invalid-email':
        return TFailure(message: err.message ?? err.toString());
      case 'weak-password':
        return TFailure(message: err.message ?? err.toString());
      case 'missing-email':
        return TFailure(message: err.message ?? err.toString());
      case 'email-already-in-use':
        return TFailure(message: err.message ?? err.toString());
      case 'operation-not-allowed':
        return TFailure(message: err.message ?? err.toString());
      case 'user-disabled':
        return TFailure(message: err.message ?? err.toString());
      case 'aborted':
        return TFailure(message: err.message ?? err.toString());
      case 'already-exists':
        return TFailure(message: err.message ?? err.toString());
      case 'cancelled':
        return TFailure(message: err.message ?? err.toString());
      case 'data-loss':
        return TFailure(message: err.message ?? err.toString());
      case 'invalid-argument':
        return TFailure(message: err.message ?? err.toString());
      case 'not-found':
        return TFailure(message: err.message ?? err.toString());
      case 'permission-denied':
        return TFailure(message: err.message ?? err.toString());
      case 'unauthenticated':
        return TFailure(message: err.message ?? err.toString());
      case 'unavailable':
        return TFailure(message: err.message ?? err.toString());
      default:
        return UnknownFailure();
    }
  }
}
