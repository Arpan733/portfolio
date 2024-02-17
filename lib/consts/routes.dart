import 'package:flutter/material.dart';
import 'package:portfolio/screen/homescreen.dart';
import 'package:portfolio/screen/splashscreen.dart';

class Routes {
  static const String homescreen = 'homescreen';
  static const String splashscreen = 'splashscreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homescreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case splashscreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) {
            return const Scaffold(
              body: Center(
                child: Text('No route defined!'),
              ),
            );
          },
        );
    }
  }
}
