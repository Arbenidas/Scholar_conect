import 'package:flutter/material.dart';
import '../models/scholarship.dart';
import '../widgets/scholarship_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Lista de becas de ejemplo
    final List<Scholarship> scholarships = [
      Scholarship(
        title: 'STEM Scholarship',
        amount: 5000,
        deadline: DateTime(2025, 12, 15),
        imageUrl:
            'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/image-QrfGd4SsgvCgOsRiL3cXjb4Q7HGemR.png',
        isSaved: true,
      ),
      Scholarship(
        title: 'Diversity Grant',
        amount: 3000,
        deadline: DateTime(2024, 1, 10),
        imageUrl:
            'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/image-QrfGd4SsgvCgOsRiL3cXjb4Q7HGemR.png',
        isSaved: false,
      ),
      Scholarship(
        title: 'Essay Contest',
        amount: 1500,
        deadline: DateTime(2023, 11, 30),
        imageUrl:
            'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/image-QrfGd4SsgvCgOsRiL3cXjb4Q7HGemR.png',
        isSaved: true,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.bar_chart),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Barra de búsqueda
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Input text',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
              onTap: () {
                // Navegar a la pantalla de búsqueda
                Navigator.pushNamed(context, '/search-scholarships');
              },
              readOnly: true,
            ),
          ),

          // Lista de becas
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: scholarships.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/scholarship-details',
                      arguments: scholarships[index],
                    );
                  },
                  child: ScholarshipCard(scholarship: scholarships[index]),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
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
          if (index == 1) {
            Navigator.pushNamed(context, '/search-scholarships');
          }
        },
      ),
    );
  }
}
