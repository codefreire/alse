import 'package:alse/configuration/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LearningScreen extends StatelessWidget {
  static const name = 'learning-screen';
  final Map<String, dynamic> extraData;

  const LearningScreen({super.key, required this.extraData});

  @override
  Widget build(BuildContext context) {
    final String titulo = extraData['titulo'] ?? 'Sin título';
    final List<Map<String, String>> elementos = extraData['elementos'] ?? [];

    final theme = Theme.of(context);
    final borderColor = theme.brightness == Brightness.dark
        ? Colors.white.withOpacity(0.5)
        : AppColors.primaryColor;
    final textColor = theme.brightness == Brightness.dark
        ? AppColors.tertiaryColor
        : AppColors.primaryColor;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: Text(
            titulo,
            style: const TextStyle(color: AppColors.tertiaryColor),
          ),
          iconTheme: const IconThemeData(
            color: AppColors.tertiaryColor,
          ),
        ),
        body: GridView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: elementos.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 2 / 3.5,
            ),
            itemBuilder: (context, index) {
              final elemento = elementos[index];
              return ElevatedButton(
                style: ButtonStyle(
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(color: borderColor))),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            YoutubePlayer(
                              controller: YoutubePlayerController(
                                initialVideoId: elemento['videoId']!,
                                flags: const YoutubePlayerFlags(autoPlay: true),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(elemento['titulo']!),
                            const SizedBox(height: 8),
                            IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Text(
                  elemento['titulo']!,
                  style: TextStyle(color: textColor),
                ),
              );
            }));
  }
}
