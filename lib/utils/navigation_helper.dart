import 'package:flutter/material.dart';

class NavigationHelper {
  // Método para navegar a una ruta específica reemplazando la actual
  static void navigateToRoute(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  // Método para navegar a la pantalla de inicio
  static void navigateToHome(BuildContext context) {
    navigateToRoute(context, '/home');
  }

  // Método para navegar a la pantalla de búsqueda de becas
  static void navigateToScholarships(BuildContext context) {
    navigateToRoute(context, '/search-scholarships');
  }

  // Método para navegar a la pantalla de mensajes
  static void navigateToMessages(BuildContext context) {
    navigateToRoute(context, '/messages');
  }

  // Método para navegar a la pantalla de notificaciones
  static void navigateToNotifications(BuildContext context) {
    navigateToRoute(context, '/notifications');
  }

  // Método para navegar a la pantalla de perfil
  static void navigateToProfile(BuildContext context) {
    navigateToRoute(context, '/profile');
  }

  // Método para navegar a los detalles de una beca
  static void navigateToScholarshipDetails(
      BuildContext context, dynamic scholarship) {
    Navigator.pushNamed(
      context,
      '/scholarship-details',
      arguments: scholarship,
    );
  }
}
