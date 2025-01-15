import 'package:alse/configuration/app_colors.dart';
import 'package:alse/interface/screens/authentication/signin_screen.dart';
import 'package:alse/interface/widgets/shared/custom_buttom_widget.dart';
import 'package:alse/interface/widgets/shared/custom_label_widget.dart';
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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isLoading = false;

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
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
                'Registro exitoso. Revisa tu correo para verificar tu cuenta.'),
          ),
        );
        context.goNamed(SigninScreen.name);
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

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final theme = Theme.of(context);
    final borderColor = theme.brightness == Brightness.dark
        ? Colors.white.withOpacity(0.5)
        : AppColors.primaryColor;
    final hintColor = theme.brightness == Brightness.dark
        ? Colors.white.withOpacity(0.7)
        : AppColors.primaryColor;

    //final emailController = TextEditingController();
    //final passwordController = TextEditingController();
    //final fullnameController = TextEditingController();
    //final confirmPasswordController = TextEditingController();

    //   Future<void> _register() async {
    //   if (_formKey.currentState!.validate()) {
    //     setState(() {
    //       _isLoading = true;
    //     });

    //     final errorMessage = await _authService.register(
    //       _emailController.text,
    //       _passwordController.text,
    //       _confirmPasswordController.text,
    //     );

    //     setState(() {
    //       _isLoading = false;
    //     });

    //     if (errorMessage == null) {
    //       context.goNamed(SigninScreen.name);
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         const SnackBar(content: Text('Registro exitoso. Inicia sesión.')),
    //       );
    //     } else {
    //       ScaffoldMessenger.of(context)
    //           .showSnackBar(SnackBar(content: Text(errorMessage)));
    //     }
    //   }
    // }

    // @override
    // void dispose() {
    //   _emailController.dispose();
    //   _passwordController.dispose();
    //   _confirmPasswordController.dispose();
    //   super.dispose();
    // }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
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
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     TextFormField(
                  //       controller: _emailController,
                  //       decoration: const InputDecoration(labelText: 'Email'),
                  //       validator: (value) =>
                  //       value == null || value.isEmpty ? 'Ingresa tu email' : null,
                  //     ),
                  //     const SizedBox(height: 20),
                  //     TextFormField(
                  //       controller: _passwordController,
                  //       decoration: const InputDecoration(labelText: 'Password'),
                  //       obscureText: true,
                  //       validator: (value) =>
                  //       value == null || value.isEmpty ? 'Ingresa tu contraseña' : null,
                  //     ),
                  //     const SizedBox(height: 20),
                  //     TextFormField(
                  //       controller: _confirmPasswordController,
                  //       decoration: const InputDecoration(labelText: 'Confirm Password'),
                  //       obscureText: true,
                  //       validator: (value) =>
                  //       value == null || value.isEmpty ? 'Confirma tu contraseña' : null,
                  //     ),
                  //     const SizedBox(height: 30),
                  //    _isLoading
                  //       ? const CircularProgressIndicator()
                  //       : ElevatedButton(
                  //         onPressed: _register,
                  //         child: const Text('Registrar'),
                  //     ),
                  //   ],
                  // )
                  //  Container(
                  //    height: screenHeight * (2 / 17),
                  //    margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  //    padding:
                  //        EdgeInsets.only(top: (screenHeight * (2 / 17)) * 0.15),
                  //    child: CustomTextInputWidget(
                  //        label: 'Nombre',
                  //        placeholder: 'Ingrese su nombre completo',
                  //       controller: fullnameController),
                  //  ),

                  Container(
                    height: screenHeight * (2 / 17),
                    margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                    padding:
                        EdgeInsets.only(top: (screenHeight * (2 / 17)) * 0.15),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Correo aquí',
                        hintText: 'Ingrese su email',
                        labelStyle: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.normal,
                          color: hintColor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: borderColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        )
                      ),  
                      controller: _emailController,
                      validator: (value) => value == null || value.isEmpty
                          ? 'Ingresa tu email'
                          : null,
                    ),
                  ),
                  Container(
                    height: screenHeight * (2 / 17),
                    padding:
                        EdgeInsets.only(top: (screenHeight * (2 / 17)) * 0.15),
                    margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Contraseña',
                        hintText: 'Ingrese su contraseña',
                        labelStyle: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.normal,
                          color: hintColor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: borderColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        )
                      ),  
                      controller: _passwordController,
                      obscureText: true,
                validator: (value) => value == null || value.isEmpty
                    ? 'Ingresa tu contraseña'
                    : null,
                    ),
                  ),
                  Container(
                    height: screenHeight * (2 / 17),
                    padding:
                        EdgeInsets.only(top: (screenHeight * (2 / 17)) * 0.15),
                    margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Confirmar contraseña',
                        hintText: 'Confirme su contraseña',
                        labelStyle: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.normal,
                          color: hintColor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: borderColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        )
                      ),  
                      controller: _confirmPasswordController,
                      obscureText: true,
                validator: (value) => value == null || value.isEmpty
                    ? 'Ingresa tu contraseña'
                    : null,
                    ),
                  ),
                  _isLoading
                      ? const CircularProgressIndicator()
                      : Container(
                          height: screenHeight * (2 / 17),
                          margin: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.1),
                          padding: EdgeInsets.symmetric(
                              vertical: (screenHeight * (2 / 17)) * 0.25),
                          child: CustomButtomWidget(
                            text: 'REGISTRARSE',
                            radius: 5,
                            onPressed: _register,
                            textFontSize: 20,
                            colorText: AppColors.tertiaryColor,
                          ),
                        ),
                  Container(
                    height: screenHeight * (2 / 17),
                    margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                    padding: EdgeInsets.only(
                        bottom: (screenHeight * (2 / 17)) * 0.2),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "¿Ya tienes una cuenta?",
                          style:
                              TextStyle(decoration: TextDecoration.underline),
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
      ),
    );
  }
}
