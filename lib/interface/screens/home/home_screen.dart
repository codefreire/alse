import 'package:alse/interface/widgets/shared/custom_label_widget.dart';
import 'package:alse/interface/widgets/shared/progress_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeScreen extends StatefulWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late YoutubePlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _videoController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
        'https://www.youtube.com/watch?v=i0dJpzvMV94',
      )!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        loop: false,
      ),
    );
  }

  @override
  void dispose() {
    _videoController.dispose(); // Libera recursos al salir
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  alignment: Alignment.centerLeft,
                  child: const CustomLabelWidget(
                    text: 'Hola Alex',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: const CustomLabelWidget(
                    text:
                        'Antes de usar la aplicación, ¡conoce estos datos esenciales!" Mira este breve video para descubrir mitos y consejos prácticos sobre el lenguaje de señas. Te dará una base sólida y te ayudará a aprender más rápido y con confianza antes de sumergirte en las lecciones.',
                    maxLines: 6,
                    textAlign: TextAlign.center,
                    fontSize: 11,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    padding: EdgeInsets.symmetric(
                        vertical: (screenHeight * (2 / 16)) * 0.20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: YoutubePlayer(
                        controller: _videoController,
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Colors.red,
                      ),
                    )),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  alignment: Alignment.center,
                  child: const CustomLabelWidget(
                    text:
                        'Aprende lenguaje de señas de forma divertida y práctica. Avanza en tres niveles, explora temas, completa ejercicios y mejora con videos tutoriales para lograr una comunicación fluida.',
                    maxLines: 4,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: const ProgressBarWidget(
                    progress: 0.6,
                    points: 120,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
