import 'package:flutter/material.dart';
import 'package:forsale/screens/auth/sign_up_page.dart';
import '../screens/home_screen.dart';
import './router_constants.dart';
import '../screens/apportunities/apportunity_screen.dart';
import '../screens/notFound/not_found_page.dart';

class RouteGenerator {
  Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case approtunitiesRoute:
        return MaterialPageRoute(builder: (_) => const ApportunitiesScreen());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case signUpPage:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case signInPage:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
    }
  }
}
