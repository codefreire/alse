import 'package:alse/configuration/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LearningScreen extends StatelessWidget {
  static const name = 'learning-screen';

  const LearningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> videos = [
      {
        'titulo': 'Manzana',
        'videoId': 'sIlkYSvBjOo',
      },
      {
        'titulo': 'Piña',
        'videoId': 'sIfscd-u-3c',
      },
      {
        'titulo': 'Banana',
        'videoId': 'WOczt9uc39k',
      },
      {
        'titulo': 'Mandarina',
        'videoId': '6oYgduWl8Ak',
      },
      {
        'titulo': 'Fresa',
        'videoId': 'HABzhzcm_pg',
      },
    ];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          iconTheme: const IconThemeData(
            color: AppColors.tertiaryColor,
          ),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: videos.length,
          itemBuilder: (context, index) {
            final video = videos[index];
            return Column(
              children: [
                // Video Player
                YoutubePlayerBuilder(
                  player: YoutubePlayer(
                    controller: YoutubePlayerController(
                      initialVideoId: video['videoId']!,
                      flags: const YoutubePlayerFlags(
                        autoPlay: false,
                        mute: false,
                      ),
                    ),
                    showVideoProgressIndicator: true,
                  ),
                  builder: (context, player) => ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: player,
                  ),
                ),
                const SizedBox(height: 8),
                // Texto debajo del video
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    //print('Botón presionado: ${video['titulo']}');
                  },
                  child: Text(
                    video['titulo']!,
                    style: const TextStyle(color: AppColors.tertiaryColor),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            );
          },
        ));
  }
}
