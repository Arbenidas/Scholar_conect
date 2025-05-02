import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final double size;

  const LogoWidget({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: CustomPaint(painter: LogoPainter(), size: Size(size, size)),
    );
  }
}

class LogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint bluePaint =
        Paint()
          ..color = Colors.blue
          ..style = PaintingStyle.fill;

    final Paint cyanPaint =
        Paint()
          ..color = Colors.cyan
          ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Dibuja el círculo azul
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      0,
      3.14, // Medio círculo (180 grados)
      true,
      bluePaint,
    );

    // Dibuja el círculo cyan
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      3.14,
      3.14, // Otro medio círculo (180 grados)
      true,
      cyanPaint,
    );

    // Dibuja el círculo blanco en el centro para crear el efecto de anillo
    final Paint whitePaint =
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill;

    canvas.drawCircle(
      center,
      radius * 0.5, // El círculo blanco es más pequeño
      whitePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
