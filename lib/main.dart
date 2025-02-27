import 'package:alse/configuration/app_colors.dart';
import 'package:alse/configuration/app_router.dart';
import 'package:alse/interface/providers/user_profile_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:alse/interface/providers/theme_notifier.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeNotifier()),
        ChangeNotifierProvider(create: (_) => UserProfileProvider()),
      ],
      child: Consumer<ThemeNotifier>(
        builder: (context, themeNotifier, child) {
          return MaterialApp.router(
            title: 'ALSE',
            routerConfig: appRouter,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorSchemeSeed: AppColors.primaryColor,
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              colorScheme: const ColorScheme.dark(
                primary: AppColors.primaryColor,
                onPrimary: AppColors.tertiaryColor,
                surface: Color.fromARGB(255, 33, 31, 31),
                onSurface: AppColors.tertiaryColor,
              ),
              textTheme: const TextTheme(
                bodyLarge: TextStyle(color: AppColors.tertiaryColor),
                bodyMedium: TextStyle(color: AppColors.tertiaryColor),
                bodySmall: TextStyle(color: AppColors.tertiaryColor),
              ),
            ),
            themeMode:
                themeNotifier.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          );
        },
      ),
    );
  }
}
