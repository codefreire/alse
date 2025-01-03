import 'package:alse/configuration/app_colors.dart';
import 'package:alse/interface/screens/level/score_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class QuestionScreen extends StatefulWidget {
  static const name = 'question-screen';

  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final List<Map<String, dynamic>> questions = [
    {
      'videoId': 'eF6orKu-Spo',
      'options': ['MANZANA', 'FRESAS', 'PIÑA', 'BANANA'],
      'answer': 'MANZANA',
    },
    {
      'videoId': 'eF6orKu-Spo',
      'options': ['NARANJA', 'MANDARINA', 'LIMÓN', 'PIÑA'],
      'answer': 'MANDARINA',
    },
    {
      'videoId': 'eF6orKu-Spo',
      'options': ['FRESA', 'UVA', 'SANDÍA', 'KIWI'],
      'answer': 'FRESA',
    },
  ];

  int currentQuestionIndex = 0;
  String? selectedAnswer;
  bool? isCorrect;
  int score = 0; // Puntaje acumulado

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text('Pregunta ${currentQuestionIndex + 1}/${questions.length}',
            style: const TextStyle(color: AppColors.tertiaryColor)),
        iconTheme: const IconThemeData(
          color: AppColors.tertiaryColor,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.15),
            child: LinearProgressIndicator(
              value: (currentQuestionIndex + 1) / questions.length,
              color: Colors.green,
              backgroundColor: Colors.grey[300],
              minHeight: 20,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(height: 40),
          const Text(
            'Selecciona la respuesta',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
            child: YoutubePlayerBuilder(
              player: YoutubePlayer(
                controller: YoutubePlayerController(
                  initialVideoId: currentQuestion['videoId'],
                  flags: const YoutubePlayerFlags(
                    autoPlay: false,
                    mute: false,
                  ),
                ),
                showVideoProgressIndicator: true,
              ),
              builder: (context, player) => ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: player,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 30,
                mainAxisSpacing: 40,
                childAspectRatio: 1.5,
              ),
              itemCount: currentQuestion['options'].length,
              itemBuilder: (context, index) {
                final option = currentQuestion['options'][index];
                return ElevatedButton(
                  style: ButtonStyle(
                    elevation: WidgetStateProperty.all(2),
                    shape: WidgetStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
                  ),
                  onPressed: () {
                    setState(() {
                      selectedAnswer = option;
                      isCorrect = (option == currentQuestion['answer']);
                      if (isCorrect!) {
                        score++;
                      }
                    });
                    showResultDialog();
                  },
                  child: Text(option),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> showResultDialog() async {
    await Future.delayed(const Duration(milliseconds: 300));
    if (!mounted) return;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isCorrect! ? Icons.check_circle : Icons.error,
                size: 60,
                color: isCorrect! ? Colors.green : Colors.red,
              ),
              const SizedBox(height: 16),
              Text(
                isCorrect! ? 'Correcto' : 'Incorrecto',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isCorrect! ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                //Navigator.of(context).pop();
                context.pop();
                goToNextQuestion();
              },
              child: const Text('Continuar'),
            ),
          ],
        );
      },
    );
  }

  void goToNextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswer = null;
        isCorrect = null;
      });
    } else {
      // Redirigir a la pantalla de puntaje
      context.pushNamed(ScoreScreen.name);
      //context.go(ScoreScreen.name, extra: score);
    }
  }
}
