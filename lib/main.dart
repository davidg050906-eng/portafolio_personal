import 'package:flutter/material.dart';
import 'routes/app_routes.dart';
import 'themes/app_theme.dart';

void main() {
  runApp(const PortafolioApp());
}

class PortafolioApp extends StatelessWidget {
  const PortafolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portafolio - David González',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      initialRoute: AppRoutes.home,
      routes: AppRoutes.routes,
    );
  }
}