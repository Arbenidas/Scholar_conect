import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/notification.dart';
import '../../services/notification_service.dart';
import '../../utils/navigation_helper.dart';

class NotificationDetailScreen extends StatelessWidget {
  final ScholarNotification notification;

  const NotificationDetailScreen({
    Key? key,
    required this.notification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd MMM yyyy, HH:mm');

    return Scaffold(
      appBar: AppBar(
        title: Text(notification.typeLabel),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen de cabecera (si existe)
            if (notification.imageUrl != null)
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  notification.imageUrl!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: notification.color.withOpacity(0.1),
                      child: Center(
                        child: Icon(
                          notification.icon,
                          size: 64,
                          color: notification.color,
                        ),
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
                  // Título
                  Text(
                    notification.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Fecha
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 16,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        dateFormat.format(notification.timestamp),
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Tipo de notificación
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: notification.color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          notification.icon,
                          size: 16,
                          color: notification.color,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          notification.typeLabel,
                          style: TextStyle(
                            fontSize: 14,
                            color: notification.color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Descripción
                  Text(
                    notification.description,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Información adicional basada en el tipo
                  _buildAdditionalInfo(notification),

                  const SizedBox(height: 32),

                  // Botones de acción
                  _buildActionButtons(context, notification),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdditionalInfo(ScholarNotification notification) {
    switch (notification.type) {
      case NotificationType.newScholarship:
        final matchScore = notification.additionalData?['matchScore'] ?? 0;
        final amount = notification.additionalData?['amount'] ?? 0;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Detalles de la beca',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildInfoRow(
              icon: Icons.attach_money,
              label: 'Monto',
              value: '\$${NumberFormat.decimalPattern().format(amount)}',
            ),
            const SizedBox(height: 12),
            _buildInfoRow(
              icon: Icons.percent,
              label: 'Coincidencia con tu perfil',
              value: '$matchScore%',
            ),
            const SizedBox(height: 16),
            LinearProgressIndicator(
              value: matchScore / 100,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(
                matchScore > 80 ? Colors.green : Colors.orange,
              ),
              minHeight: 8,
              borderRadius: BorderRadius.circular(4),
            ),
          ],
        );

      case NotificationType.deadlineReminder:
        final deadlineStr = notification.additionalData?['deadline'] ?? '';
        DateTime? deadline;
        try {
          deadline = DateTime.parse(deadlineStr);
        } catch (e) {
          deadline = null;
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Información de la fecha límite',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            if (deadline != null)
              _buildInfoRow(
                icon: Icons.calendar_today,
                label: 'Fecha límite',
                value: DateFormat('dd MMMM yyyy').format(deadline),
              ),
            const SizedBox(height: 12),
            _buildInfoRow(
              icon: Icons.timer,
              label: 'Tiempo restante',
              value: deadline != null
                  ? _getRemainingTimeText(deadline)
                  : 'Fecha próxima',
            ),
          ],
        );

      case NotificationType.applicationUpdate:
        final status = notification.additionalData?['status'] ?? '';
        final nextStep = notification.additionalData?['nextStep'] ?? '';

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Estado de tu aplicación',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildInfoRow(
              icon: Icons.flag,
              label: 'Estado actual',
              value: status,
            ),
            if (nextStep.isNotEmpty) ...[
              const SizedBox(height: 12),
              _buildInfoRow(
                icon: Icons.arrow_forward,
                label: 'Siguiente paso',
                value: nextStep,
              ),
            ],
          ],
        );

      case NotificationType.event:
        final eventDateStr = notification.additionalData?['eventDate'] ?? '';
        final eventUrl = notification.additionalData?['eventUrl'] ?? '';
        DateTime? eventDate;
        try {
          eventDate = DateTime.parse(eventDateStr);
        } catch (e) {
          eventDate = null;
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Detalles del evento',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            if (eventDate != null)
              _buildInfoRow(
                icon: Icons.event,
                label: 'Fecha y hora',
                value: DateFormat('dd MMMM yyyy, HH:mm').format(eventDate),
              ),
            if (eventUrl.isNotEmpty) ...[
              const SizedBox(height: 12),
              _buildInfoRow(
                icon: Icons.link,
                label: 'Enlace',
                value: eventUrl,
              ),
            ],
          ],
        );

      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 20,
          color: Colors.grey[700],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context, ScholarNotification notification) {
    // Botón principal basado en el tipo de notificación
    Widget primaryButton;

    switch (notification.type) {
      case NotificationType.newScholarship:
      case NotificationType.deadlineReminder:
        primaryButton = ElevatedButton(
          onPressed: () {
            // Navegar a los detalles de la beca
            Navigator.pop(context);
            if (notification.additionalData?['scholarshipId'] != null) {
              NavigationHelper.navigateToScholarshipDetails(
                context,
                notification.additionalData!['scholarshipId']
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Ver detalles de la beca',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        );
        break;

      case NotificationType.applicationUpdate:
      case NotificationType.message:
        primaryButton = ElevatedButton(
          onPressed: () {
            // Navegar a mensajes
            Navigator.pop(context);
            Navigator.pushNamed(context, '/messages');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Ver mensajes',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        );
        break;

      case NotificationType.event:
        primaryButton = ElevatedButton(
          onPressed: () {
            // Abrir enlace del evento
            Navigator.pop(context);
            // En una app real, aquí se abriría el enlace del evento
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Unirse al evento',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        );
        break;

      default:
        primaryButton = ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Entendido',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        );
    }

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: primaryButton,
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {
              // Eliminar notificación
              final notificationService = NotificationService();
              notificationService.deleteNotification(notification.id);
              Navigator.pop(context);
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.grey[700],
              side: BorderSide(color: Colors.grey[400]!),
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Eliminar notificación',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  String _getRemainingTimeText(DateTime deadline) {
    final now = DateTime.now();
    final difference = deadline.difference(now);

    if (difference.isNegative) {
      return 'Plazo vencido';
    }

    if (difference.inDays > 0) {
      return '${difference.inDays} ${difference.inDays == 1 ? 'día' : 'días'}';
    }

    if (difference.inHours > 0) {
      return '${difference.inHours} ${difference.inHours == 1 ? 'hora' : 'horas'}';
    }

    return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minuto' : 'minutos'}';
  }
}
