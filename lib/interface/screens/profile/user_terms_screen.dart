import 'package:alse/configuration/app_colors.dart';
import 'package:alse/interface/widgets/shared/custom_label_widget.dart';
import 'package:flutter/material.dart';

class UserTermsScreen extends StatelessWidget {
  static const name = 'user-terms-screen';
  const UserTermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        iconTheme: const IconThemeData(
          color: AppColors.tertiaryColor,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                alignment: Alignment.centerLeft,
                child: const CustomLabelWidget(
                  text: 'Información de contacto y términos de uso',
                  fontSize: 20,
                  maxLines: 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                alignment: Alignment.centerLeft,
                child: const CustomLabelWidget(
                  text: 'Esta aplicación ha sido desarrollada como parte de un proyecto universitario y está dirigida especialmente a estudiantes para enseñarles lenguaje de señas mediante videos básicos y lecciones interactivas. Su objetivo es facilitar el aprendizaje y fomentar una comunicación más inclusiva en el entorno universitario.',
                  maxLines: 20,
                ),
              ),
              const SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                alignment: Alignment.centerLeft,
                child: const CustomLabelWidget(
                  text: 'Desarrollador:',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                alignment: Alignment.centerLeft,
                child: const CustomLabelWidget(
                  text: 'Este proyecto ha sido creado por Ezequiel Jerez como un aporte educativo. Si tienes preguntas, sugerencias o necesitas soporte técnico, no dudes en contactarme.',
                  maxLines: 20,
                ),
              ),
              const SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                alignment: Alignment.centerLeft,
                child: const CustomLabelWidget(
                  text: 'Contacto:  098 193 0812',
                  maxLines: 2,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              const SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                alignment: Alignment.centerLeft,
                child: const CustomLabelWidget(
                  text: 'Correo electrónico:  ezequiel_2016cuenta@outlook.es',
                  maxLines: 2,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                alignment: Alignment.centerLeft,
                child: const CustomLabelWidget(
                  text: 'Condiciones de uso:',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                alignment: Alignment.centerLeft,
                child: const CustomLabelWidget(
                  text: 'El contenido de esta aplicación está diseñado exclusivamente para fines educativos y dirigido a estudiantes universitarios.',
                  maxLines: 20,
                ),
              ),
              const SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                alignment: Alignment.centerLeft,
                child: const CustomLabelWidget(
                  text: 'Los materiales, incluidos vídeos, gráficos y texto, son propiedad intelectual de su desarrollador y están protegidos por derechos de autor.',
                  maxLines: 20,
                ),
              ),
              const SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                alignment: Alignment.centerLeft,
                child: const CustomLabelWidget(
                  text: 'Al utilizar la aplicación, aceptas estos términos y te comprometes a respetar la propiedad intelectual del proyecto.',
                  maxLines: 20,
                ),
              ),
              const SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                alignment: Alignment.centerLeft,
                child: const CustomLabelWidget(
                  text: 'Gracias por usar esta aplicación y contribuir a un entorno más inclusivo en la universidad.',
                  maxLines: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}