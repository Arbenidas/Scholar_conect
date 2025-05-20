import 'package:flutter/material.dart';

enum NotificationType {
  newScholarship,
  deadlineReminder,
  applicationUpdate,
  message,
  profileView,
  recommendation,
  connection,
  event,
  tip,
  achievement,
  networkingOpportunity,
  system
}

class ScholarNotification {
  final String id;
  final String title;
  final String description;
  final DateTime timestamp;
  final NotificationType type;
  final String? imageUrl;
  final String? actionUrl;
  final bool isRead;
  final Map<String, dynamic>? additionalData;

  ScholarNotification({
    required this.id,
    required this.title,
    required this.description,
    required this.timestamp,
    required this.type,
    this.imageUrl,
    this.actionUrl,
    this.isRead = false,
    this.additionalData,
  });

  IconData get icon {
    switch (type) {
      case NotificationType.newScholarship:
        return Icons.school;
      case NotificationType.deadlineReminder:
        return Icons.timer;
      case NotificationType.applicationUpdate:
        return Icons.assignment;
      case NotificationType.message:
        return Icons.message;
      case NotificationType.profileView:
        return Icons.visibility;
      case NotificationType.recommendation:
        return Icons.thumb_up;
      case NotificationType.connection:
        return Icons.people;
      case NotificationType.event:
        return Icons.event;
      case NotificationType.tip:
        return Icons.lightbulb;
      case NotificationType.achievement:
        return Icons.emoji_events;
      case NotificationType.networkingOpportunity:
        return Icons.handshake;
      case NotificationType.system:
        return Icons.notifications;
    }
  }

  Color get color {
    switch (type) {
      case NotificationType.newScholarship:
        return Colors.blue;
      case NotificationType.deadlineReminder:
        return Colors.orange;
      case NotificationType.applicationUpdate:
        return Colors.green;
      case NotificationType.message:
        return Colors.purple;
      case NotificationType.profileView:
        return Colors.teal;
      case NotificationType.recommendation:
        return Colors.amber;
      case NotificationType.connection:
        return Colors.indigo;
      case NotificationType.event:
        return Colors.pink;
      case NotificationType.tip:
        return Colors.cyan;
      case NotificationType.achievement:
        return Colors.deepOrange;
      case NotificationType.networkingOpportunity:
        return Colors.lightBlue;
      case NotificationType.system:
        return Colors.grey;
    }
  }

  String get typeLabel {
    switch (type) {
      case NotificationType.newScholarship:
        return 'Nueva beca';
      case NotificationType.deadlineReminder:
        return 'Recordatorio';
      case NotificationType.applicationUpdate:
        return 'Actualización de aplicación';
      case NotificationType.message:
        return 'Mensaje nuevo';
      case NotificationType.profileView:
        return 'Vista de perfil';
      case NotificationType.recommendation:
        return 'Recomendación';
      case NotificationType.connection:
        return 'Conexión';
      case NotificationType.event:
        return 'Evento';
      case NotificationType.tip:
        return 'Consejo';
      case NotificationType.achievement:
        return 'Logro';
      case NotificationType.networkingOpportunity:
        return 'Oportunidad de networking';
      case NotificationType.system:
        return 'Sistema';
    }
  }

  ScholarNotification copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? timestamp,
    NotificationType? type,
    String? imageUrl,
    String? actionUrl,
    bool? isRead,
    Map<String, dynamic>? additionalData,
  }) {
    return ScholarNotification(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      timestamp: timestamp ?? this.timestamp,
      type: type ?? this.type,
      imageUrl: imageUrl ?? this.imageUrl,
      actionUrl: actionUrl ?? this.actionUrl,
      isRead: isRead ?? this.isRead,
      additionalData: additionalData ?? this.additionalData,
    );
  }
}
