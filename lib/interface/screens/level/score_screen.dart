import 'package:alse/configuration/app_colors.dart';
import 'package:alse/interface/screens/home/main_screen.dart';
import 'package:alse/interface/screens/level/question_screen.dart';
import 'package:alse/interface/widgets/shared/custom_buttom_widget.dart';
import 'package:alse/interface/widgets/shared/custom_label_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScoreScreen extends StatelessWidget {
  static const name = 'score-screen';
  
  final Map<String, dynamic> extraData;
  const ScoreScreen({super.key, required this.extraData});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const totalQuestions = 8;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: screenWidth - (screenWidth * 0.3),
                  height: screenWidth - (screenWidth * 0.3),
                  child: CircularProgressIndicator(
                    strokeCap: StrokeCap.round,
                    value: extraData['score'] / totalQuestions,
                    strokeWidth: 20,
                    color: AppColors.secondaryColor,
                  ),
                ),
                CustomLabelWidget(
                  text: '${extraData['score'].toInt()}',
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: CustomLabelWidget(
                    text: 'de ${totalQuestions.toInt()}',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 70),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              child: CustomButtomWidget(
                text: 'REPETIR',
                radius: 5,
                onPressed: () => {context.goNamed(QuestionScreen.name, extra: {'level': extraData['level']})},
                textFontSize: 20,
                colorText: AppColors.primaryColor,
                color: AppColors.tertiaryColor,
                colorBorder: AppColors.secondaryColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              child: CustomButtomWidget(
                text: 'SIGUIENTE',
                radius: 5,
                onPressed: () => {context.pushNamed(MainScreen.name)},
                textFontSize: 20,
                colorText: AppColors.tertiaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
