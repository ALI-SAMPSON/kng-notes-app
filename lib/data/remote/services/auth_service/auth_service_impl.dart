import 'package:dartz/dartz.dart';
import 'package:note_taking_app/app/app_di.dart';
import 'package:note_taking_app/data/remote/exceptions/failure.dart';
import 'package:note_taking_app/data/remote/repository/auth_repository/auth_repository.dart';
import 'package:note_taking_app/data/remote/services/auth_service/auth_service.dart';
import 'package:note_taking_app/domain/user_model.dart';

class AuthServiceImpl extends AuthService {
  final _authRepository = instance<AuthRepository>();

  // service method to create new user account
  @override
  Future<Either<Failure, String>> createNewUserWithEmailAndPassword(
          {required String fullname,
          required String email,
          required String password}) =>
      _authRepository.createNewUserWithEmailAndPassword(
        fullname: fullname,
        email: email,
        password: password,
      );

  // service method to get a user
  @override
  Future<Either<Failure, UserModel>> getUser({required String id}) =>
      _authRepository.getUser(id: id);

  // service method to sign in a user
  @override
  Future<Either<Failure, String>> signInWithEmailAndPassword(
          {required String email, required String password}) =>
      _authRepository.signInWithEmailAndPassword(
          email: email, password: password);

  // service method to logout a user
  @override
  Future<Either<Failure, String>> logout() => _authRepository.logout();
}
