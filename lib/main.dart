import 'package:flutter/material.dart';
import 'package:forsale/application/repositories/apportunity_repository.dart';
import 'package:forsale/application/repositories/auth_repository.dart';
import 'package:forsale/application/state/apportunity_state.dart';
import 'package:forsale/application/state/auth_state.dart';
import 'package:forsale/application/storage/localstorage.dart';
import 'package:forsale/application/storage/storage_keys.dart';
import 'package:forsale/values/branding_color.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import './router/router_constants.dart';
import './router/route_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.initializeSharedPrefrences();
  runApp(const Forsale());
}

class Forsale extends StatelessWidget {
  const Forsale({Key? key}) : super(key: key);

  // rgb(7, 94, 84)

  @override
  Widget build(BuildContext context) {
    return Injector(
        inject: [
          Inject<AuthState>(
            () => AuthState(AuthRepositoryImp()),
          ),
          Inject<ApportunityState>(
            () => ApportunityState(ApportunityRepositoryImpl()),
          ),
        ],
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: '4Sale',
            theme: ThemeData(
              primarySwatch: brandingColor,
            ),
            initialRoute:
                LocalStorage.getItem(token) != null ? homeRoute : signInRoute,
            onGenerateRoute: RouteGenerator().generateRoute,
          );
        });
  }
}
