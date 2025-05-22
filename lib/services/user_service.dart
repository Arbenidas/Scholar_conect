import '../models/user.dart';

class UserService {
  // Usuario simulado (en una app real, esto vendría de una base de datos)
  User _currentUser = User(
    id: '1',
    email: 'john.doe@example.com',
    fullName: 'John Doe',
    profileImageUrl:
        'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/image-QrfGd4SsgvCgOsRiL3cXjb4Q7HGemR.png',
    university: 'State University',
    major: 'Ciencias de la Computación',
    graduationYear: 2025,
    interests: ['Tecnología', 'Diseño', 'Matemáticas'],
    bio:
        'Estudiante de ciencias de la computación, apasionado de UX/UI y desarrollo de aplicaciones moviles.',
    phoneNumber: '(555) 123-4567',
    location: 'San Francisco, CA',
  );

  // Obtener el usuario actual
  Future<User> getCurrentUser() async {
    // Simular delay de red
    await Future.delayed(const Duration(milliseconds: 800));
    return _currentUser;
  }

  // Actualizar el usuario
  Future<bool> updateUser(User updatedUser) async {
    // Simular delay de red
    await Future.delayed(const Duration(milliseconds: 1000));

    // Actualizar el usuario actual
    _currentUser = updatedUser;

    return true;
  }

  // Actualizar la foto de perfil
  Future<bool> updateProfileImage(String imageUrl) async {
    // Simular delay de red
    await Future.delayed(const Duration(milliseconds: 1000));

    // Actualizar la foto de perfil
    _currentUser = _currentUser.copyWith(profileImageUrl: imageUrl);

    return true;
  }

  // Cerrar sesión (simulado)
  Future<void> signOut() async {
    // Simular delay de red
    await Future.delayed(const Duration(milliseconds: 500));

    // En una app real, aquí se limpiarían las credenciales
  }
}
