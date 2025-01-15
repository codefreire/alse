import 'package:alse/configuration/app_colors.dart';
import 'package:alse/interface/screens/learning/learning_screen.dart';
import 'package:alse/interface/widgets/learning/card_learning_widget.dart';
import 'package:alse/interface/widgets/shared/custom_label_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoryScreen extends StatelessWidget {
  static const name = 'category-screen';

  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderColor = theme.brightness == Brightness.dark
        ? Colors.white.withOpacity(0.5)
        : AppColors.primaryColor;
        
    final List<Map<String, dynamic>> cards = [
      {
        'titulo': 'Alfabeto',
        'imagenUrl':
            'assets/alfabeto.jpg',
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
        'imagenUrl':
            'assets/colores.jpg',
        //'imagenUrl': 'https://i.ytimg.com/vi/eJUXB3iFNLo/maxresdefault.jpg',
        //'ruta': LearningScreen.name,
        'elementos': [
          {'titulo': 'Rojo', 'videoId': 'SU_KoLijQ4I'},
          {'titulo': 'Naranja', 'videoId': 'I1EwpjsSS-U'},
          {'titulo': 'Amarillo', 'videoId': '_glWgZCNmpg'},
          {'titulo': 'Blanco', 'videoId': 'PwxAG0JCCr8'},
          {'titulo': 'Azul', 'videoId': 'XLNqq5u8_gY'},
          {'titulo': 'Verde', 'videoId': 'QiTz_m_mmRg'},
          {'titulo': 'Morado', 'videoId': 'N8gn2keWXSU'},
          {'titulo': 'Negro', 'videoId': 'oxDk5iaLXb0'},
        ]
      },
      {
        'titulo': 'Frutas',
        'imagenUrl':
            'assets/frutas.jpg',
        //'imagenUrl': 'https://i.ytimg.com/vi/tNbbuCfOlvQ/maxresdefault.jpg',
        //'ruta': LearningScreen.name,
        'elementos': [
          {'titulo': 'Plátano', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'Mango', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'Piña', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'Guayaba', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'Maracuyá', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'Naranjilla', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'Mora', 'videoId': 'eF6orKu-Spo'},
          {'titulo': 'Limón', 'videoId': 'eF6orKu-Spo'},
        ]
      },
      {
        'titulo': 'Lugares de la universidad',
        'imagenUrl':
            'assets/universidad.jpg',
        //'imagenUrl': 'https://www.uartes.edu.ec/sitio/wp-content/uploads/2023/01/senas4-644x429.jpg',
        //'ruta': LearningScreen.name,
        'elementos': [
          {'titulo': 'Biblioteca', 'videoId': 'T6pcVZzYEhM'},
          {'titulo': 'Aula', 'videoId': 'gNnukFz-OQs'},
          {'titulo': 'Cafetería', 'videoId': '6YYm7w3hG3A'},
          {'titulo': 'Baño', 'videoId': '-caoJrD6iC4'},
          {'titulo': 'Librería', 'videoId': 'hnVqdDCP_co'},
          {'titulo': 'Laboratorio', 'videoId': 'WmQHQxgi2MM'},
          {'titulo': 'Dispensario Médico', 'videoId': 'B_RTG-n4sDI'},
          {'titulo': 'Parqueadero', 'videoId': 'VKJmq5Q9_SU'},
        ]
      },
      {
        'titulo': 'Frases de emergencia',
        'imagenUrl':
            'assets/frases.jpg',
        //'imagenUrl': 'https://files.pucp.education/puntoedu/wp-content/uploads/2015/06/2015_06_MIGUEL-RODRIGUEZ015.jpg',
        //'ruta': LearningScreen.name,
        'elementos': [
          {'titulo': 'Hola, ¿Cómo te llamas?', 'videoId': 'SB3VjVLiwDQ'},
          {'titulo': '¿Te puedo ayudar con algo?', 'videoId': 'Hm06Hj8NNMA'},
          {
            'titulo': '¿Dónde quieres ir? Te puedo mostrar el camino',
            'videoId': 'PIl38y1m9w4'
          },
          {'titulo': 'Gracias por tu ayuda', 'videoId': 'mFCAsI8MZIM'},
          {'titulo': 'El baño está por allá', 'videoId': 'XERM92G1sI4'},
          {'titulo': 'Mi nombre es', 'videoId': '6AyfB2Vkv3E'},
          {
            'titulo': 'La biblioteca está cerca de la entrada principal',
            'videoId': 'eF6orKu-Spo'
          },
          {'titulo': 'Si / No', 'videoId': 'C2qaUWobFu0'},
        ]
      },
    ];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Padding(
            padding: EdgeInsets.only(top: 0),
            child: CustomLabelWidget(
              text: 'Categorías',
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                //padding: const EdgeInsets.all(16),
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
                        extra: {
                          'titulo': card['titulo'],
                          'elementos': card['elementos']
                        },
                      );
                    },
                    child: CardLearningWidget(
                      titulo: card['titulo']!,
                      imagenUrl: card['imagenUrl']!,
                      color: borderColor,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
