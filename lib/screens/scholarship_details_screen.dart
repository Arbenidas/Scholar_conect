import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/scholarship.dart';

class ScholarshipDetailsScreen extends StatelessWidget {
  const ScholarshipDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scholarship =
        ModalRoute.of(context)!.settings.arguments as Scholarship;
    final dateFormat = DateFormat('MMM dd, yyyy');

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Scholarship Details'),
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
                    'Scholarship for Women in Sports and Fitness',
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
                          title: 'Launch date',
                          content: '12/09/2023',
                          color: Colors.blue.shade50,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildInfoBox(
                          title: 'Deadline',
                          content: '05/01/2024',
                          color: Colors.red.shade50,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Requisitos de elegibilidad
                  _buildSection(
                    title: 'Eligibility Requirements:',
                    content: [
                      '• Currently enrolled or accepted to an accredited college, university, or vocational school',
                      '• Pursuing a degree related to sports, physical therapy, fitness studies, or related field',
                      '• Demonstrated interest in sports or fitness (competitive or recreational)',
                      '• Minimum cumulative GPA of 3.0',
                    ],
                  ),

                  // Materiales de aplicación
                  _buildSection(
                    title: 'Application Materials:',
                    content: [
                      '• Completed application form',
                      '• Official academic transcript',
                      '• Two letters of recommendation (one from a coach/fitness educator and one from an academic reference)',
                      '• Personal statement (500-750 words) describing your passion for sports/fitness, career goals, and how this scholarship will help you achieve them',
                    ],
                  ),

                  // Información adicional
                  _buildSection(
                    title: 'Additional Information:',
                    content: [
                      '• Award amount: \$3,500 per academic year',
                      '• Renewable for up to four years if academic standards are maintained',
                      '• Application deadline: Oct 15, 2023',
                      '• Funds disbursed directly to educational institution',
                    ],
                  ),

                  // Criterios de selección
                  _buildSection(
                    title: 'Selection Criteria:',
                    content: [
                      '• Academic merit (30%)',
                      '• Sports/fitness achievement and dedication (30%)',
                      '• Financial need (15%)',
                      '• Personal statement and community involvement (25%)',
                    ],
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
                        'Apply Now',
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
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Scholarships',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
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
