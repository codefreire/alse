import 'package:alse/interface/screens/level/question_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScoreScreen extends StatelessWidget {
  static const name = 'score-screen';
  final int score;

  const ScoreScreen({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    const totalQuestions = 3; // Cambia según la cantidad de preguntas

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Tu Puntaje',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: score / totalQuestions,
                  strokeWidth: 10,
                  color: Colors.green,
                  backgroundColor: Colors.grey[300],
                ),
                Text(
                  '${((score / totalQuestions) * 100).toInt()}%',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              '$score / $totalQuestions respuestas correctas',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                //pushnamed
                context.go(QuestionScreen.name); // Volver a iniciar el cuestionario
              },
              child: const Text('Reintentar'),
            ),
          ],
        ),
      ),
    );
  }
}