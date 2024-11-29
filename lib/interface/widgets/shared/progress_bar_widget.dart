import 'package:alse/configuration/app_colors.dart';
import 'package:flutter/material.dart';

class ProgressBarWidget extends StatelessWidget {
  final double progress;
  final int points;

  const ProgressBarWidget({
    super.key,
    required this.progress,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Nivel',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Icon(Icons.card_giftcard, color: AppColors.primaryColor),
                    Text('', style: TextStyle(fontSize: 12)),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.card_giftcard, color: AppColors.primaryColor),
                    Text('Level 1', style: TextStyle(fontSize: 12)),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.card_giftcard, color: AppColors.primaryColor),
                    Text('Level 2', style: TextStyle(fontSize: 12)),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.card_giftcard, color: AppColors.primaryColor),
                    Text('Level 3', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: progress,
                  child: Container(
                    height: 10,
                    decoration: BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width * progress - 20,
                  top: 20,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          points.toString(),
                          style: const TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                      CustomPaint(
                        size: const Size(10, 10),
                        painter: TrianglePainter(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text('Puntos'),
          ],
        ),
      ),
    );
  }
}

// Triángulo para la punta de la burbuja
class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = Colors.teal[800]!;
    final Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width / 2, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
