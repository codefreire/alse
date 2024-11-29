import 'package:alse/configuration/app_colors.dart';
import 'package:alse/interface/widgets/shared/custom_buttom_widget.dart';
import 'package:alse/interface/widgets/shared/custom_label_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class LogoutScreen extends StatelessWidget {
  static const name = 'logout-screen';

  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomLabelWidget(text: 'Cerrar Secion', fontWeight: FontWeight.bold,),
            const SizedBox(height: 10,),
            const CustomLabelWidget(text: 'Seguro?'),
            const SizedBox(height: 20,),
            Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 90,),
              child: CustomButtomWidget(text: 'Si', textFontSize: 15, onPressed: () {SystemNavigator.pop();}),
            ),
            const SizedBox(height: 12,),
            Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 90),
              child: CustomButtomWidget(text: 'No', textFontSize: 15,  onPressed: () {context.pop();}),
            ),
          ],
        ),
      ),
    );
  }
}
