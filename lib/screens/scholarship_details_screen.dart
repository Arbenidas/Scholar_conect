import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/scholarship.dart';

class ScholarshipDetailsScreen extends StatelessWidget {
  const ScholarshipDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scholarship =
        ModalRoute.of(context)!.settings.arguments as Scholarship;
    final dateFormat = DateFormat('dd MMM, yyyy');

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Detalles de la Beca'),
        actions: [
          IconButton(
            icon: const Icon(Icons.bar_chart),
            onPressed: () {},
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
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Fechas importantes
                  Row(
                    children: [
                      Expanded(
                        child: _buildInfoBox(
                          title: 'Fecha de lanzamiento',
                          content: dateFormat.format(
                              scholarship.deadline.subtract(
                                  const Duration(days: 120))),
                          color: Colors.blue.shade50,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildInfoBox(
                          title: 'Fecha límite',
                          content: dateFormat.format(scholarship.deadline),
                          color: Colors.red.shade50,
                        ),
                      ),
                    ],
                  ),

                  // Requisitos de elegibilidad
                  if (scholarship.eligibilityRequirements.isNotEmpty)
                    _buildSection(
                      title: 'Requisitos de Elegibilidad:',
                      content: scholarship.eligibilityRequirements,
                    ),

                  // Materiales de aplicación
                  if (scholarship.applicationMaterials.isNotEmpty)
                    _buildSection(
                      title: 'Materiales de Aplicación:',
                      content: scholarship.applicationMaterials,
                    ),

                  // Información adicional
                  _buildSection(
                    title: 'Información Adicional:',
                    content: [
                      '• Monto de la beca: \$${scholarship.amount} por año académico',
                      '• Renovable si se mantienen los estándares académicos',
                      '• Fecha límite para aplicar: ${dateFormat.format(scholarship.deadline)}',
                      '• Fondos entregados directamente a la institución educativa',
                    ],
                  ),

                  // Criterios de selección
                  if (scholarship.selectionCriteria.isNotEmpty)
                    _buildSection(
                      title: 'Criterios de Selección:',
                      content: scholarship.selectionCriteria.entries
                          .map((e) =>
                              '• ${e.key} (${e.value}%)')
                          .toList(),
                    ),

                  const SizedBox(height: 24),

                  // Botón de aplicar
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Implementar lógica para aplicar
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Aplicar Ahora',
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Scholarships tab
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Becas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Mensajes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notificaciones',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/home');
          }
        },
      ),
    );
  }

  Widget _buildInfoBox({
    required String title,
    required String content,
    required Color color,
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
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
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

  Widget _buildSection({
    required String title,
    required List<String> content,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        ...content.map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                item,
                style: const TextStyle(fontSize: 16),
              ),
            )),
        const SizedBox(height: 24),
      ],
    );
  }
}