import 'package:flutter/material.dart';
import 'package:forsale/router/router_constants.dart';
import 'package:forsale/screens/home_screen.dart';
import 'router/route_generator.dart';

void main() {
  runApp(const Forsale());
}

class Forsale extends StatelessWidget {
  const Forsale({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '4Sale',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: homeRoute,
      onGenerateRoute: RouteGenerator().generateRoute,
    );
  }
}
