import 'package:alse/interface/screens/learning/learning_screen.dart';
import 'package:alse/interface/widgets/learning/card_learning_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoryScreen extends StatelessWidget {
  static const name = 'category-screen';

  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> cards = [
      {
        'titulo': 'Alfabeto',
        'imagenUrl': 'https://imagedelivery.net/nv-bJhgmsJrHH2_eM9JJ0w/48060/public',
        'ruta': LearningScreen.name,
      },
      {
        'titulo': 'Colores',
        'imagenUrl': 'https://i.ytimg.com/vi/eJUXB3iFNLo/maxresdefault.jpg',
        'ruta': LearningScreen.name,
      },
      {
        'titulo': 'Frutas',
        'imagenUrl': 'https://i.ytimg.com/vi/tNbbuCfOlvQ/maxresdefault.jpg',
        'ruta': LearningScreen.name,
      },
      {
        'titulo': 'Lugares de la universidad',
        'imagenUrl': 'https://www.uartes.edu.ec/sitio/wp-content/uploads/2023/01/senas4-644x429.jpg',
        'ruta': LearningScreen.name,
      },
      {
        'titulo': 'Frases de emergencia',
        'imagenUrl': 'https://files.pucp.education/puntoedu/wp-content/uploads/2015/06/2015_06_MIGUEL-RODRIGUEZ015.jpg',
        'ruta': LearningScreen.name,
      },
    ];
    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 4 / 4,
        ),
        itemCount: cards.length,
        itemBuilder: (context, index) {
          final card = cards[index];
          return GestureDetector(
            onTap: () {
              context.pushNamed(card['ruta']!);
            },
            child: CardLearningWidget(
              titulo: card['titulo']!,
              imagenUrl: card['imagenUrl']!,
            ),
          );
        },
      ),
    );
  }
}
