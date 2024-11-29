import 'package:alse/configuration/app_colors.dart';
import 'package:alse/interface/screens/authentication/signin_screen.dart';
import 'package:alse/interface/screens/home/main_screen.dart';
import 'package:alse/interface/widgets/shared/custom_buttom_widget.dart';
import 'package:alse/interface/widgets/shared/custom_label_widget.dart';
import 'package:alse/interface/widgets/shared/custom_text_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends StatefulWidget {
  static const name = 'signup-screen';

  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final fullnameController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  height: screenHeight * (2 / 17),
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  padding: EdgeInsets.only(top: (screenHeight * (2 / 17)) * 0.30),
                  child: const CustomLabelWidget(
                    text: 'SIGN UP',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: screenHeight * (1 / 17),
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  child: const CustomLabelWidget(
                    text:
                        'Create Your Account To Embark On Your Educational Adventure',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  height: screenHeight * (2 / 17),
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  padding: EdgeInsets.only(top: (screenHeight * (2 / 17)) * 0.15),
                  child: CustomTextInputWidget(
                      label: 'Full Name',
                      placeholder: 'Ingrese su nombre completo',
                      controller: fullnameController),
                ),
                Container(
                  height: screenHeight * (2 / 17),
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  padding: EdgeInsets.only(top: (screenHeight * (2 / 17)) * 0.15),
                  child: CustomTextInputWidget(
                    label: 'Email Here',
                    placeholder: 'Ingrese su email',
                    controller: emailController,
                  ),
                ),
                Container(
                  height: screenHeight * (2 / 17),
                  padding: EdgeInsets.only(top: (screenHeight * (2 / 17)) * 0.15),
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  child: CustomTextInputWidget(
                    label: 'Password',
                    placeholder: 'Ingrese su contraseña',
                    controller: passwordController,
                    isPassword: true,
                  ),
                ),
                Container(
                  height: screenHeight * (2 / 17),
                  padding: EdgeInsets.only(top: (screenHeight * (2 / 17)) * 0.15),
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  child: CustomTextInputWidget(
                    label: 'Confirm Password',
                    placeholder: 'Confirme su contraseña',
                    controller: confirmPasswordController,
                    isPassword: true,
                  ),
                ),
                Container(
                  height: screenHeight * (2 / 17),
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  padding: EdgeInsets.symmetric(vertical: (screenHeight * (2 / 17)) * 0.25),
                  child: CustomButtomWidget(
                    text: 'SIGN IN',
                    radius: 5,
                    onPressed: () => {context.pushNamed(MainScreen.name)},
                    textFontSize: 20,
                    colorText: AppColors.tertiaryColor,
                  ),
                ),
                Container(
                  height: screenHeight * (1 / 17),
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.075,
                      right: screenWidth * 0.075,
                      bottom: (screenHeight * (2 / 17)) * 0.1),
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
                  height: screenHeight * (1 / 17),
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  child: CustomButtomWidget(
                    text: 'Sign Un With Google',
                    onPressed: () => {context.pushNamed(MainScreen.name)},
                    radius: 5,
                    iconPath: 'assets/google_icon.png',
                    color: AppColors.tertiaryColor,
                    colorBorder: AppColors.primaryColor,
                  ),
                ),
                Container(
                  height: screenHeight * (2 / 17),
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  padding:
                      EdgeInsets.only(bottom: (screenHeight * (2 / 17)) * 0.2),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an Account?",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                      CustomLabelWidget(
                        text: 'Sign Ip here',
                        isLink: true,
                        routeName: SigninScreen.name,
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
