import 'package:alse/configuration/app_colors.dart';
import 'package:alse/interface/screens/level/score_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class QuestionScreen extends StatefulWidget {
  static const name = 'question-screen';

  final int level;

  const QuestionScreen({super.key, required this.level});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  late List<Map<String, dynamic>> questions;

  @override
  void initState() {
    super.initState();
    // Seleccionar preguntas según el nivel
    questions = _getQuestionsByLevel(widget.level);
  }

  List<Map<String, dynamic>> _getQuestionsByLevel(int level) {
    switch (level) {
      case 1:
        return [
          {'videoId': 'eF6orKu-Spo', 'options': ['H', 'E', 'D', 'A'], 'answer': 'E'},
          {'videoId': '_glWgZCNmpg', 'options': ['Amarillo', 'Rojo', 'Blanco', 'Verde'], 'answer': 'Amarillo'},
          {'videoId': 'QiTz_m_mmRg', 'options': ['Blanco', 'Negro', 'Naranja', 'Verde'], 'answer': 'Verde'},
          {'videoId': 'eF6orKu-Spo', 'options': ['L', 'O', 'Ñ', 'I'], 'answer': 'Ñ'},
          {'videoId': 'eF6orKu-Spo', 'options': ['C', 'S', 'F', 'K'], 'answer': 'C'},
          {'videoId': 'I1EwpjsSS-U', 'options': ['Morado', 'Amarillo', 'Azul', 'Naranja'], 'answer': 'Naranja'},
          {'videoId': 'eF6orKu-Spo', 'options': ['G', 'U', 'T', 'N'], 'answer': 'T'},
          {'videoId': 'XLNqq5u8_gY', 'options': ['Negro', 'Azul', 'Rojo', 'Morado'], 'answer': 'Azul'},
        ];
      case 2:
        return [
          {'videoId': 'eF6orKu-Spo', 'options': ['Parqueadero', 'Biblioteca', 'Cafetería', 'Librería'], 'answer': 'Cafetería'},
          {'videoId': 'eF6orKu-Spo', 'options': ['Piña', 'Guayaba', 'Plátano', 'Mora'], 'answer': 'Piña'},
          {'videoId': 'eF6orKu-Spo', 'options': ['Librería', 'Biblioteca', 'Parqueadero', 'Baño'], 'answer': 'Biblioteca'},
          {'videoId': 'eF6orKu-Spo', 'options': ['Aula', 'Laboratorio', 'Cafetería', 'Dispensario Médico'], 'answer': 'Dispensario Médico'},
          {'videoId': 'eF6orKu-Spo', 'options': ['Limón', 'Guayaba', 'Maracuyá', 'Naranjilla'], 'answer': 'Naranjilla'},
          {'videoId': '-caoJrD6iC4', 'options': ['Laboratorio', 'Aula', 'Baño', 'Dispensario Médico'], 'answer': 'Baño'},
          {'videoId': 'eF6orKu-Spo', 'options': ['Maracuyá', 'Plátano', 'Limón', 'Mango'], 'answer': 'Maracuyá'},
          {'videoId': 'eF6orKu-Spo', 'options': ['Mora', 'Mango', 'Piña', 'Naranjilla'], 'answer': 'Mango'},
        ];
      case 3:
        return [
          {'videoId': 'eF6orKu-Spo', 'options': ['La biblioteca está cerca de la entrada principal', '¿Dónde quieres ir? Te puedo mostrar el camino', 'Mi nombre es', 'Hola, ¿Cómo te llamas?'], 'answer': '¿Dónde quieres ir? Te puedo mostrar el camino'},
          {'videoId': 'eF6orKu-Spo', 'options': ['Si / No', '¿Dónde quieres ir? Te puedo mostrar el camino', '¿Te puedo ayudar con algo?', 'Hola, ¿Cómo te llamas?'], 'answer': 'Hola, ¿Cómo te llamas?'},
          {'videoId': 'eF6orKu-Spo', 'options': ['¿Te puedo ayudar con algo?', 'El baño está por allá', 'Gracias por tu ayuda', 'La biblioteca está cerca de la entrada principal'], 'answer': 'Gracias por tu ayuda'},
          {'videoId': 'eF6orKu-Spo', 'options': ['El baño está por allá', 'Mi nombre es', 'Gracias por tu ayuda', 'Si / No'], 'answer': 'El baño está por allá'},
          {'videoId': 'eF6orKu-Spo', 'options': ['Hola, ¿Cómo te llamas?', '¿Dónde quieres ir? Te puedo mostrar el camino', 'Gracias por tu ayuda', 'La biblioteca está cerca de la entrada principal'], 'answer': 'La biblioteca está cerca de la entrada principal'},
          {'videoId': 'eF6orKu-Spo', 'options': ['Mi nombre es', 'La biblioteca está cerca de la entrada principal', 'El baño está por allá', '¿Te puedo ayudar con algo?'], 'answer': 'Mi nombre es'},
          {'videoId': 'eF6orKu-Spo', 'options': ['Si / No', '¿Te puedo ayudar con algo?', 'Mi nombre es', 'La biblioteca está cerca de la entrada principal'], 'answer': '¿Te puedo ayudar con algo?'},
          {'videoId': 'eF6orKu-Spo', 'options': ['¿Dónde quieres ir? Te puedo mostrar el camino', 'El baño está por allá', 'Si / No', 'Mi nombre es'], 'answer': 'Si / No'},
        ];
      default:
        return [];
    }
  }

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
              color: AppColors.progressQuestion,
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
                mainAxisSpacing: 30,
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
                    showResultBottomSheet();
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

  void showResultBottomSheet() {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      backgroundColor:
          isCorrect! ? AppColors.correctAnswer : AppColors.incorrectAnswer,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        final screenWidth = MediaQuery.of(context).size.width;
        return Container(
          padding: const EdgeInsets.all(16),
          margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.25),
          height: 205,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isCorrect! ? Icons.check_circle : Icons.error,
                size: 60,
                color: AppColors.tertiaryColor,
              ),
              const SizedBox(height: 16),
              Text(
                isCorrect! ? '¡Correcto!' : '¡Incorrecto!',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.tertiaryColor,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.tertiaryColor,
                  foregroundColor: isCorrect!
                      ? AppColors.correctAnswer
                      : AppColors.incorrectAnswer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop(); // Oculta el BottomSheet
                  goToNextQuestion();
                },
                child: const Text('Continuar'),
              ),
            ],
          ),
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
      //context.pushNamed(ScoreScreen.name);
      context.goNamed(ScoreScreen.name, extra: {'score': score, 'level': widget.level});
    }
  }
}
