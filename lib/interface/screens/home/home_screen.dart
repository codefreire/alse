import 'package:alse/interface/providers/user_profile_provider.dart';
import 'package:alse/interface/widgets/shared/custom_label_widget.dart';
//import 'package:alse/interface/widgets/shared/progress_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
//import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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
                  child: CustomLabelWidget(
                    text: 'Hola ${context.watch<UserProfileProvider>().username}',
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
                        '"Antes de usar la aplicación, ¡conoce estos datos esenciales!" Mira este breve video para descubrir mitos y consejos prácticos sobre el lenguaje de señas.',
                    maxLines: 6,
                    textAlign: TextAlign.center,
                    //fontSize: 11,
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
                      )
                    )),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  alignment: Alignment.center,
                  child: const CustomLabelWidget(
                    text:
                        '"Aprende lenguaje de señas de forma divertida y práctica. Explora temas, completa ejercicios y mejora con videos tutoriales para lograr una comunicación fluida."',
                    maxLines: 4,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              // Expanded(
              //   flex: 5,
              //   child: Container(
              //     margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              //     child: const ProgressBarWidget(
              //       progress: 0.6,
              //       points: 120,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      //   floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //       _videoController.value.isPlaying
      //           ? _videoController.pause()
      //           : _videoController.play();
      //     });
      //   },
      //   child: Icon(
      //     _videoController.value.isPlaying ? Icons.pause : Icons.play_arrow,
      //   ),
      // ),
      ),
    );
  }
}
