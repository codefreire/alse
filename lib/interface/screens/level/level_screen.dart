import 'package:alse/interface/screens/level/question_screen.dart';
import 'package:alse/interface/widgets/level/level_card_widget.dart';
import 'package:alse/interface/widgets/shared/custom_label_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LevelScreen extends StatelessWidget {
  static const name = 'level-screen';

  const LevelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: CustomLabelWidget(
              text: 'Niveles',
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
              child: ListView(children: [
            GestureDetector(
              onTap: () => {context.pushNamed(
                QuestionScreen.name,
                extra: {'level': 1},
              )},
              child: const LevelCardWidget(
                  nivel: 'Nivel 1',
                  subtitulo: 'Básico',
                  descripcion:
                      '"Aprende el alfabeto, números, colores y saludos. Este nivel es fácil y te ayudará a familiarizarte con los gestos básicos para empezar a comunicarte."',
                  progreso: 79,
                  imagenUrl:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ33DIDj1Qi10qUFUQUEjd_dULf3yNtq8KwOeLFVWXgfjtTUPjXsLAlTUBrnE7vjTrjcpw&usqp=CAU'),
              //imagenUrl: 'https://img.freepik.com/foto-gratis/retrato-mujer-comunicarse-traves-lenguaje-senas_23-2148590355.jpg?w=360'),
            ),
            GestureDetector(
              onTap: () => {context.pushNamed(
                QuestionScreen.name,
                extra: {'level': 2},
              )},
              child: const LevelCardWidget(
                nivel: 'Nivel 2',
                subtitulo: 'Intermedio',
                descripcion:
                    '"Domina frases comunes y vocabulario sobre lugares como la biblioteca o cafetería. Aquí aumentarás la complejidad combinando señas para formar oraciones sencillas."',
                progreso: 79,
                imagenUrl:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ33DIDj1Qi10qUFUQUEjd_dULf3yNtq8KwOeLFVWXgfjtTUPjXsLAlTUBrnE7vjTrjcpw&usqp=CAU',
                //bloqueado: true,
              ),
            ),
            GestureDetector(
              onTap: () => {context.pushNamed(
                QuestionScreen.name,
                extra: {'level': 3},
              )},
              child: const LevelCardWidget(
                nivel: 'Nivel 3',
                subtitulo: 'Avanzado',
                descripcion:
                    '"Desarrolla fluidez en conversaciones más complejas."',
                progreso: 0,
                imagenUrl:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ33DIDj1Qi10qUFUQUEjd_dULf3yNtq8KwOeLFVWXgfjtTUPjXsLAlTUBrnE7vjTrjcpw&usqp=CAU',
                //imagenUrl: 'https://atmedios.com/pantallaaccesible/wp-content/uploads/2023/02/Blog-Sordos-570x291.jpg',
                //bloqueado: true,
              ),
            )
          ]))
        ],
      )),
    );
  }
}
