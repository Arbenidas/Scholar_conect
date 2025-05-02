import 'dart:async';

class AuthService {
  // Simulación de autenticación
  Future<bool> signUp(String email, String password, String fullName) async {
    // Aquí iría la lógica real de registro con Firebase, Supabase, etc.
    await Future.delayed(const Duration(seconds: 1)); // Simular delay de red
    return true; // Simular éxito
  }

  Future<bool> signIn(String email, String password) async {
    // Aquí iría la lógica real de inicio de sesión
    await Future.delayed(const Duration(seconds: 1)); // Simular delay de red
    return true; // Simular éxito
  }

  Future<void> signOut() async {
    // Aquí iría la lógica real de cierre de sesión
    await Future.delayed(const Duration(milliseconds: 500)); // Simular delay
  }
}
