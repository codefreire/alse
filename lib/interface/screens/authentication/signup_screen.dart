import 'package:alse/configuration/app_colors.dart';
import 'package:alse/interface/screens/authentication/signin_screen.dart';
import 'package:alse/interface/screens/home/main_screen.dart';
import 'package:alse/interface/widgets/shared/custom_buttom_widget.dart';
import 'package:alse/interface/widgets/shared/custom_label_widget.dart';
import 'package:alse/interface/widgets/shared/custom_text_input_widget.dart';
import 'package:alse/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends StatefulWidget {
  static const name = 'signup-screen';

  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    //final emailController = TextEditingController();
    //final passwordController = TextEditingController();
    //final fullnameController = TextEditingController();
    //final confirmPasswordController = TextEditingController();

    Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      final errorMessage = await _authService.register(
        _emailController.text,
        _passwordController.text,
        _confirmPasswordController.text,
      );

      setState(() {
        _isLoading = false;
      });

      if (errorMessage == null) {
        context.goNamed(SigninScreen.name);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registro exitoso. Inicia sesión.')),
        );
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(errorMessage)));
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  height: screenHeight * (2 / 17),
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  padding:
                      EdgeInsets.only(top: (screenHeight * (2 / 17)) * 0.30),
                  child: const CustomLabelWidget(
                    text: 'Regístro',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: screenHeight * (1 / 17),
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  child: const CustomLabelWidget(
                    text:
                        'Crea tu cuenta para embarcarte en tu aventura educativa',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                      validator: (value) =>
                      value == null || value.isEmpty ? 'Ingresa tu email' : null,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(labelText: 'Password'),
                      obscureText: true,
                      validator: (value) =>
                      value == null || value.isEmpty ? 'Ingresa tu contraseña' : null,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _confirmPasswordController,
                      decoration: const InputDecoration(labelText: 'Confirm Password'),
                      obscureText: true,
                      validator: (value) =>
                      value == null || value.isEmpty ? 'Confirma tu contraseña' : null,
                    ),
                    const SizedBox(height: 30),
                   _isLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                        onPressed: _register,
                        child: const Text('Registrar'),
                    ),
                  ],
                )
                // Container(
                //   height: screenHeight * (2 / 17),
                //   margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                //   padding:
                //       EdgeInsets.only(top: (screenHeight * (2 / 17)) * 0.15),
                //   child: CustomTextInputWidget(
                //       label: 'Nombre',
                //       placeholder: 'Ingrese su nombre completo',
                //       controller: fullnameController),
                // ),

                /*
                Container(
                  height: screenHeight * (2 / 17),
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  padding:
                      EdgeInsets.only(top: (screenHeight * (2 / 17)) * 0.15),
                  child: CustomTextInputWidget(
                    label: 'Correo aquí',
                    placeholder: 'Ingrese su email',
                    controller: emailController,
                  ),
                ),
                Container(
                  height: screenHeight * (2 / 17),
                  padding:
                      EdgeInsets.only(top: (screenHeight * (2 / 17)) * 0.15),
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  child: CustomTextInputWidget(
                    label: 'Contraseña',
                    placeholder: 'Ingrese su contraseña',
                    controller: passwordController,
                    isPassword: true,
                  ),
                ),
                Container(
                  height: screenHeight * (2 / 17),
                  padding:
                      EdgeInsets.only(top: (screenHeight * (2 / 17)) * 0.15),
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  child: CustomTextInputWidget(
                    label: 'Confirmar contraseña',
                    placeholder: 'Confirme su contraseña',
                    controller: confirmPasswordController,
                    isPassword: true,
                  ),
                ),
                Container(
                  height: screenHeight * (2 / 17),
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  padding: EdgeInsets.symmetric(
                      vertical: (screenHeight * (2 / 17)) * 0.25),
                  child: CustomButtomWidget(
                    text: 'REGISTRARSE',
                    radius: 5,
                    onPressed: () => {context.pushNamed(MainScreen.name)},
                    textFontSize: 20,
                    colorText: AppColors.tertiaryColor,
                  ),
                ),

                */


                ,Container(
                  height: screenHeight * (2 / 17),
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  padding:
                      EdgeInsets.only(bottom: (screenHeight * (2 / 17)) * 0.2),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "¿Ya tienes una cuenta?",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                      CustomLabelWidget(
                        text: 'Inicia sesión aquí',
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
