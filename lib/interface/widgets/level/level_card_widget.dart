import 'package:alse/configuration/app_colors.dart';
import 'package:flutter/material.dart';

class LevelCardWidget extends StatelessWidget {
  final String nivel;
  final String subtitulo;
  final String descripcion;
  final double progreso;
  final String imagenUrl;
  final bool bloqueado;

  const LevelCardWidget(
      {required this.nivel,
      required this.subtitulo,
      required this.descripcion,
      required this.progreso,
      required this.imagenUrl,
      this.bloqueado = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: bloqueado ? Colors.grey[300] : Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagenUrl,
                width: 80,
                height: 120,
                fit: BoxFit.cover,
                color: bloqueado ? Colors.grey : null,
                colorBlendMode: bloqueado ? BlendMode.saturation : null,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nivel,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: bloqueado ? Colors.grey : AppColors.primaryColor,
                    ),
                  ),
                  Text(
                    subtitulo,
                    style: TextStyle(
                      fontSize: 14,
                      color:
                          bloqueado ? Colors.grey[600] : AppColors.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    descripcion,
                    style: TextStyle(
                      fontSize: 9,
                      color: bloqueado ? Colors.grey[600] : Colors.black,
                    ),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            if (bloqueado)
              const Padding(
                padding: EdgeInsets.only(top: 110),
                child: Icon(
                  Icons.lock,
                  color: Colors.grey,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
