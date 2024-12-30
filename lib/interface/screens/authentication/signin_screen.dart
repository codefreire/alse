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
  final AuthService _authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  
  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    final errorMessage = await _authService.login(
      _emailController.text,
      _passwordController.text,
    );

    setState(() {
      _isLoading = false;
    });

    if (errorMessage == null) {
      context.goNamed(MainScreen.name);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(errorMessage)));
    }
  }

  Future<void> _showForgotPasswordDialog() async {
    final TextEditingController emailController = TextEditingController();
    bool isLoading = false;

    await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Recuperar Contraseña'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Ingresa tu correo electrónico para enviar un enlace de restablecimiento de contraseña.',
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Correo',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  if (isLoading) const SizedBox(height: 16),
                  if (isLoading) const CircularProgressIndicator(),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Cierra el modal
                  },
                  child: const Text('Cancelar'),
                ),
                TextButton(
                  onPressed: isLoading
                      ? null
                      : () async {
                          setState(() {
                            isLoading = true;
                          });

                          final errorMessage = await _authService.resetPassword(
                            emailController.text,
                          );

                          setState(() {
                            isLoading = false;
                          });

                          if (errorMessage == null) {
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Correo de restablecimiento enviado.'),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(errorMessage)),
                            );
                          }
                        },
                  child: const Text('Enviar'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    // Liberar los recursos de los controladores
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
                      controller: _emailController),
                ),
                Container(
                  height: screenHeight * (2 / 16),
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  padding:
                      EdgeInsets.only(top: (screenHeight * (2 / 16)) * 0.15),
                  child: CustomTextInputWidget(
                    label: 'Contraseña',
                    placeholder: 'Ingrese su contraseña',
                    controller: _passwordController,
                    isPassword: true,
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  child: GestureDetector(
                    onTap: _showForgotPasswordDialog,
                    child: const CustomLabelWidget(
                      text: '¿Has olvidado tu contraseña?',
                      fontSize: 12,
                      isLink: true,
                    ),
                  ),
                ),
                _isLoading
                  ? const CircularProgressIndicator()
                  :
                Container(
                  height: screenHeight * (2 / 16),
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  padding: EdgeInsets.symmetric(
                      vertical: (screenHeight * (2 / 16)) * 0.25),
                  child: CustomButtomWidget(
                    text: 'INICIAR SESIÓN',
                    radius: 5,
                    onPressed: _login,
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
