import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:note_taking_app/app/app_constants.dart';
import 'package:note_taking_app/app/app_di.dart';
import 'package:note_taking_app/data/remote/data_sources/auth_data_source/auth_data_source.dart';
import 'package:note_taking_app/data/remote/exceptions/failure.dart';
import 'package:note_taking_app/data/remote/repository/auth_repository/auth_repository.dart';
import 'package:note_taking_app/data/remote/wrappers/catch_error_wrapper.dart';
import 'package:note_taking_app/domain/user_model.dart';
import 'package:note_taking_app/presentation/resources/app_strings.dart';

class AuthRepositoryImpl extends AuthRepository {
  final _dataSource = instance<AuthDataSource>();
  final _errorWrapper = instance<CatchApiErrorWrapper>();

  @override
  Future<Either<Failure, String>> createNewUserWithEmailAndPassword(
      {required String fullname,
      required String email,
      required String password}) async {
    try {
      var auth = await _dataSource.createNewUserWithEmailAndPassword(
        fullname: fullname,
        email: email,
        password: password,
      );
      // create user and add to db
      var user = UserModel(
        id: auth.user?.uid,
        email: email,
        fullName: fullname,
        createdBy: auth.user?.uid,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      // create user in firestore
      await firebaseFirestore
          .collection(TAppConstants.tUsers)
          .doc(auth.user?.uid)
          .set(user.toJson());
      return const Right(TAppStrings.tAccountCreatedMsg);
    } on FirebaseAuthException catch (err) {
      return Left(_errorWrapper.handleError(err));
    } on FirebaseException catch (err) {
      return Left(_errorWrapper.handleError(err));
    }
    // catch (err) {
    //   return Left(_errorWrapper.handleError(err));
    // }
  }

  @override
  Future<Either<Failure, UserModel>> getUser({required String id}) async {
    try {
      var snapshot = await _dataSource.getUser(id: id);
      var user = snapshot.docs.map((e) => UserModel.fromSnapShot(e)).single;
      return Right(user);
    } on FirebaseException catch (err) {
      return Left(_errorWrapper.handleError(err));
    }
    // catch (err) {
    //   return Left(_errorWrapper.handleError(err));
    // }
  }

  @override
  Future<Either<Failure, String>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      var auth = await _dataSource.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return const Right(TAppStrings.tAccountCreatedMsg);
    } on FirebaseAuthException catch (err) {
      return Left(_errorWrapper.handleError(err));
    }
    // catch (err) {
    //   return Left(_errorWrapper.handleError(err));
    // }
  }

  @override
  Future<Either<Failure, String>> logout() async {
    try {
      await _dataSource.logout();
      return const Right(TAppStrings.tLogoutMsg);
    } on FirebaseAuthException catch (err) {
      return Left(_errorWrapper.handleError(err));
    }
  }
}
