import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/launch_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/home_screen.dart';
import 'screens/search_scholarships_screen.dart';
import 'screens/search_results_screen.dart';
import 'screens/scholarship_details_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/messages/messages_screen.dart';
import 'screens/notifications/notifications_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Establecer la barra de estado en color claro con iconos oscuros
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return MaterialApp(
      title: 'ScholarConnect',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          primary: Colors.blue,
        ),
        fontFamily: 'SF Pro Display',
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LaunchScreen(),
        '/signup': (context) => const SignupScreen(),
        '/home': (context) => const HomeScreen(),
        '/search-scholarships': (context) => const SearchScholarshipsScreen(),
        '/search-results': (context) => const SearchResultsScreen(),
        '/scholarship-details': (context) => const ScholarshipDetailsScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/messages': (context) => const MessagesScreen(),
        '/notifications': (context) => const NotificationsScreen(),
      },
      // Configuración para mantener el estado de las pantallas
      navigatorObservers: [
        HeroController(),
      ],
    );
  }
}
