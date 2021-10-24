import 'package:dio/dio.dart';
import 'package:forsale/application/classes/errors/common_error.dart';
import 'package:forsale/application/state/auth_state.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class SignInFormModel {
  final AuthState _authState = Injector.get<AuthState>();
  String? email, password;

  setEmail(String email) {
    // check email validation

    if (!validateEmail(email)) {
      throw CommonError(message: "invalid email");
    }

    this.email = email;
  }

  void setPassword(String password) {
    // check password validation

    if (password.length < 6) {
      throw CommonError(message: "password should be more than 6 characters");
    }

    this.password = password;
  }

  validateData() {
    return email != null &&
        password != null &&
        password!.length > 6 &&
        validateEmail(email!);
  }

  // validate the email

  bool validateEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+")
        .hasMatch(email);
  }

  Future<void> submitSignIn() async {
    // authanticate the user

    return await _authState.signIn(email: email!, password: password!);
  }
}
