import 'package:flutter/foundation.dart';
import 'package:forsale/application/repositories/auth_repository.dart';

class AuthState {
  final AuthRepository _authRepository;

  AuthState(this._authRepository);

  Future signIn({
    @required String? email,
    @required String? password,
  }) async {
    await _authRepository.signIn(
      email: email!,
      password: password!,
    );
  }

  Future signUp({
    @required String? firstName,
    @required String? lastName,
    @required String? email,
    @required String? password,
    @required String? passwordConfirmation,
  }) async {
    await _authRepository.signUp(
      firstName: firstName!,
      lastName: lastName!,
      email: email!,
      password: password!,
      passwordConfirmation: passwordConfirmation!,
    );
  }
}
