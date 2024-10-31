import 'package:code/screens/home/home_page.dart';
import 'package:code/screens/login/login_page.dart';
import 'package:code/screens/login/splash_screen.dart';
import 'package:flutter/material.dart';

import '../screens/home/home.dart';

class RouteManager {
  static const String splashScreen = '/';
  static const String login = '/login';
  static const String home = '/home';
  static const String homePage = '/home-page';

  static Route<dynamic> generate(RouteSettings routeSettings) {
    // final dynamic args = routeSettings.arguments;

    switch (routeSettings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case login:
        return MaterialPageRoute(builder: (_) => const LoginPage());

      case home:
        return MaterialPageRoute(builder: (_) => const Home());

      case homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: Text('No Page Found!'),
                  ),
                ));
    }
  }
}
