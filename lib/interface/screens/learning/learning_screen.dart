import 'package:alse/configuration/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:go_router/go_router.dart';

class LearningScreen extends StatelessWidget {
  static const name = 'learning-screen';
  final Map<String, dynamic> extraData;

  const LearningScreen({super.key, required this.extraData});

  @override
  Widget build(BuildContext context) {
    // Obtén los datos del `extra` del estado actual de GoRouter.
    //final Map<String, dynamic> args = GoRouter.of(context).extra as Map<String, dynamic>;

    // Asegúrate de que los datos están presentes.
    final String titulo = extraData['titulo'] ?? 'Sin título';
    final List<Map<String, String>> elementos = extraData['elementos'] ?? [];
    
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: Text(titulo, style: const TextStyle(color: AppColors.tertiaryColor),),
          iconTheme: const IconThemeData(
            color: AppColors.tertiaryColor,
          ),
        ),
        body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: elementos.length,
        itemBuilder: (context, index) {
          final elemento = elementos[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ElevatedButton(
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
              child: Text(elemento['titulo']!),
            ),
          );
        },
      ),
    );
  }
}