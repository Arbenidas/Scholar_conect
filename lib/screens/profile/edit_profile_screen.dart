import 'package:flutter/material.dart';
import '../../models/user.dart';
import '../../services/user_service.dart';

class EditProfileScreen extends StatefulWidget {
  final User user;

  const EditProfileScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final UserService _userService = UserService();

  late TextEditingController _fullNameController;
  late TextEditingController _universityController;
  late TextEditingController _majorController;
  late TextEditingController _graduationYearController;
  late TextEditingController _bioController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _locationController;

  List<String> _interests = [];
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();

    // Inicializar controladores con los valores actuales del usuario
    _fullNameController = TextEditingController(text: widget.user.fullName);
    _universityController = TextEditingController(text: widget.user.university ?? '');
    _majorController = TextEditingController(text: widget.user.major ?? '');
    _graduationYearController = TextEditingController(
      text: widget.user.graduationYear?.toString() ?? '',
    );
    _bioController = TextEditingController(text: widget.user.bio ?? '');
    _phoneNumberController = TextEditingController(text: widget.user.phoneNumber ?? '');
    _locationController = TextEditingController(text: widget.user.location ?? '');

    _interests = List.from(widget.user.interests);
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _universityController.dispose();
    _majorController.dispose();
    _graduationYearController.dispose();
    _bioController.dispose();
    _phoneNumberController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Perfil'),
        actions: [
          TextButton(
            onPressed: _isSaving ? null : _saveProfile,
            child: _isSaving
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Text(
                    'Guardar',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Foto de perfil
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(
                          widget.user.profileImageUrl ?? 'https://via.placeholder.com/120',
                        ),
                        backgroundColor: Colors.grey.shade200,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 20,
                            ),
                            onPressed: _changeProfileImage,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Información personal
                const Text(
                  'Información personal',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 16),

                // Nombre completo
                TextFormField(
                  controller: _fullNameController,
                  decoration: const InputDecoration(
                    labelText: 'Nombre completo',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu nombre completo';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Ubicación
                TextFormField(
                  controller: _locationController,
                  decoration: const InputDecoration(
                    labelText: 'Ubicación',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.location_on),
                  ),
                ),
                const SizedBox(height: 16),

                // Teléfono
                TextFormField(
                  controller: _phoneNumberController,
                  decoration: const InputDecoration(
                    labelText: 'Teléfono',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 24),

                // Información académica
                const Text(
                  'Información académica',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 16),

                // Universidad
                TextFormField(
                  controller: _universityController,
                  decoration: const InputDecoration(
                    labelText: 'Universidad',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.school),
                  ),
                ),
                const SizedBox(height: 16),

                // Carrera
                TextFormField(
                  controller: _majorController,
                  decoration: const InputDecoration(
                    labelText: 'Carrera',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.book),
                  ),
                ),
                const SizedBox(height: 16),

                // Año de graduación
                TextFormField(
                  controller: _graduationYearController,
                  decoration: const InputDecoration(
                    labelText: 'Año de graduación',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.calendar_today),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      final year = int.tryParse(value);
                      if (year == null) {
                        return 'Por favor ingrese un año valido';
                      }
                      final currentYear = DateTime.now().year;
                      if (year < currentYear - 10 || year > currentYear + 10) {
                        return 'Por favor ingrese un año de graduación valido';
                      }
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),

                // Biografía
                const Text(
                  'Sobre mi',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 16),

                TextFormField(
                  controller: _bioController,
                  decoration: const InputDecoration(
                    labelText: 'Bio',
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true,
                  ),
                  maxLines: 5,
                ),
                const SizedBox(height: 24),

                // Intereses
                const Text(
                  'Intereses',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 16),

                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    ..._interests.map((interest) {
                      return Chip(
                        label: Text(interest),
                        backgroundColor: Colors.blue.shade100,
                        deleteIcon: const Icon(Icons.close, size: 18),
                        onDeleted: () {
                          setState(() {
                            _interests.remove(interest);
                          });
                        },
                      );
                    }).toList(),
                    ActionChip(
                      avatar: const Icon(Icons.add, size: 18),
                      label: const Text('Agregar Interes'),
                      backgroundColor: Colors.grey.shade200,
                      onPressed: _addInterest,
                    ),
                  ],
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _changeProfileImage() {
    // En una app real, aquí se implementaría la selección de imagen
    // y la carga a un servicio de almacenamiento
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cambiar imagen de perfil'),
        content: const Text(
          'Esta característica te permitira seleccionar una imagen de tu dispositivo.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }

  void _addInterest() {
    final TextEditingController interestController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Agregar intereses'),
        content: TextField(
          controller: interestController,
          decoration: const InputDecoration(
            labelText: 'Intereses',
            border: OutlineInputBorder(),
          ),
          autofocus: true,
          textCapitalization: TextCapitalization.words,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              final interest = interestController.text.trim();
              if (interest.isNotEmpty && !_interests.contains(interest)) {
                setState(() {
                  _interests.add(interest);
                });
              }
              Navigator.pop(context);
            },
            child: const Text('Agregar'),
          ),
        ],
      ),
    );
  }

  void _saveProfile() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSaving = true;
      });

      try {
        // Crear usuario actualizado
        final updatedUser = widget.user.copyWith(
          fullName: _fullNameController.text,
          university: _universityController.text.isEmpty ? null : _universityController.text,
          major: _majorController.text.isEmpty ? null : _majorController.text,
          graduationYear: _graduationYearController.text.isEmpty
              ? null
              : int.tryParse(_graduationYearController.text),
          bio: _bioController.text.isEmpty ? null : _bioController.text,
          phoneNumber: _phoneNumberController.text.isEmpty ? null : _phoneNumberController.text,
          location: _locationController.text.isEmpty ? null : _locationController.text,
          interests: _interests,
        );

        // Guardar cambios
        final success = await _userService.updateUser(updatedUser);

        if (mounted) {
          if (success) {
            // Mostrar mensaje de éxito y volver a la pantalla de perfil
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Perfil actualizado con exito')),
            );
            Navigator.pop(context, true);
          } else {
            // Mostrar mensaje de error
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Error al actualizar el perfil'),
                backgroundColor: Colors.red,
              ),
            );
            setState(() {
              _isSaving = false;
            });
          }
        }
      } catch (e) {
        // Manejar errores
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: $e'),
              backgroundColor: Colors.red,
            ),
          );
          setState(() {
            _isSaving = false;
          });
        }
      }
    }
  }
}
