import 'package:alse/configuration/app_colors.dart';
import 'package:alse/interface/widgets/shared/custom_buttom_widget.dart';
import 'package:alse/interface/widgets/shared/custom_label_widget.dart';
import 'package:alse/interface/widgets/shared/custom_text_input_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

    Future<void> _updatePassword() async {
      final newPassword = newPasswordController.text;
      final confirmPassword = confirmPasswordController.text;

      // Verificar si las contraseñas coinciden
      if (newPassword != confirmPassword) {
        // Mostrar mensaje de error si las contraseñas no coinciden
        _showErrorDialog(context, 'Las contraseñas no coinciden.', newPasswordController, confirmPasswordController);
        return;
      }

      try {
        // Obtener el usuario actual
        User? user = FirebaseAuth.instance.currentUser;

        if (user != null) {
          // Actualizar la contraseña
          await user.updatePassword(newPassword);
          await user.reload();
          user = FirebaseAuth.instance.currentUser;

          // Mostrar un mensaje de éxito
          _showSuccessDialog(context, 'Contraseña actualizada con éxito', newPasswordController, confirmPasswordController);
        } else {
          _showErrorDialog(context, 'No se pudo obtener el usuario.', newPasswordController, confirmPasswordController);
        }
      } catch (e) {
        _showErrorDialog(context, 'Error al actualizar la contraseña: $e', newPasswordController, confirmPasswordController);
      }
    }

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
                    text: 'Cambie su contraseña',
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: availableHeight * (2 / 17),
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  child: const CustomLabelWidget(
                    text: 'Restablezca su contraseña para recuperar el acceso a su recorrido de aprendizaje',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  height: availableHeight * (2 / 17),
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  child: CustomTextInputWidget(
                    label: 'Nueva contraseña',
                    placeholder: 'Ingrese su contraseña',
                    controller: newPasswordController,
                    isPassword: true,
                  ),
                ),
                Container(
                  height: availableHeight * (3 / 17),
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  child: CustomTextInputWidget(
                    label: 'Confirmar Contraseña',
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
                    text: 'GUARDAR',
                    radius: 5,
                    onPressed: _updatePassword,
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

  // Función para mostrar un diálogo de error
  void _showErrorDialog(BuildContext context, String message, TextEditingController newPasswordController, TextEditingController confirmPasswordController) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                newPasswordController.clear();
                confirmPasswordController.clear();
                Navigator.of(context).pop();
                context.pop();
                //Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Función para mostrar un diálogo de éxito
  void _showSuccessDialog(BuildContext context, String message, TextEditingController newPasswordController, TextEditingController confirmPasswordController) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Éxito'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                newPasswordController.clear();
                confirmPasswordController.clear();
                Navigator.of(context).pop();
                context.pop(); // Regresar a la pantalla anterior
              },
            ),
          ],
        );
      },
    );
  }
}
