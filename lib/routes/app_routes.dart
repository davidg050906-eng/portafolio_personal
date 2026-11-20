import 'package:flutter/material.dart';
import '../screens/about_screen.dart';
import '../screens/contact_screen.dart';
import '../screens/home_screen.dart';
import '../screens/venture_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String venture = '/venture';
  static const String about = '/about';
  static const String contact = '/contact';

  static Map<String, WidgetBuilder> get routes => {
        home: (context) => const HomeScreen(),
        venture: (context) => const VentureScreen(),
        about: (context) => const AboutScreen(),
        contact: (context) => const ContactScreen(),
      };
}