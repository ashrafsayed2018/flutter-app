import 'package:flutter/material.dart';
import 'package:forsale/application/models/auth/sign_in_form_model.dart';
import 'package:forsale/application/storage/localstorage.dart';
import 'package:forsale/router/router_constants.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import "../../widgets/show_snackbar.dart";
import '/values/images.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    print("calling build method");
    return Scaffold(
      body: Injector(
        inject: [
          Inject<SignInFormModel>(() => SignInFormModel()),
        ],
        builder: (context) {
          final _singltonSignInFormModel = RM.get<SignInFormModel>();
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
                StateBuilder<SignInFormModel>(
                  builder: (context, SignInFormModel) {
                    return TextFormField(
                      onChanged: (String email) {
                        SignInFormModel.setState(
                          (state) => state.setEmail(email),
                          catchError: true,
                        );
                      },
                      decoration: InputDecoration(
                        errorText: SignInFormModel.hasError
                            ? SignInFormModel.error!.message
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
                StateBuilder<SignInFormModel>(
                  builder: (_, SignInFormModel) {
                    return TextFormField(
                      onChanged: (String password) {
                        SignInFormModel.setState(
                          (state) => state.setPassword(password),
                          catchError: true,
                        );
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        errorText: SignInFormModel.hasError
                            ? SignInFormModel.error.message
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
                  height: 40,
                ),
                StateBuilder(
                  observe: () => _singltonSignInFormModel,
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
                        if (!_singltonSignInFormModel.state.validateData()) {
                          // show snackbar

                          showSnackbar(Colors.red, "data is invalid", context);
                        } else {
                          _singltonSignInFormModel.setState(
                            (SignInFormModel) async {
                              await SignInFormModel.submitSignIn();
                              Navigator.pushNamed(context, homeRoute);
                            },
                            onError: (context, error) => showSnackbar(
                                Colors.red, "${error.message}", context),
                          );
                        }
                      },
                      child: const Text("Sign in"),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account ?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, signUpRoute);
                      },
                      child: const Text("sign up"),
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
