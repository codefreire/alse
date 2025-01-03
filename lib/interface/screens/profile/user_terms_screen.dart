import 'package:alse/configuration/app_colors.dart';
import 'package:flutter/material.dart';

class UserTermsScreen extends StatelessWidget {
  static const name = 'user-terms-screen';
  const UserTermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        iconTheme: const IconThemeData(
          color: AppColors.tertiaryColor,
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'POLITICA DE PRIVACIDAD'
            ),
          ],
        ),
      ),
    );
  }
}