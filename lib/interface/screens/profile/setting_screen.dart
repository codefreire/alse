import 'package:alse/configuration/app_colors.dart';
import 'package:alse/interface/providers/theme_notifier.dart';
import 'package:alse/interface/widgets/shared/custom_label_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  static const name = 'setting-screen';

  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        iconTheme: const IconThemeData(
          color: AppColors.tertiaryColor,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomLabelWidget(
              text: 'Cambiar Tema',
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 65),
              child: SwitchListTile(
                  title: const CustomLabelWidget(
                    text: 'Modo Oscuro',
                    fontSize: 18,
                  ),
                  value: context.watch<ThemeNotifier>().isDarkMode,
                  onChanged: (bool value) {
                    context.read<ThemeNotifier>().toggleTheme();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
