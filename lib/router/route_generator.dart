import 'package:flutter/material.dart';
import 'package:forsale/screens/apportunities/apportunity_detail.dart';
import 'package:forsale/screens/auth/sign_in_page.dart';
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
      case approtunityDetail:
        return MaterialPageRoute(
            builder: (_) => const ApportunityDetail(), settings: routeSettings);
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case signUpRoute:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case signInRoute:
        return MaterialPageRoute(builder: (_) => const SignInPage());
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
    }
  }
}
