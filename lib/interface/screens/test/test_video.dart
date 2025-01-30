import 'package:alse/interface/widgets/shared/custom_label_widget.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TestVideoScreen extends StatefulWidget {
  static const name = 'test-video-screen';

  const TestVideoScreen({super.key});

  @override
  State<TestVideoScreen> createState() => _TestVideoScreenState();
}

class _TestVideoScreenState extends State<TestVideoScreen> {
  late YoutubePlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _videoController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
        'https://www.youtube.com/watch?v=eF6orKu-Spo',
      )!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        loop: false,
      ),
    );
  }

  @override
  void dispose() {
    _videoController.dispose();
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
                    text: 'Saludos',
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
                        'Antes de usar la aplicación, ¡conoce estos datos esenciales!" Mira este breve video para descubrir mitos y consejos prácticos sobre el lenguaje de señas.',
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
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: YoutubePlayer(
                            controller: _videoController,
                            showVideoProgressIndicator: true,
                            progressIndicatorColor: Colors.red,
                          ),
                        ))),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  alignment: Alignment.center,
                  child: const CustomLabelWidget(
                    text:
                        'Aprende lenguaje de señas de forma divertida y práctica. Explora temas, completa ejercicios y mejora con videos tutoriales para lograr una comunicación fluida.',
                    maxLines: 4,
                    textAlign: TextAlign.center,
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
