import 'package:alse/configuration/app_colors.dart';
import 'package:alse/interface/screens/authentication/signup_screen.dart';
import 'package:alse/interface/screens/home/main_screen.dart';
import 'package:alse/interface/widgets/shared/custom_buttom_widget.dart';
import 'package:alse/interface/widgets/shared/custom_label_widget.dart';
import 'package:alse/interface/widgets/shared/custom_text_input_widget.dart';
import 'package:alse/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SigninScreen extends StatefulWidget {
  static const name = 'signin-screen';

  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  height: screenHeight * (2 / 16),
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  padding:
                      EdgeInsets.only(top: (screenHeight * (2 / 16)) * 0.30),
                  child: const CustomLabelWidget(
                    text: 'Iniciar Sesión',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: screenHeight * (1 / 16),
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  child: const CustomLabelWidget(
                    text:
                        'Inicie sesión para acceder a su recorrido de aprendizaje personalizado',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  height: screenHeight * (2 / 16),
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  padding:
                      EdgeInsets.only(top: (screenHeight * (2 / 16)) * 0.15),
                  child: CustomTextInputWidget(
                      label: 'Correo',
                      placeholder: 'Ingrese su email',
                      controller: emailController),
                ),
                Container(
                  height: screenHeight * (2 / 16),
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  padding:
                      EdgeInsets.only(top: (screenHeight * (2 / 16)) * 0.15),
                  child: CustomTextInputWidget(
                    label: 'Contraseña',
                    placeholder: 'Ingrese su contraseña',
                    controller: passwordController,
                    isPassword: true,
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  child: const CustomLabelWidget(
                    text: '¿Has olvidado tu contraseña?',
                    fontSize: 12,
                  ),
                ),
                Container(
                  height: screenHeight * (2 / 16),
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  padding: EdgeInsets.symmetric(
                      vertical: (screenHeight * (2 / 16)) * 0.25),
                  child: CustomButtomWidget(
                    text: 'INICIAR SESIÓN',
                    radius: 5,
                    onPressed: () => {context.pushNamed(MainScreen.name)},
                    textFontSize: 20,
                    colorText: AppColors.tertiaryColor,
                  ),
                ),
                Container(
                  height: screenHeight * (2 / 16),
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  padding:
                      EdgeInsets.only(bottom: (screenHeight * (2 / 16)) * 0.2),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "¿No tienes una cuenta?",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                      CustomLabelWidget(
                        text: 'Regístrate aquí',
                        isLink: true,
                        routeName: SignupScreen.name,
                        fontWeight: FontWeight.bold,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
