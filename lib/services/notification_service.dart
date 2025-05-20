import '../models/notification.dart';

class NotificationService {
  // Simulación de notificaciones
  Future<List<ScholarNotification>> getNotifications() async {
    // Simular delay de red
    await Future.delayed(const Duration(milliseconds: 800));

    // Datos de ejemplo
    return [
      ScholarNotification(
        id: '1',
        title: 'Nueva beca que coincide con tu perfil',
        description:
            'Beca Santander para Estudios de Posgrado en Tecnología - Esta beca coincide con tus intereses en Tecnología y Desarrollo de Software.',
        timestamp: DateTime.now().subtract(const Duration(minutes: 30)),
        type: NotificationType.newScholarship,
        imageUrl:
            'https://ingenieria.uchile.cl/dam/jcr:376b4a91-f210-4ed9-8457-7cd3d2d9b531/becas%20santander_INSTAGRAM%20(1).png',
        actionUrl: '/scholarship-details?id=10',
        additionalData: {
          'scholarshipId': '10',
          'amount': 25000,
          'matchScore': 95,
        },
      ),
      ScholarNotification(
        id: '2',
        title: 'Recordatorio: Fecha límite próxima',
        description:
            'La fecha límite para aplicar a la Beca Fulbright para Estudiantes Internacionales es en 3 días. ¡No pierdas esta oportunidad!',
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
        type: NotificationType.deadlineReminder,
        imageUrl:
            'https://oaice.ucr.ac.cr/sites/default/files/2024-02/Fulbright%20Laspau.png',
        actionUrl: '/scholarship-details?id=3',
        additionalData: {
          'scholarshipId': '3',
          'deadline':
              DateTime.now().add(const Duration(days: 3)).toIso8601String(),
        },
      ),
      ScholarNotification(
        id: '3',
        title: 'Tu aplicación ha avanzado a la siguiente fase',
        description:
            'Felicidades! Tu aplicación para la Beca de Excelencia en Investigación Conacyt ha sido seleccionada para la fase de entrevistas.',
        timestamp: DateTime.now().subtract(const Duration(hours: 5)),
        type: NotificationType.applicationUpdate,
        imageUrl:
            'https://www.anahuac.mx/mexico/EscuelasyFacultades/actuaria//sites/default/files/gbb-uploads/conacyt-imagen-xbpay1.png',
        actionUrl: '/messages',
        additionalData: {
          'scholarshipId': '2',
          'status': 'Entrevista',
          'nextStep': 'Programar entrevista antes del 15 de junio',
        },
      ),
      ScholarNotification(
        id: '4',
        title: 'Nuevo mensaje de Santander Universidades',
        description:
            'Has recibido un nuevo mensaje sobre tu aplicación a la Beca Santander Iberoamérica.',
        timestamp: DateTime.now().subtract(const Duration(hours: 8)),
        type: NotificationType.message,
        imageUrl:
            'https://ingenieria.uchile.cl/dam/jcr:376b4a91-f210-4ed9-8457-7cd3d2d9b531/becas%20santander_INSTAGRAM%20(1).png',
        actionUrl: '/messages',
        additionalData: {
          'conversationId': '1',
          'sender': 'Santander Universidades',
        },
      ),
      ScholarNotification(
        id: '5',
        title: 'María Rodríguez vio tu perfil',
        description:
            'María Rodríguez, Coordinadora de Becas en Fundación Carolina, vio tu perfil hace 2 días.',
        timestamp: DateTime.now().subtract(const Duration(days: 2)),
        type: NotificationType.profileView,
        imageUrl:
            'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/profile-maria-rodriguez-Yd9Wd4SsgvCgOsRiL3cXjb4Q7HGemR.png',
        actionUrl: '/profile',
        additionalData: {
          'viewerId': 'user123',
          'viewerRole': 'Coordinadora de Becas',
          'viewerOrganization': 'Fundación Carolina',
        },
      ),
      ScholarNotification(
        id: '6',
        title: 'Beca recomendada por tu mentor',
        description:
            'Tu mentor Carlos Méndez te ha recomendado aplicar a la Beca para Estudios de Posgrado en Inteligencia Artificial.',
        timestamp: DateTime.now().subtract(const Duration(days: 1, hours: 4)),
        type: NotificationType.recommendation,
        imageUrl:
            'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/profile-carlos-mendez-Yd9Wd4SsgvCgOsRiL3cXjb4Q7HGemR.png',
        actionUrl: '/scholarship-details?id=11',
        additionalData: {
          'scholarshipId': '11',
          'mentorId': 'mentor456',
          'mentorName': 'Carlos Méndez',
        },
      ),
      ScholarNotification(
        id: '7',
        title: 'Nueva conexión: Ana Gómez',
        description:
            'Ana Gómez, becaria de Fulbright 2023, ha aceptado tu solicitud de conexión.',
        timestamp: DateTime.now().subtract(const Duration(days: 3)),
        type: NotificationType.connection,
        imageUrl:
            'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/profile-ana-gomez-Yd9Wd4SsgvCgOsRiL3cXjb4Q7HGemR.png',
        actionUrl: '/connections',
        additionalData: {
          'connectionId': 'user789',
          'connectionName': 'Ana Gómez',
          'connectionRole': 'Becaria Fulbright 2023',
        },
      ),
      ScholarNotification(
        id: '8',
        title: 'Evento virtual: Cómo aplicar a becas internacionales',
        description:
            'Te invitamos al webinar "Estrategias para aplicar exitosamente a becas internacionales" este jueves a las 18:00 hrs.',
        timestamp: DateTime.now().subtract(const Duration(days: 2, hours: 12)),
        type: NotificationType.event,
        imageUrl:
            'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/event-webinar-Yd9Wd4SsgvCgOsRiL3cXjb4Q7HGemR.png',
        actionUrl: '/events',
        additionalData: {
          'eventId': 'event123',
          'eventDate':
              DateTime.now().add(const Duration(days: 2)).toIso8601String(),
          'eventUrl': 'https://zoom.us/j/123456789',
        },
      ),
      ScholarNotification(
        id: '9',
        title: 'Consejo para mejorar tu aplicación',
        description:
            'Incluir experiencias de voluntariado en tu CV puede aumentar tus posibilidades de obtener la Beca de Liderazgo de la Fundación Ford.',
        timestamp: DateTime.now().subtract(const Duration(days: 4)),
        type: NotificationType.tip,
        imageUrl: null,
        actionUrl: '/scholarship-details?id=5',
        additionalData: {
          'scholarshipId': '5',
          'tipCategory': 'CV',
        },
        isRead: true,
      ),
      ScholarNotification(
        id: '10',
        title: '¡Felicidades por tu logro!',
        description:
            'Has completado todos los pasos para aplicar a 5 becas. ¡Sigue así!',
        timestamp: DateTime.now().subtract(const Duration(days: 5)),
        type: NotificationType.achievement,
        imageUrl: null,
        actionUrl: '/profile/achievements',
        additionalData: {
          'achievementId': 'achievement123',
          'badgeName': 'Aplicante Dedicado',
        },
        isRead: true,
      ),
      ScholarNotification(
        id: '11',
        title: 'Oportunidad de networking con alumni de Chevening',
        description:
            'Participa en el encuentro virtual con ex-becarios de Chevening y amplía tu red de contactos profesionales.',
        timestamp: DateTime.now().subtract(const Duration(days: 6)),
        type: NotificationType.networkingOpportunity,
        imageUrl:
            'https://pregrado.fen.uchile.cl/wp-content/uploads/2024/09/head_chevening.png',
        actionUrl: '/networking',
        additionalData: {
          'eventId': 'networking123',
          'eventDate':
              DateTime.now().add(const Duration(days: 10)).toIso8601String(),
        },
        isRead: true,
      ),
      ScholarNotification(
        id: '12',
        title: 'Actualización de la plataforma ScholarConnect',
        description:
            'Hemos lanzado nuevas funciones para ayudarte a encontrar y aplicar a becas más fácilmente. ¡Explora las novedades!',
        timestamp: DateTime.now().subtract(const Duration(days: 7)),
        type: NotificationType.system,
        imageUrl: null,
        actionUrl: '/whats-new',
        isRead: true,
      ),
    ];
  }

  // Marcar notificación como leída
  Future<bool> markAsRead(String notificationId) async {
    // Simular delay de red
    await Future.delayed(const Duration(milliseconds: 300));

    // En una app real, aquí se actualizaría la notificación en la base de datos

    return true;
  }

  // Marcar todas las notificaciones como leídas
  Future<bool> markAllAsRead() async {
    // Simular delay de red
    await Future.delayed(const Duration(milliseconds: 500));

    // En una app real, aquí se actualizarían todas las notificaciones en la base de datos

    return true;
  }

  // Eliminar notificación
  Future<bool> deleteNotification(String notificationId) async {
    // Simular delay de red
    await Future.delayed(const Duration(milliseconds: 300));

    // En una app real, aquí se eliminaría la notificación de la base de datos

    return true;
  }

  // Obtener conteo de notificaciones no leídas
  Future<int> getUnreadCount() async {
    // Simular delay de red
    await Future.delayed(const Duration(milliseconds: 200));

    final notifications = await getNotifications();
    return notifications.where((notification) => !notification.isRead).length;
  }
}
