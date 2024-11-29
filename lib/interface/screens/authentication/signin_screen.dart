import 'package:alse/configuration/app_colors.dart';
import 'package:alse/interface/screens/authentication/signup_screen.dart';
import 'package:alse/interface/screens/home/main_screen.dart';
import 'package:alse/interface/widgets/shared/custom_buttom_widget.dart';
import 'package:alse/interface/widgets/shared/custom_label_widget.dart';
import 'package:alse/interface/widgets/shared/custom_text_input_widget.dart';
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
                    text: 'SIGN IN',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: screenHeight * (1 / 16),
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  child: const CustomLabelWidget(
                    text:
                        'Sign In To Access Your Personalized Learning Journey',
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
                      label: 'Email Here',
                      placeholder: 'Ingrese su email',
                      controller: emailController),
                ),
                Container(
                  height: screenHeight * (2 / 16),
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  padding:
                      EdgeInsets.only(top: (screenHeight * (2 / 16)) * 0.15),
                  child: CustomTextInputWidget(
                    label: 'Password',
                    placeholder: 'Ingrese su contraseña',
                    controller: passwordController,
                    isPassword: true,
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  child: const CustomLabelWidget(
                    text: 'Forgot Password?',
                    fontSize: 12,
                  ),
                ),
                Container(
                  height: screenHeight * (2 / 16),
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  padding: EdgeInsets.symmetric(
                      vertical: (screenHeight * (2 / 16)) * 0.25),
                  child: CustomButtomWidget(
                    text: 'SIGN IN',
                    radius: 5,
                    onPressed: () => {context.pushNamed(MainScreen.name)},
                    textFontSize: 20,
                    colorText: AppColors.tertiaryColor,
                  ),
                ),
                Container(
                  height: screenHeight * (2 / 16),
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.075,
                      right: screenWidth * 0.075,
                      bottom: (screenHeight * (2 / 16)) * 0.1),
                  child: const Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: AppColors.primaryColor,
                          endIndent: 10,
                        ),
                      ),
                      CustomLabelWidget(text: 'Or Sign In with'),
                      Expanded(
                        child: Divider(
                          color: AppColors.primaryColor,
                          indent: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: screenHeight * (2 / 16),
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  padding:
                      EdgeInsets.only(bottom: (screenHeight * (2 / 16)) * 0.5),
                  child: CustomButtomWidget(
                    text: 'Sign In With Google',
                    onPressed: () => {context.pushNamed(MainScreen.name)},
                    radius: 5,
                    iconPath: 'assets/google_icon.png',
                    color: AppColors.tertiaryColor,
                    colorBorder: AppColors.primaryColor,
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
                        "Don't have an Account?",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                      CustomLabelWidget(
                        text: 'Sign Up here',
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
