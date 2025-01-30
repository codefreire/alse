import 'package:alse/configuration/app_colors.dart';
import 'package:alse/interface/providers/user_profile_provider.dart';
import 'package:alse/interface/screens/profile/edit_profile_screen.dart';
import 'package:alse/interface/screens/profile/help_screen.dart';
import 'package:alse/interface/screens/profile/logout_screen.dart';
import 'package:alse/interface/screens/profile/setting_screen.dart';
import 'package:alse/interface/screens/profile/user_terms_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  static const name = 'profile-screen';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.brightness == Brightness.dark
        ? AppColors.tertiaryColor
        : AppColors.primaryColor;

    return FutureBuilder(
      future: context.read<UserProfileProvider>().loadUserProfile(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final profileImage =
              context.watch<UserProfileProvider>().profileImage;
          final username = context.watch<UserProfileProvider>().username;

          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: profileImage != null
                            ? FileImage(profileImage)
                            : const AssetImage('assets/alse_profile.png')
                                as ImageProvider,
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              username,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: textColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    height: 40,
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  OptionItem(
                    icon: Icons.person,
                    label: 'Editar Perfil',
                    onTap: () {
                      context.pushNamed(EditProfileScreen.name);
                    },
                    color: textColor,
                  ),
                  OptionItem(
                    icon: Icons.settings,
                    label: 'Ajustes',
                    onTap: () {
                      context.pushNamed(SettingScreen.name);
                    },
                    color: textColor,
                  ),
                  OptionItem(
                    icon: Icons.help,
                    label: 'Ayuda',
                    onTap: () {
                      context.pushNamed(HelpScreen.name);
                    },
                    color: textColor,
                  ),
                  OptionItem(
                    icon: Icons.verified_user,
                    label: 'Política de privacidad',
                    onTap: () {
                      context.pushNamed(UserTermsScreen.name);
                    },
                    color: textColor,
                  ),
                  OptionItem(
                    icon: Icons.logout,
                    label: 'Salir',
                    onTap: () {
                      context.pushNamed(LogoutScreen.name);
                    },
                    color: textColor,
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

class OptionItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color color;

  const OptionItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.secondaryColor,
                borderRadius: BorderRadius.circular(19),
              ),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 16),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
