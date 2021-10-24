import 'package:flutter/material.dart';
import 'package:forsale/application/models/auth/sign_up_form_model.dart';
import 'package:forsale/router/router_constants.dart';
import 'package:forsale/values/images.dart';
import 'package:forsale/widgets/show_snackbar.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Injector(
        inject: [
          Inject<SignUpFormModel>(() => SignUpFormModel()),
        ],
        builder: (context) {
          final _singltonSignUpFormModel = RM.get<SignUpFormModel>();
          return Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 15,
                bottom: MediaQuery.of(context).size.height / 15,
                left: MediaQuery.of(context).size.width / 15,
                right: MediaQuery.of(context).size.width / 15),
            child: ListView(
              children: [
                Container(
                  height: 150,
                  margin: const EdgeInsets.only(top: 70),
                  child: Center(
                    child: Image.asset(Images.logo),
                  ),
                ),
                StateBuilder<SignUpFormModel>(
                  builder: (_, SignUpFormModel) {
                    return TextFormField(
                      onChanged: (String firstName) {
                        SignUpFormModel.setState(
                          (state) => state.setFirstName(firstName),
                          catchError: true,
                        );
                      },
                      decoration: InputDecoration(
                        errorText: SignUpFormModel.hasError
                            ? SignUpFormModel.error.message
                            : null,
                        prefixIcon: const Icon(Icons.person),
                        hintText: "Enter your first name",
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                StateBuilder<SignUpFormModel>(
                  builder: (_, SignUpFormModel) {
                    return TextFormField(
                      onChanged: (String lastName) {
                        SignUpFormModel.setState(
                          (state) => state.setLastName(lastName),
                          catchError: true,
                        );
                      },
                      decoration: InputDecoration(
                        errorText: SignUpFormModel.hasError
                            ? SignUpFormModel.error.message
                            : null,
                        prefixIcon: const Icon(Icons.person_add),
                        hintText: "Enter your last name",
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                StateBuilder<SignUpFormModel>(
                  builder: (_, SignUpFormModel) {
                    return TextFormField(
                      onChanged: (String email) {
                        SignUpFormModel.setState(
                          (state) => state.setEmail(email),
                          catchError: true,
                        );
                      },
                      decoration: InputDecoration(
                        errorText: SignUpFormModel.hasError
                            ? SignUpFormModel.error.message
                            : null,
                        prefixIcon: const Icon(Icons.email),
                        hintText: "Enter your email",
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                StateBuilder<SignUpFormModel>(
                  builder: (_, SignUpFormModel) {
                    return TextFormField(
                      onChanged: (String password) {
                        SignUpFormModel.setState(
                          (state) => state.setPassword(password),
                          catchError: true,
                        );
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        errorText: SignUpFormModel.hasError
                            ? SignUpFormModel.error.message
                            : null,
                        prefixIcon: const Icon(Icons.lock),
                        hintText: "Enter your password",
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                StateBuilder<SignUpFormModel>(
                  builder: (_, SignUpFormModel) {
                    return TextFormField(
                      onChanged: (String passwordConfirmation) {
                        SignUpFormModel.setState(
                          (state) => state
                              .setPasswordConfirmation(passwordConfirmation),
                          catchError: true,
                        );
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        errorText: SignUpFormModel.hasError
                            ? SignUpFormModel.error.message
                            : null,
                        prefixIcon: const Icon(Icons.lock),
                        hintText: "confirm your password",
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                StateBuilder(
                  observe: () => _singltonSignUpFormModel,
                  builder: (_, model) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 24),
                        fixedSize: const Size(40, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        // print(_singltonSignUpFormModel.state.validateData());
                        if (!_singltonSignUpFormModel.state.validateData()) {
                          // show snackbar

                          showSnackbar(Colors.red, "invalid data", context);
                        } else {
                          _singltonSignUpFormModel.setState(
                            (SignUpFormModel) => SignUpFormModel.submitSignUp(),
                            onError: (context, error) => showSnackbar(
                                Colors.red, "${error.message.email}", context),
                          );
                        }
                      },
                      child: const Text("Sign up"),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("already have an account ?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, signInRoute);
                      },
                      child: const Text("sign in"),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
