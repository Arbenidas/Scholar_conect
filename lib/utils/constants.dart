import 'package:flutter/material.dart';

// Colores de la aplicación
class AppColors {
  static const Color primary = Colors.blue;
  static const Color secondary = Colors.cyan;
  static const Color background = Colors.white;
  static const Color textPrimary = Colors.black;
  static const Color textSecondary = Colors.black54;
  static const Color inputBackground = Color(0xFFF5F5F5);
}

// Estilos de texto
class AppTextStyles {
  static const TextStyle heading1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    color: AppColors.textSecondary,
  );

  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
}

// Rutas de la aplicación
class AppRoutes {
  static const String launch = '/';
  static const String signup = '/signup';
  static const String login = '/login';
  static const String home = '/home';
  static const String scholarshipDetail = '/scholarship-detail';
  static const String profile = '/profile';
}
