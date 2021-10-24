import 'package:forsale/application/classes/errors/common_error.dart';
import 'package:forsale/application/state/auth_state.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class SignUpFormModel {
  final AuthState _authState = Injector.get<AuthState>();

  String? firstName, lastName, email, password, passwordConfirmation;

  void setFirstName(String firstName) {
    if (firstName.length < 5) {
      throw CommonError(message: "fistname should be greater than 5 chars");
    }
    this.firstName = firstName;
  }

  void setLastName(String lastName) {
    if (lastName.length < 5) {
      throw CommonError(message: "lastname should be greater than 5 chars");
    }
    this.lastName = lastName;
  }

  void setEmail(String email) {
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

  void setPasswordConfirmation(String passwordConfirmation) {
    // check password confirmation

    if (password != passwordConfirmation) {
      throw CommonError(message: "password not match");
    }
    this.passwordConfirmation = passwordConfirmation;
  }

  bool validateData() {
    return firstName != null &&
        lastName != null &&
        email != null &&
        validateEmail(email!) &&
        password != null &&
        password!.length >= 6 &&
        password == passwordConfirmation;
  }

  // validate the email

  bool validateEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+")
        .hasMatch(email);
  }

  submitSignUp() async {
    // authanticate the user

    var response = await _authState.signUp(
      firstName: firstName!,
      lastName: lastName!,
      email: email!,
      password: password!,
      passwordConfirmation: passwordConfirmation!,
    );
  }
}
