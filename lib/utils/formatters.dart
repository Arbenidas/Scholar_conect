import 'package:intl/intl.dart' as intl;

class Formatters {
  // Formateador de moneda que maneja errores
  static String formatCurrency(double amount) {
    try {
      // Intentamos usar intl para formatear la moneda
      return intl.NumberFormat.currency(symbol: '\$', decimalDigits: 0)
          .format(amount);
    } catch (e) {
      // Si hay un error, usamos un formato simple como fallback
      return '\$${amount.toInt()}';
    }
  }

  // Formateador de fecha que maneja errores
  static String formatDate(DateTime date) {
    try {
      // Intentamos usar intl para formatear la fecha
      return intl.DateFormat('MMM dd, yyyy').format(date);
    } catch (e) {
      // Si hay un error, usamos un formato manual como fallback
      final months = [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec'
      ];
      return '${months[date.month - 1]} ${date.day}, ${date.year}';
    }
  }
}
