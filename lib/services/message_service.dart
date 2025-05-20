import '../models/message.dart';

class MessageService {
  // Simulación de conversaciones
  Future<List<Conversation>> getConversations() async {
    // Simular delay de red
    await Future.delayed(const Duration(milliseconds: 800));

    // Datos de ejemplo
    return [
      Conversation(
        id: '1',
        scholarshipId: '1',
        scholarshipTitle: 'Beca Santander Iberoamérica',
        organizationId: 'org1',
        organizationName: 'Santander Universidades',
        organizationImageUrl:
            'https://ingenieria.uchile.cl/dam/jcr:376b4a91-f210-4ed9-8457-7cd3d2d9b531/becas%20santander_INSTAGRAM%20(1).png',
        messages: [
          Message(
            id: 'm1',
            senderId: 'org1',
            receiverId: 'currentUser',
            content:
                'Hola, hemos recibido tu aplicación para la Beca Santander Iberoamérica. Nos gustaría programar una entrevista contigo.',
            timestamp:
                DateTime.now().subtract(const Duration(days: 2, hours: 3)),
            isRead: true,
          ),
          Message(
            id: 'm2',
            senderId: 'currentUser',
            receiverId: 'org1',
            content:
                'Hola, muchas gracias por contactarme. Estoy disponible para la entrevista. ¿Qué fechas tienen disponibles?',
            timestamp:
                DateTime.now().subtract(const Duration(days: 2, hours: 2)),
            isRead: true,
          ),
          Message(
            id: 'm3',
            senderId: 'org1',
            receiverId: 'currentUser',
            content:
                'Tenemos disponibilidad el próximo lunes o martes entre las 10:00 y 16:00 horas. ¿Alguna de estas opciones te funciona?',
            timestamp:
                DateTime.now().subtract(const Duration(days: 1, hours: 5)),
            isRead: false,
          ),
        ],
        lastMessageTime:
            DateTime.now().subtract(const Duration(days: 1, hours: 5)),
        hasUnreadMessages: true,
        status: ConversationStatus.active,
      ),
      Conversation(
        id: '2',
        scholarshipId: '2',
        scholarshipTitle: 'Beca de Excelencia en Investigación Conacyt',
        organizationId: 'org2',
        organizationName: 'CONACYT',
        organizationImageUrl:
            'https://www.anahuac.mx/mexico/EscuelasyFacultades/actuaria//sites/default/files/gbb-uploads/conacyt-imagen-xbpay1.png',
        messages: [
          Message(
            id: 'm4',
            senderId: 'currentUser',
            receiverId: 'org2',
            content:
                'Buenas tardes, acabo de enviar mi aplicación para la Beca de Excelencia en Investigación. Quería confirmar si han recibido todos los documentos correctamente.',
            timestamp:
                DateTime.now().subtract(const Duration(days: 5, hours: 8)),
            isRead: true,
          ),
          Message(
            id: 'm5',
            senderId: 'org2',
            receiverId: 'currentUser',
            content:
                'Hola, gracias por tu mensaje. Hemos recibido tu aplicación completa. El comité de evaluación revisará tu caso en las próximas semanas.',
            timestamp:
                DateTime.now().subtract(const Duration(days: 4, hours: 3)),
            isRead: true,
          ),
          Message(
            id: 'm6',
            senderId: 'currentUser',
            receiverId: 'org2',
            content:
                'Perfecto, muchas gracias por la confirmación. Quedo atento a sus comentarios.',
            timestamp:
                DateTime.now().subtract(const Duration(days: 4, hours: 2)),
            isRead: true,
          ),
          Message(
            id: 'm7',
            senderId: 'org2',
            receiverId: 'currentUser',
            content:
                'Te informamos que has pasado a la segunda fase del proceso de selección. Necesitamos que nos envíes tu propuesta de investigación ampliada antes del próximo viernes.',
            timestamp:
                DateTime.now().subtract(const Duration(days: 2, hours: 6)),
            isRead: true,
          ),
          Message(
            id: 'm8',
            senderId: 'org2',
            receiverId: 'currentUser',
            type: MessageType.attachment,
            content:
                'Adjunto encontrarás el formato para la propuesta ampliada.',
            attachmentUrl: 'https://example.com/formato_propuesta.pdf',
            attachmentName: 'Formato_Propuesta_Ampliada.pdf',
            timestamp:
                DateTime.now().subtract(const Duration(days: 2, hours: 6)),
            isRead: true,
          ),
        ],
        lastMessageTime:
            DateTime.now().subtract(const Duration(days: 2, hours: 6)),
        hasUnreadMessages: false,
        status: ConversationStatus.active,
      ),
      Conversation(
        id: '3',
        scholarshipId: '3',
        scholarshipTitle: 'Beca Fulbright para Estudiantes Internacionales',
        organizationId: 'org3',
        organizationName: 'Fulbright Program',
        organizationImageUrl:
            'https://oaice.ucr.ac.cr/sites/default/files/2024-02/Fulbright%20Laspau.png',
        messages: [
          Message(
            id: 'm9',
            senderId: 'org3',
            receiverId: 'currentUser',
            content:
                'Estimado aplicante, nos complace informarte que has sido preseleccionado para la Beca Fulbright. El siguiente paso es una entrevista en inglés.',
            timestamp: DateTime.now().subtract(const Duration(hours: 8)),
            isRead: false,
          ),
        ],
        lastMessageTime: DateTime.now().subtract(const Duration(hours: 8)),
        hasUnreadMessages: true,
        status: ConversationStatus.active,
      ),
      Conversation(
        id: '4',
        scholarshipId: '7',
        scholarshipTitle: 'Beca Chevening del Gobierno del Reino Unido',
        organizationId: 'org4',
        organizationName: 'Gobierno del Reino Unido',
        organizationImageUrl:
            'https://pregrado.fen.uchile.cl/wp-content/uploads/2024/09/head_chevening.png',
        messages: [
          Message(
            id: 'm10',
            senderId: 'org4',
            receiverId: 'currentUser',
            content:
                'Gracias por tu interés en la Beca Chevening. Tu aplicación ha sido recibida. Te contactaremos una vez que el proceso de evaluación haya concluido.',
            timestamp:
                DateTime.now().subtract(const Duration(days: 10, hours: 5)),
            isRead: true,
          ),
          Message(
            id: 'm11',
            senderId: 'currentUser',
            receiverId: 'org4',
            content:
                'Gracias por la confirmación. ¿Podrían indicarme aproximadamente cuándo se darán a conocer los resultados?',
            timestamp:
                DateTime.now().subtract(const Duration(days: 9, hours: 12)),
            isRead: true,
          ),
          Message(
            id: 'm12',
            senderId: 'org4',
            receiverId: 'currentUser',
            content:
                'Los resultados de la primera fase se anunciarán en aproximadamente 6-8 semanas. Te notificaremos por este medio y por correo electrónico.',
            timestamp:
                DateTime.now().subtract(const Duration(days: 9, hours: 4)),
            isRead: true,
          ),
        ],
        lastMessageTime:
            DateTime.now().subtract(const Duration(days: 9, hours: 4)),
        hasUnreadMessages: false,
        status: ConversationStatus.active,
      ),
      Conversation(
        id: '5',
        scholarshipId: '5',
        scholarshipTitle: 'Beca de Liderazgo de la Fundación Ford',
        organizationId: 'org5',
        organizationName: 'Fundación Ford',
        organizationImageUrl:
            'https://cdnwp.dealerk.com/0b42016c/uploads/sites/244/2020/04/archiauto-ma-s-de-un-centenar-de-empleados-de-ford-espan-a-participan-en-la-xiii-jornada-de-voluntariado-en-la-fundacio-n-apascovi-18165-300x225.png',
        messages: [
          Message(
            id: 'm13',
            senderId: 'currentUser',
            receiverId: 'org5',
            content:
                'Hola, estoy interesado en aplicar a la Beca de Liderazgo. ¿Podrían proporcionarme más información sobre los requisitos específicos para estudiantes internacionales?',
            timestamp:
                DateTime.now().subtract(const Duration(days: 15, hours: 7)),
            isRead: true,
          ),
          Message(
            id: 'm14',
            senderId: 'org5',
            receiverId: 'currentUser',
            content:
                'Hola, gracias por tu interés. Los estudiantes internacionales deben cumplir con los mismos requisitos generales, pero adicionalmente necesitan demostrar dominio del idioma inglés (TOEFL o IELTS) y tener una visa de estudiante válida.',
            timestamp:
                DateTime.now().subtract(const Duration(days: 14, hours: 9)),
            isRead: true,
          ),
          Message(
            id: 'm15',
            senderId: 'currentUser',
            receiverId: 'org5',
            content:
                'Entiendo, muchas gracias por la información. ¿Existe algún formato específico para las cartas de recomendación?',
            timestamp:
                DateTime.now().subtract(const Duration(days: 14, hours: 6)),
            isRead: true,
          ),
          Message(
            id: 'm16',
            senderId: 'org5',
            receiverId: 'currentUser',
            content:
                'No hay un formato específico, pero las cartas deben ser escritas por profesores o supervisores que puedan dar fe de tu potencial de liderazgo y compromiso comunitario. Deben incluir información de contacto del recomendante.',
            timestamp:
                DateTime.now().subtract(const Duration(days: 13, hours: 10)),
            isRead: true,
          ),
        ],
        lastMessageTime:
            DateTime.now().subtract(const Duration(days: 13, hours: 10)),
        hasUnreadMessages: false,
        status: ConversationStatus.active,
      ),
    ];
  }

  // Obtener mensajes de una conversación específica
  Future<List<Message>> getMessages(String conversationId) async {
    // Simular delay de red
    await Future.delayed(const Duration(milliseconds: 500));

    // Obtener todas las conversaciones y encontrar la que coincide con el ID
    final conversations = await getConversations();
    final conversation = conversations.firstWhere(
      (conversation) => conversation.id == conversationId,
      orElse: () => throw Exception('Conversation not found'),
    );

    return conversation.messages;
  }

  // Enviar un mensaje
  Future<Message> sendMessage({
    required String conversationId,
    required String content,
    MessageType type = MessageType.text,
    String? attachmentUrl,
    String? attachmentName,
  }) async {
    // Simular delay de red
    await Future.delayed(const Duration(milliseconds: 500));

    // Crear un nuevo mensaje
    final message = Message(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      senderId: 'currentUser',
      receiverId: 'org$conversationId', // Simulación
      content: content,
      timestamp: DateTime.now(),
      isRead: false,
      type: type,
      attachmentUrl: attachmentUrl,
      attachmentName: attachmentName,
    );

    // En una app real, aquí se guardaría el mensaje en la base de datos

    return message;
  }

  // Marcar mensajes como leídos
  Future<bool> markMessagesAsRead(String conversationId) async {
    // Simular delay de red
    await Future.delayed(const Duration(milliseconds: 300));

    // En una app real, aquí se actualizarían los mensajes en la base de datos

    return true;
  }
}
