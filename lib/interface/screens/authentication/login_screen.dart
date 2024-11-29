import 'package:alse/configuration/app_colors.dart';
import 'package:alse/interface/screens/authentication/signin_screen.dart';
import 'package:alse/interface/screens/authentication/signup_screen.dart';
import 'package:alse/interface/widgets/shared/custom_buttom_widget.dart';
import 'package:alse/interface/widgets/shared/custom_label_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  static const name = 'login-screen';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backfroundLogin,
        body: Center(
          child: Column(
            children: [
              Expanded(
                flex: 8,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.15),
                  child: Image.asset(
                    'assets/alse_logo.png',
                  ),
                ),
              ),
              Expanded(
                  flex: 4,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.2),
                    child: const CustomLabelWidget(
                      text:
                          '"Aprende lenguaje de señas de forma fácil y divertida. Avanza por tres niveles de dificultad, practica con ejercicios y consulta videos explicativos. ¡Empieza a',
                      maxLines: 5,
                      textAlign: TextAlign.center,
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                    padding: EdgeInsets.only(
                        left: screenWidth * 0.1,
                        right: screenWidth * 0.1,
                        bottom: (screenHeight * (2 / 16)) * 0.3,
                        top: (screenHeight * (2 / 16)) * 0.2),
                    child: CustomButtomWidget(
                        text: 'Log In',
                        onPressed: () => {context.pushNamed(SigninScreen.name)},
                        textFontSize: 20),
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                    child: CustomButtomWidget(
                      text: 'Sign Up',
                      onPressed: () => {context.pushNamed(SignupScreen.name)},
                      textFontSize: 20,
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Container(
                    padding:
                        EdgeInsets.only(top: (screenHeight * (2 / 16)) * 0.2),
                    child: const CustomLabelWidget(
                      text: 'Forgot Password?',
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
