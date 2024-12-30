import 'package:alse/configuration/app_colors.dart';
import 'package:alse/interface/providers/user_profile_provider.dart';
import 'package:alse/interface/screens/profile/edit_profile_screen.dart';
import 'package:alse/interface/screens/profile/help_screen.dart';
import 'package:alse/interface/screens/profile/logout_screen.dart';
import 'package:alse/interface/screens/profile/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  static const name = 'profile-screen';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileImage = context.watch<UserProfileProvider>().profileImage;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            // Avatar e información del usuario
            Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: profileImage != null
                      ? FileImage(profileImage)
                      : const AssetImage('assets/alse_profile.png')
                          as ImageProvider, // Imagen predeterminada
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.watch<UserProfileProvider>().username,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      // SizedBox(height: 4),
                      // Text(
                      //   'youremail@gmail.com',
                      //   style: TextStyle(
                      //     fontSize: 14,
                      //     color: Colors.grey,
                      //   ),
                      // ),
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
            // Opciones de la lista
            OptionItem(
              icon: Icons.person,
              label: 'Edit Profile',
              onTap: () {
                // Acción para editar el perfil
                context.pushNamed(EditProfileScreen.name);
              },
            ),
            OptionItem(
              icon: Icons.settings,
              label: 'Setting',
              onTap: () {
                // Acción para ajustes
                context.pushNamed(SettingScreen.name);
              },
            ),
            OptionItem(
              icon: Icons.help,
              label: 'Help',
              onTap: () {
                // Acción para ayuda
                context.pushNamed(HelpScreen.name);
              },
            ),
            OptionItem(
              icon: Icons.logout,
              label: 'Logout',
              onTap: () {
                // Acción para cerrar sesión
                context.pushNamed(LogoutScreen.name);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class OptionItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const OptionItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
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
                color: AppColors
                    .secondaryColor, // Cambia este color si es necesario
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
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
