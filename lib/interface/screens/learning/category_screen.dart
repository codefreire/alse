import 'package:alse/interface/screens/learning/learning_screen.dart';
import 'package:alse/interface/widgets/learning/card_learning_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoryScreen extends StatelessWidget {
  static const name = 'category-screen';

  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> cards = [
      {
        'titulo': 'Alfabeto',
        'imagenUrl': 'https://imagedelivery.net/nv-bJhgmsJrHH2_eM9JJ0w/48060/public',
        //'ruta': LearningScreen.name,
        'elementos': [
          {'titulo': 'A', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'B', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'C', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'D', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'E', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'F', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'G', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'H', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'I', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'J', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'K', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'L', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'M', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'N', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'Ñ', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'O', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'P', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'Q', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'R', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'S', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'T', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'U', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'V', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'W', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'X', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'Y', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'Z', 'videoId': 'eF6orKu-Spo'},
        ]
      },
      {
        'titulo': 'Colores',
        'imagenUrl': 'https://imagedelivery.net/nv-bJhgmsJrHH2_eM9JJ0w/48060/public',
        //'imagenUrl': 'https://i.ytimg.com/vi/eJUXB3iFNLo/maxresdefault.jpg',
        //'ruta': LearningScreen.name,
        'elementos': [
          {'titulo': 'Rojo', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'Naranja', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'Amarillo', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'Blanco', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'Azul', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'Verde', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'Morado', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'Negro', 'videoId': 'eF6orKu-Spo'},
        ]
      },
      {
        'titulo': 'Frutas',
        'imagenUrl': 'https://imagedelivery.net/nv-bJhgmsJrHH2_eM9JJ0w/48060/public',
        //'imagenUrl': 'https://i.ytimg.com/vi/tNbbuCfOlvQ/maxresdefault.jpg',
        //'ruta': LearningScreen.name,
        'elementos': [
          {'titulo': 'Plátano', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'Mango', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'Piña', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'Guayaba', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'Maracuya', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'Naranjilla', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'Mora', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'Limón', 'videoId': 'eF6orKu-Spo'},
        ]
      },
      {
        'titulo': 'Lugares de la universidad',
        'imagenUrl': 'https://imagedelivery.net/nv-bJhgmsJrHH2_eM9JJ0w/48060/public',
        //'imagenUrl': 'https://www.uartes.edu.ec/sitio/wp-content/uploads/2023/01/senas4-644x429.jpg',
        //'ruta': LearningScreen.name,
        'elementos': [
          {'titulo': 'Biblioteca', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'Aula', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'Cafetería', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'Baño', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'Librería', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'Laboratorio', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'Dispensario Médico', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'Parqueadero', 'videoId': 'eF6orKu-Spo'},          
        ]
      },
      {
        'titulo': 'Frases de emergencia',
        'imagenUrl': 'https://imagedelivery.net/nv-bJhgmsJrHH2_eM9JJ0w/48060/public',
        //'imagenUrl': 'https://files.pucp.education/puntoedu/wp-content/uploads/2015/06/2015_06_MIGUEL-RODRIGUEZ015.jpg',
        //'ruta': LearningScreen.name,
        'elementos': [
          {'titulo': 'Hola, ¿Cómo te llamas?', 'videoId': 'eF6orKu-Spo'},
          {'titulo': '¿Te puedo ayudar con algo?', 'videoId': 'eF6orKu-Spo'},
          {'titulo': '¿Dónde quieres ir? Te puedo mostrar el camino', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'Gracias por tu ayuda', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'El baño está por allá', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'Mi nombre es', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'La biblioteca está cerca de la entrada principal', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'Si / No', 'videoId': 'eF6orKu-Spo'},
        ]
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
              context.pushNamed(
                LearningScreen.name,
                extra: {'titulo': card['titulo'], 'elementos': card['elementos']},
              );
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
