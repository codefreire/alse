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
          {'titulo': 'A', 'videoId': '84OnmoE20Ug'},
          {'titulo': 'B', 'videoId': 'iuUYnMp4oHo'},
          {'titulo': 'C', 'videoId': 'GXh8v5TE3vg'},
          {'titulo': 'CH', 'videoId': 'hiYXeWBMJPg'},
          {'titulo': 'D', 'videoId': 'hiYXeWBMJPg'},
          {'titulo': 'E', 'videoId': 'IIRekYb4LE0'},
          {'titulo': 'F', 'videoId': 'pzfBLb92q4Q'},
          {'titulo': 'G', 'videoId': 'Kkg5CHet0Sc'},
          {'titulo': 'H', 'videoId': 'Y4dUSdwLTsg'},
          {'titulo': 'I', 'videoId': 'b3rlIt3o3Qo'},
          {'titulo': 'J', 'videoId': 'WIixQoyY4sw'},
          {'titulo': 'K', 'videoId': 'RJ090M3POy0'},
          {'titulo': 'L', 'videoId': '8oJeylqVc-M'},
          {'titulo': 'LL', 'videoId': 'DPIUzcbc8UE'},
          {'titulo': 'M', 'videoId': 'FOoqGm77_Ds'},
          {'titulo': 'N', 'videoId': 'q3W8hMrj0wo'},
          {'titulo': 'Ñ', 'videoId': 'U839KgmADAU'},
          {'titulo': 'O', 'videoId': '_i7LihQuaAY'},
          {'titulo': 'P', 'videoId': 'N42c8nI5l-8'},
          {'titulo': 'Q', 'videoId': 'mwXIDz12Yx0'},
          {'titulo': 'R', 'videoId': 'sko_RPLfUIE'},
          {'titulo': 'RR', 'videoId': 'r60xSQ7wQgw'},
          {'titulo': 'S', 'videoId': 'WD_WBGWPGwY'},
          {'titulo': 'T', 'videoId': '_olZbCf5Wxk'},
          {'titulo': 'U', 'videoId': '5U38VSg9lDw'},
          {'titulo': 'V', 'videoId': 'yUGlSAySsAU'},
          {'titulo': 'W', 'videoId': 'cyQFgFfTCrI'},
          {'titulo': 'X', 'videoId': 'txdxmOnRN5Y'},
          {'titulo': 'Y', 'videoId': '0bTrlJZrMB8'},
          {'titulo': 'Z', 'videoId': 'aXns8uKQ6LU'},
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
          {'titulo': 'Plátano', 'videoId': '9oxdxF0shMM'},
          {'titulo': 'Mango', 'videoId': 'ZwSSwZEavLg'},
          {'titulo': 'Piña', 'videoId': 'AwKyMg5X2TA'},
          {'titulo': 'Guayaba', 'videoId': 'BIlNPh3ySgU'},
          {'titulo': 'Maracuyá', 'videoId': 'CVvsSkMK7Is'},
          {'titulo': 'Naranjilla', 'videoId': '2bd3znur3fI'},
          {'titulo': 'Mora', 'videoId': 'HUy_LQcRCo0'},
          {'titulo': 'Limón', 'videoId': 'b08y_gaZeGA'},
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
          {'titulo': '¿En qué te puedo ayudar?', 'videoId': 'Hm06Hj8NNMA'},
          {
            'titulo': '¿A dónde quieres ir?',
            'videoId': 'PIl38y1m9w4'
          },
          {'titulo': 'Gracias por ayudarme', 'videoId': 'mFCAsI8MZIM'},
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
