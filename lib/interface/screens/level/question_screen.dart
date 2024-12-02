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
      'videoId': 'sIlkYSvBjOo',
      'options': ['MANZANA', 'FRESAS', 'PIÑA', 'BANANA'],
      'answer': 'MANZANA',
    },
    {
      'videoId': 'sIfscd-u-3c',
      'options': ['NARANJA', 'MANDARINA', 'LIMÓN', 'PIÑA'],
      'answer': 'MANDARINA',
    },
    {
      'videoId': 'HABzhzcm_pg',
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
    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Pregunta ${currentQuestionIndex + 1}/${questions.length}'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: LinearProgressIndicator(
              value: (currentQuestionIndex + 1) / questions.length,
              color: Colors.green,
              backgroundColor: Colors.grey[300],
            ),
          ),
          const SizedBox(height: 16),
          YoutubePlayerBuilder(
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
              borderRadius: BorderRadius.circular(12),
              child: player,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Selecciona la respuesta',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 2.5,
              ),
              itemCount: currentQuestion['options'].length,
              itemBuilder: (context, index) {
                final option = currentQuestion['options'][index];
                return ElevatedButton(
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