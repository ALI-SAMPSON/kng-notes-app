import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:note_taking_app/app/app_constants.dart';
import 'package:note_taking_app/app/app_di.dart';
import 'package:note_taking_app/commons/widgets/popup_dialogs.dart';
import 'package:note_taking_app/data/remote/services/auth_service/auth_service.dart';
import 'package:note_taking_app/domain/user_model.dart';
import 'package:note_taking_app/presentation/features/base/base.model.dart';
import 'package:note_taking_app/presentation/resources/app_strings.dart';
import 'package:note_taking_app/routes/routes.dart';
import 'package:note_taking_app/util/enum/app_state.dart';

class AuthViewModel extends BaseModel {
  final _authService = instance<AuthService>();

  final fullNameTEC = TextEditingController();
  final emailTEC = TextEditingController();
  final passwordTEC = TextEditingController();

  bool _obscure = true;
  bool _busy = false;

  bool get obscure => _obscure;
  bool get busy => _busy;

  // this is the onChanged listener to
  // obscure user password
  void onObscureChanged() {
    _obscure = !_obscure;
    notifyListeners();
  }

  // this is where you update the loading
  // state of the app
  void setBusy(bool busy) {
    _busy = busy;
    notifyListeners();
  }

  // this method check if user is already logged or not
  // redirects them to their respective pages (if user is not logged in,
  // landing page is show else main page)
  void openInitialPage({required BuildContext context}) {
    firebaseAuth.currentUser != null
        ? Navigator.pushNamed(context, Routes.noteRoute)
        : Navigator.pushNamed(context, Routes.landingRoute);
  }

  // this returns true if user is logged in else false
  bool isLoggedIn() => firebaseAuth.currentUser != null ? true : false;

  // this method call auth service implementation to create new user
  Future<void> createNewUser({required BuildContext context}) async {
    setBusy(true);
    var result = await _authService.createNewUserWithEmailAndPassword(
      fullname: fullNameTEC.text.trim(),
      email: emailTEC.text.trim(),
      password: passwordTEC.text.trim(),
    );
    result.fold((err) {
      PopupDialogs(context).errorMessage(err.getMessage());
      setBusy(false);
    }, (res) {
      setBusy(false);
      clearFields();
      Navigator.pushReplacementNamed(context, Routes.noteRoute);
    });
    notifyListeners();
  }

  // this method call auth service implementation to sign in a user
  Future<void> signIn({required BuildContext context}) async {
    setBusy(true);
    var result = await _authService.signInWithEmailAndPassword(
      email: emailTEC.text.trim(),
      password: passwordTEC.text.trim(),
    );
    result.fold((err) {
      setBusy(false);
      PopupDialogs(context).errorMessage(err.getMessage());
    }, (res) {
      setBusy(false);
      clearFields();
      Navigator.pushReplacementNamed(context, Routes.noteRoute);
    });
    notifyListeners();
  }

  // clear text editing controllers
  void clearFields() {
    fullNameTEC.clear();
    emailTEC.clear();
    passwordTEC.clear();
  }

  // this method call auth service implementation to logout a user
  Future<void> logOut({required BuildContext context}) async {
    setBusy(true);
    await _authService.logout();
    Navigator.pushReplacementNamed(
      context,
      Routes.landingRoute,
    );
    setBusy(false);
  }
}
