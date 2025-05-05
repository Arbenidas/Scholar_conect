import 'package:flutter/material.dart';
import '../widgets/filter_section.dart';

class SearchScholarshipsScreen extends StatefulWidget {
  const SearchScholarshipsScreen({Key? key}) : super(key: key);

  @override
  State<SearchScholarshipsScreen> createState() =>
      _SearchScholarshipsScreenState();
}

class _SearchScholarshipsScreenState extends State<SearchScholarshipsScreen> {
  final TextEditingController _searchController = TextEditingController();

  // Valores de los filtros
  String? _educationalLevel;
  String? _areaOfStudy;
  RangeValues _amountRange = const RangeValues(500, 5000);

  // Requisitos
  final Map<String, bool> _requirements = {
  'Promedio mínimo (GPA)': false,
  'Ensayo / Declaración personal': false,
  'Envío creativo': false,
  'Carta de presentación': false,
  'Entrevista en línea': false,
  'Afiliación religiosa': false,
};

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _search() {
    // Recopilar todos los filtros seleccionados
    final Map<String, dynamic> filters = {
      'query': _searchController.text,
      'educationalLevel': _educationalLevel,
      'areaOfStudy': _areaOfStudy,
      'minAmount': _amountRange.start,
      'maxAmount': _amountRange.end,
      'requirements': _requirements.entries
          .where((entry) => entry.value)
          .map((entry) => entry.key)
          .toList(),
    };

    // Navegar a la pantalla de resultados con los filtros
    Navigator.pushNamed(context, '/search-results', arguments: filters);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Buscar Becas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.bar_chart),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Barra de búsqueda
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Buscar...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                ),
              ),
              const SizedBox(height: 24),

              // Título de filtros
              const Text(
                'Filtros de Becas',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              // Nivel educativo
              FilterSection(
                title: 'Nivel de educación',
                child: TextField(
                  readOnly: true,
                  onTap: () {
                    // Mostrar opciones de nivel educativo
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => _buildEducationalLevelPicker(),
                    );
                  },
                  decoration: InputDecoration(
                    hintText: _educationalLevel ?? 'Selecciona el nivel de educación',
                    suffixIcon: const Icon(Icons.arrow_drop_down),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                  ),
                ),
              ),

              // Área de estudio
              FilterSection(
                title: 'Área de estudio',
                child: TextField(
                  readOnly: true,
                  onTap: () {
                    // Mostrar opciones de área de estudio
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => _buildAreaOfStudyPicker(),
                    );
                  },
                  decoration: InputDecoration(
                    hintText: _areaOfStudy ?? 'Selecciona una área específica de estudio',
                    suffixIcon: const Icon(Icons.arrow_drop_down),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                  ),
                ),
              ),

              // Rango de monto
              FilterSection(
                title: 'Precio',
                child: Column(
                  children: [
                    RangeSlider(
                      values: _amountRange,
                      min: 500,
                      max: 5000,
                      divisions: 45,
                      labels: RangeLabels(
                        '\$${_amountRange.start.round()}',
                        '\$${_amountRange.end.round()}',
                      ),
                      onChanged: (RangeValues values) {
                        setState(() {
                          _amountRange = values;
                        });
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$${_amountRange.start.round()}'),
                        Text('\$${_amountRange.end.round()}'),
                      ],
                    ),
                  ],
                ),
              ),

              // Requisitos
              FilterSection(
                title: 'Requerimientos',
                child: Column(
                  children: _requirements.entries.map((entry) {
                    return CheckboxListTile(
                      title: Text(entry.key),
                      value: entry.value,
                      contentPadding: EdgeInsets.zero,
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (bool? value) {
                        setState(() {
                          _requirements[entry.key] = value ?? false;
                        });
                      },
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 24),

              // Botón de búsqueda
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _search,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Buscar',
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
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
            label: 'Becas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Mensajes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notificacines',
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

  Widget _buildEducationalLevelPicker() {
    final levels = [
      'Secundaria',
      'Pregrado',
      'Posgrado',
      'Doctorado',
      'Postdoctorado',
    ];

    return Container(
      height: 300,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Selecciona un nivel de educación',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: levels.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(levels[index]),
                  onTap: () {
                    setState(() {
                      _educationalLevel = levels[index];
                    });
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAreaOfStudyPicker() {
    final areas = [
      'Informática',
      'Ingeniería',
      'Negocios',
      'Medicina',
      'Derecho',
      'Artes',
      'Humanidades',
      'Ciencias Sociales',
      'Ciencias Naturales',
      'Educación',
    ];

    return Container(
      height: 300,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Selecciona el área de estudio',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: areas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(areas[index]),
                  onTap: () {
                    setState(() {
                      _areaOfStudy = areas[index];
                    });
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
