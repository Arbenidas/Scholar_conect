import '../models/scholarship.dart';

class ScholarshipService {
  // Método para obtener becas (simulado)
  Future<List<Scholarship>> getScholarships() async {
    // Aquí iría la lógica real para obtener becas de una API o base de datos
    await Future.delayed(const Duration(seconds: 1)); // Simular delay de red

    // Datos de ejemplo
    return [
      Scholarship(
        id: '1',
        title: 'UX Foundation',
        amount: 5000,
        deadline: DateTime(2025, 12, 15),
        imageUrl:
            'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/image-QrfGd4SsgvCgOsRiL3cXjb4Q7HGemR.png',
        isSaved: true,
        organization: 'UX Foundation',
        description: 'Scholarship for students pursuing UX/UI design',
        eligibilityRequirements: [
          'Currently enrolled in a design program',
          'Portfolio of UX/UI work',
          'Minimum GPA of 3.0',
        ],
        applicationMaterials: [
          'Portfolio',
          'Personal statement',
          'Two letters of recommendation',
        ],
        selectionCriteria: {
          'Portfolio quality': 40,
          'Academic merit': 30,
          'Personal statement': 20,
          'Letters of recommendation': 10,
        },
      ),
      Scholarship(
        id: '2',
        title: 'Design Basics',
        amount: 3000,
        deadline: DateTime(2024, 1, 10),
        imageUrl:
            'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/image-QrfGd4SsgvCgOsRiL3cXjb4Q7HGemR.png',
        isSaved: false,
        organization: 'Design Association',
        description: 'Scholarship for beginning design students',
        eligibilityRequirements: [
          'First or second year design student',
          'Demonstrated interest in design',
          'Minimum GPA of 2.8',
        ],
        applicationMaterials: [
          'Design samples',
          'Personal statement',
          'One letter of recommendation',
        ],
        selectionCriteria: {
          'Design potential': 35,
          'Academic merit': 25,
          'Personal statement': 25,
          'Letter of recommendation': 15,
        },
      ),
      Scholarship(
        id: '3',
        title: 'Digital Sketching',
        amount: 1500,
        deadline: DateTime(2023, 11, 30),
        imageUrl:
            'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/image-QrfGd4SsgvCgOsRiL3cXjb4Q7HGemR.png',
        isSaved: true,
        organization: 'Digital Arts Foundation',
        description: 'Scholarship for digital sketching and illustration',
        eligibilityRequirements: [
          'Portfolio of digital sketches',
          'Enrolled in art or design program',
          'Minimum GPA of 3.0',
        ],
        applicationMaterials: [
          'Digital portfolio',
          'Artist statement',
          'Academic transcript',
        ],
        selectionCriteria: {
          'Digital sketching skills': 50,
          'Academic merit': 20,
          'Artist statement': 30,
        },
      ),
    ];
  }

  // Método para obtener una beca específica por ID (simulado)
  Future<Scholarship?> getScholarshipById(String id) async {
    // Aquí iría la lógica real para obtener una beca específica
    await Future.delayed(const Duration(milliseconds: 500)); // Simular delay

    // Obtener todas las becas y encontrar la que coincide con el ID
    final scholarships = await getScholarships();
    return scholarships.firstWhere(
      (scholarship) => scholarship.id == id,
      orElse: () => throw Exception('Scholarship not found'),
    );
  }

  // Método para guardar una beca (simulado)
  Future<bool> saveScholarship(String scholarshipId) async {
    // Aquí iría la lógica real para guardar una beca
    await Future.delayed(const Duration(milliseconds: 500)); // Simular delay
    return true; // Simular éxito
  }

  // Método para compartir una beca (simulado)
  Future<bool> shareScholarship(String scholarshipId) async {
    // Aquí iría la lógica real para compartir una beca
    await Future.delayed(const Duration(milliseconds: 500)); // Simular delay
    return true; // Simular éxito
  }
}
