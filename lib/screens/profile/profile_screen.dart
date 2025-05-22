import 'package:flutter/material.dart';
import '../../models/user.dart';
import '../../services/user_service.dart';
import 'edit_profile_screen.dart';
import '../../widgets/bottom_navigation.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final UserService _userService = UserService();
  late Future<User> _userFuture;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() {
    _userFuture = _userService.getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Perfil'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => _navigateToEditProfile(),
            tooltip: 'Editar Perfil',
          ),
        ],
      ),
      body: FutureBuilder<User>(
        future: _userFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error al cargar el perfil: ${snapshot.error}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          if (!snapshot.hasData) {
            return const Center(child: Text('No se encontraron datos de perfil'));
          }

          final user = snapshot.data!;
          return _buildProfileContent(user);
        },
      ),
      bottomNavigationBar: const BottomNavigation(currentIndex: 4),
    );
  }

  Widget _buildProfileContent(User user) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sección de cabecera con foto de perfil
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
            ),
            child: Column(
              children: [
                // Foto de perfil
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    user.profileImageUrl ?? 'https://via.placeholder.com/120',
                  ),
                  backgroundColor: Colors.grey.shade200,
                ),
                const SizedBox(height: 16),

                // Nombre completo
                Text(
                  user.fullName,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),

                // Correo electrónico
                Text(
                  user.email,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade700,
                  ),
                  textAlign: TextAlign.center,
                ),

                // Ubicación
                if (user.location != null) ...[
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 16,
                        color: Colors.grey.shade700,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        user.location!,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),

          // Información académica
          _buildSection(
            title: 'Información Académica',
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoRow(
                  icon: Icons.school,
                  label: 'Universidad',
                  value: user.university ?? 'No especificado',
                ),
                const SizedBox(height: 12),
                _buildInfoRow(
                  icon: Icons.book,
                  label: 'Carrera',
                  value: user.major ?? 'No especificado',
                ),
                const SizedBox(height: 12),
                _buildInfoRow(
                  icon: Icons.calendar_today,
                  label: 'Año de Graduación',
                  value: user.graduationYear?.toString() ?? 'No especificado',
                ),
              ],
            ),
          ),

          // Biografía
          if (user.bio != null && user.bio!.isNotEmpty)
            _buildSection(
              title: 'Sobre Mí',
              content: Text(
                user.bio!,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
            ),

          // Intereses
          if (user.interests.isNotEmpty)
            _buildSection(
              title: 'Intereses',
              content: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: user.interests.map((interest) {
                  return Chip(
                    label: Text(interest),
                    backgroundColor: Colors.blue.shade100,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                  );
                }).toList(),
              ),
            ),

          // Información de contacto
          _buildSection(
            title: 'Información de Contacto',
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoRow(
                  icon: Icons.email,
                  label: 'Correo Electrónico',
                  value: user.email,
                ),
                if (user.phoneNumber != null) ...[
                  const SizedBox(height: 12),
                  _buildInfoRow(
                    icon: Icons.phone,
                    label: 'Teléfono',
                    value: user.phoneNumber!,
                  ),
                ],
              ],
            ),
          ),

          // Botón de cerrar sesión
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: _signOut,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  side: const BorderSide(color: Colors.red),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Cerrar Sesión'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({required String title, required Widget content}) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 16),
          content,
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 20,
          color: Colors.grey.shade700,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _navigateToEditProfile() async {
    final user = await _userFuture;
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfileScreen(user: user),
      ),
    );

    if (result == true) {
      // Si el perfil fue actualizado, recargar los datos
      setState(() {
        _loadUserData();
      });
    }
  }

  void _signOut() async {
    // Mostrar diálogo de confirmación
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cerrar Sesión'),
        content: const Text('¿Estás seguro de que deseas cerrar sesión?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Cerrar Sesión'),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
          ),
        ],
      ),
    );

    if (confirm == true) {
      await _userService.signOut();
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/');
      }
    }
  }
}
