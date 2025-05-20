import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/scholarship.dart';
import '../services/scholarship_service.dart';
import '../widgets/bottom_navigation.dart';

class ScholarshipDetailsScreen extends StatefulWidget {
  const ScholarshipDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ScholarshipDetailsScreen> createState() => _ScholarshipDetailsScreenState();
}

class _ScholarshipDetailsScreenState extends State<ScholarshipDetailsScreen> {
  final ScholarshipService _scholarshipService = ScholarshipService();
  bool _isSaved = false;
  bool _isApplying = false;

  @override
  Widget build(BuildContext context) {
    final scholarship = ModalRoute.of(context)!.settings.arguments as Scholarship;
    final dateFormat = DateFormat('dd MMM, yyyy');
    final currencyFormat = NumberFormat.currency(symbol: '\$', decimalDigits: 0);

    // Inicializar el estado de guardado
    _isSaved = scholarship.isSaved;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Detalles de la Beca'),
        actions: [
          IconButton(
            icon: Icon(
              _isSaved ? Icons.bookmark : Icons.bookmark_border,
              color: _isSaved ? Colors.blue : null,
            ),
            onPressed: () {
              setState(() {
                _isSaved = !_isSaved;
              });
              // Guardar o quitar de guardados
              _scholarshipService.saveScholarship(scholarship.id);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(_isSaved
                    ? 'Beca guardada en favoritos'
                    : 'Beca eliminada de favoritos'),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            tooltip: 'Guardar',
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // Compartir beca
              _scholarshipService.shareScholarship(scholarship.id);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Compartiendo beca...'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            tooltip: 'Compartir',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen de la beca
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                scholarship.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Center(
                      child: Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Título de la beca
                  Text(
                    scholarship.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Organización
                  Row(
                    children: [
                      const Icon(Icons.business, size: 18, color: Colors.grey),
                      const SizedBox(width: 8),
                      Text(
                        scholarship.organization,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Monto y fecha límite
                  Row(
                    children: [
                      Expanded(
                        child: _buildInfoBox(
                          title: 'Monto',
                          content: currencyFormat.format(scholarship.amount),
                          color: Colors.blue.shade50,
                          icon: Icons.attach_money,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildInfoBox(
                          title: 'Fecha límite',
                          content: dateFormat.format(scholarship.deadline),
                          color: Colors.red.shade50,
                          icon: Icons.calendar_today,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Descripción
                  const Text(
                    'Descripción',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    scholarship.description,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Requisitos de elegibilidad
                  const Text(
                    'Requisitos de Elegibilidad',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...scholarship.eligibilityRequirements.map((requirement) =>
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        requirement,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ).toList(),
                  const SizedBox(height: 24),

                  // Materiales de aplicación
                  const Text(
                    'Materiales de Aplicación',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...scholarship.applicationMaterials.map((material) =>
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        material,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ).toList(),
                  const SizedBox(height: 24),

                  // Criterios de selección
                  const Text(
                    'Criterios de Selección',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ...scholarship.selectionCriteria.entries.map((entry) =>
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${entry.key} (${entry.value}%)',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 4),
                          LinearProgressIndicator(
                            value: entry.value / 100,
                            backgroundColor: Colors.grey[200],
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                            minHeight: 8,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ],
                      ),
                    ),
                  ).toList(),

                  const SizedBox(height: 32),

                  // Botón de aplicar
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _isApplying ? null : () {
                        setState(() {
                          _isApplying = true;
                        });

                        // Simular proceso de aplicación
                        Future.delayed(const Duration(seconds: 2), () {
                          if (mounted) {
                            setState(() {
                              _isApplying = false;
                            });

                            // Mostrar diálogo de confirmación
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Aplicación Enviada'),
                                content: const Text(
                                  'Tu aplicación ha sido enviada correctamente. Te contactaremos pronto con más información sobre el proceso de selección.',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pushNamed(context, '/messages');
                                    },
                                    child: const Text('Ver Mensajes'),
                                  ),
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Cerrar'),
                                  ),
                                ],
                              ),
                            );
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        disabledBackgroundColor: Colors.blue.withOpacity(0.6),
                      ),
                      child: _isApplying
                          ? const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                ),
                                SizedBox(width: 12),
                                Text(
                                  'Enviando aplicación...',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )
                          : const Text(
                              'Aplicar Ahora',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Botón de contactar
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        // Navegar a la pantalla de mensajes
                        Navigator.pushNamed(context, '/messages');
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.blue,
                        side: const BorderSide(color: Colors.blue),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Contactar a la Organización',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigation(currentIndex: 1),
    );
  }

  Widget _buildInfoBox({
    required String title,
    required String content,
    required Color color,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: Colors.black87),
              const SizedBox(width: 4),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            content,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
