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
        title: 'Beca Santander Iberoamérica',
        amount: 10000,
        deadline: DateTime(2025, 3, 30),
        imageUrl:
            'https://ingenieria.uchile.cl/dam/jcr:376b4a91-f210-4ed9-8457-7cd3d2d9b531/becas%20santander_INSTAGRAM%20(1).png',
        isSaved: false,
        organization: 'Santander Universidades 2',
        description:
            'Beca destinada a estudiantes de Iberoamérica para realizar estudios en España o Brasil.',
        eligibilityRequirements: [
          '• Estar inscrito en un programa universitario',
          '• Ser estudiante de grado, maestría o doctorado',
          '• Tener buen rendimiento académico',
        ],
        applicationMaterials: [
          '• Formulario de solicitud',
          '• Carta de motivación',
          '• Transcripciones académicas',
        ],
        selectionCriteria: {
          'Rendimiento académico': 40,
          'Compromiso social y liderazgo': 30,
          'Propuesta de investigación': 30,
        },
      ),
      Scholarship(
        id: '2',
        title: 'Beca de Excelencia en Investigación Conacyt',
        amount: 20000,
        deadline: DateTime(2024, 8, 15),
        imageUrl:
            'https://www.anahuac.mx/mexico/EscuelasyFacultades/actuaria//sites/default/files/gbb-uploads/conacyt-imagen-xbpay1.png',
        isSaved: true,
        organization: 'CONACYT',
        description:
            'Beca para estudiantes mexicanos que deseen realizar estudios de posgrado en el extranjero en el área de investigación.',
        eligibilityRequirements: [
          '• Ser ciudadano mexicano',
          '• Contar con un título de licenciatura o maestría',
          '• Aceptación en un programa de posgrado en el extranjero',
        ],
        applicationMaterials: [
          '• Formulario de solicitud',
          '• Plan de investigación',
          '• Carta de aceptación de la universidad',
        ],
        selectionCriteria: {
          'Calificación académica': 50,
          'Relevancia del proyecto de investigación': 30,
          'Experiencia en el área': 20,
        },
      ),
      Scholarship(
        id: '3',
        title: 'Beca Fulbright para Estudiantes Internacionales',
        amount: 25000,
        deadline: DateTime(2025, 6, 1),
        imageUrl:
            'https://oaice.ucr.ac.cr/sites/default/files/2024-02/Fulbright%20Laspau.png',
        isSaved: true,
        organization: 'Fulbright Program',
        description:
            'Beca para estudiantes internacionales que deseen cursar un programa de posgrado en los Estados Unidos.',
        eligibilityRequirements: [
          '• Ser estudiante de posgrado o profesional',
          '• Tener dominio del inglés',
          '• Contar con una propuesta de investigación o plan de estudio',
        ],
        applicationMaterials: [
          '• Formulario de solicitud',
          '• Transcripciones académicas',
          '• Carta de recomendación',
          '• Plan de estudios o investigación',
        ],
        selectionCriteria: {
          'Rendimiento académico': 40,
          'Propuesta de investigación': 30,
          'Compromiso profesional': 20,
          'Recomendaciones': 10,
        },
      ),
      Scholarship(
        id: '4',
        title: 'Beca Erasmus Mundus',
        amount: 30000,
        deadline: DateTime(2024, 12, 15),
        imageUrl:
            'https://sociologia-alas.org/wp-content/uploads/2019/01/erasmusmundus.png',
        isSaved: false,
        organization: 'Unión Europea',
        description:
            'Beca destinada a estudiantes internacionales para programas de maestría en Europa.',
        eligibilityRequirements: [
          '• Ser estudiante internacional',
          '• Tener un título de licenciatura',
          '• Cumplir con los requisitos específicos del programa Erasmus',
        ],
        applicationMaterials: [
          '• Formulario de solicitud',
          '• Transcripciones académicas',
          '• Carta de motivación',
          '• Carta de recomendación',
        ],
        selectionCriteria: {
          'Calificación académica': 50,
          'Motivación y objetivos profesionales': 30,
          'Recomendaciones académicas': 20,
        },
      ),
      Scholarship(
        id: '5',
        title: 'Beca de Liderazgo de la Fundación Ford',
        amount: 20000,
        deadline: DateTime(2025, 4, 15),
        imageUrl:
            'https://cdnwp.dealerk.com/0b42016c/uploads/sites/244/2020/04/archiauto-ma-s-de-un-centenar-de-empleados-de-ford-espan-a-participan-en-la-xiii-jornada-de-voluntariado-en-la-fundacio-n-apascovi-18165-300x225.png',
        isSaved: true,
        organization: 'Fundación Ford',
        description:
            'Beca para estudiantes que buscan convertirse en líderes en sus comunidades mediante el financiamiento de programas educativos.',
        eligibilityRequirements: [
          '• Ser estudiante de licenciatura o maestría',
          '• Demostrar un compromiso con el liderazgo y el servicio a la comunidad',
          '• Tener un historial académico destacado',
        ],
        applicationMaterials: [
          '• Formulario de solicitud',
          '• Carta de motivación',
          '• Dos cartas de recomendación',
          '• Transcripciones académicas',
        ],
        selectionCriteria: {
          'Compromiso con la comunidad': 40,
          'Potencial de liderazgo': 30,
          'Rendimiento académico': 20,
          'Experiencia de vida y voluntariado': 10,
        },
      ),
      Scholarship(
        id: '6',
        title:
            'Beca de Investigación en el Extranjero para Estudiantes Mexicanos',
        amount: 15000,
        deadline: DateTime(2024, 7, 5),
        imageUrl:
            'https://iicmessico.esteri.it/wp-content/uploads/2025/04/BECAS-2025.png',
        isSaved: true,
        organization: 'ASEA',
        description:
            'Beca para estudiantes mexicanos interesados en realizar investigaciones en el extranjero.',
        eligibilityRequirements: [
          '• Ser estudiante mexicano de posgrado',
          '• Estar inscrito en un programa de investigación',
          '• Tener un proyecto de investigación aprobado',
        ],
        applicationMaterials: [
          '• Formulario de solicitud',
          '• Plan de investigación detallado',
          '• Carta de aceptación de la universidad',
        ],
        selectionCriteria: {
          'Innovación del proyecto de investigación': 40,
          'Rendimiento académico': 30,
          'Experiencia previa en investigación': 20,
          'Carta de recomendación': 10,
        },
      ),
      Scholarship(
        id: '7',
        title: 'Beca Chevening del Gobierno del Reino Unido',
        amount: 40000,
        deadline: DateTime(2024, 10, 15),
        imageUrl:
            'https://pregrado.fen.uchile.cl/wp-content/uploads/2024/09/head_chevening.png',
        isSaved: true,
        organization: 'Gobierno del Reino Unido',
        description:
            'Beca para estudios de maestría en universidades del Reino Unido.',
        eligibilityRequirements: [
          '• Ser ciudadano de un país elegible',
          '• Tener al menos dos años de experiencia laboral',
          '• Demostrar potencial de liderazgo',
        ],
        applicationMaterials: [
          '• Formulario de solicitud en línea',
          '• Transcripciones académicas',
          '• Carta de recomendación',
          '• Declaración personal',
        ],
        selectionCriteria: {
          'Liderazgo': 40,
          'Logros académicos': 30,
          'Servicio a la comunidad': 20,
          'Declaración personal': 10,
        },
      ),
      Scholarship(
        id: '8',
        title: 'Beca para Mujeres en Ciencia y Tecnología',
        amount: 10000,
        deadline: DateTime(2025, 2, 28),
        imageUrl:
            'https://amc.edu.mx/wp-content/uploads/2025/02/logo-loreal-amc.png',
        isSaved: false,
        organization: 'FAWCO Foundation',
        description:
            'Beca dirigida a mujeres que deseen realizar estudios en ciencia y tecnología.',
        eligibilityRequirements: [
          '• Ser mujer',
          '• Estar inscrita en un programa de ciencia o tecnología',
          '• Tener un excelente expediente académico',
        ],
        applicationMaterials: [
          '• Formulario de solicitud',
          '• Carta de motivación',
          '• Transcripciones académicas',
        ],
        selectionCriteria: {
          'Rendimiento académico': 40,
          'Compromiso con la ciencia y tecnología': 30,
          'Potencial de liderazgo': 20,
          'Declaración personal': 10,
        },
      ),
      Scholarship(
        id: '9',
        title: 'Beca Soros para Estudios de Posgrado',
        amount: 30000,
        deadline: DateTime(2024, 9, 15),
        imageUrl:
            'https://www.gestionandote.org/wp-content/uploads/2019/06/Becas-completas2.png',
        isSaved: true,
        organization: 'Fundación Soros',
        description:
            'Beca para estudiantes de posgrado interesados en realizar estudios en EE. UU.',
        eligibilityRequirements: [
          '• Ser estudiante internacional',
          '• Tener un expediente académico excepcional',
          '• Mostrar un compromiso con el impacto social',
        ],
        applicationMaterials: [
          '• Formulario de solicitud',
          '• Transcripciones académicas',
          '• Cartas de recomendación',
          '• Declaración personal',
        ],
        selectionCriteria: {
          'Rendimiento académico': 40,
          'Compromiso social': 30,
          'Potencial de liderazgo': 20,
          'Declaración personal': 10,
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
