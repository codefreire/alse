import 'package:alse/configuration/app_colors.dart';
import 'package:alse/interface/widgets/shared/custom_buttom_widget.dart';
import 'package:alse/interface/widgets/shared/custom_label_widget.dart';
import 'package:alse/interface/widgets/shared/custom_text_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HelpScreen extends StatelessWidget {
  static const name = 'help-screen';

  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final appBarHeight = AppBar().preferredSize.height;
    final availableHeight =
        screenHeight - appBarHeight - MediaQuery.of(context).padding.top;

    final newPasswordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

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
                Container(
                  height: availableHeight * (3 / 17),
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  padding: EdgeInsets.only(top: (availableHeight * (3 / 17)) * 0.50),
                  child: const CustomLabelWidget(
                    text: 'Reset Password',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: availableHeight * (2 / 17),
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  child: const CustomLabelWidget(
                    text: 'Reset Your Password To Regain Access To your Learning Journey',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  height: availableHeight * (2 / 17),
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  child: CustomTextInputWidget(
                    label: 'New Password',
                    placeholder: 'Ingrese su contraseña',
                    controller: newPasswordController,
                    isPassword: true,
                  ),
                ),
                Container(
                  height: availableHeight * (3 / 17),
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  child: CustomTextInputWidget(
                    label: 'Confirm Password',
                    placeholder: 'Confirme su contraseña',
                    controller: confirmPasswordController,
                    isPassword: true,
                  ),
                ),
                Container(
                  height: availableHeight * (7 / 17),
                  padding: EdgeInsets.only(bottom: (availableHeight * (7 / 17)) * 0.83),
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  child: CustomButtomWidget(
                    text: 'SAVE',
                    radius: 5,
                    onPressed: () => {context.pop()},
                    textFontSize: 20,
                    colorText: AppColors.tertiaryColor,
                  ),
                ),
              ],
            ),
          ),
        )
      );
  }
}
