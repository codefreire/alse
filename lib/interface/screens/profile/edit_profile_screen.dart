import 'dart:io';

import 'package:alse/configuration/app_colors.dart';
import 'package:alse/interface/providers/user_profile_provider.dart';
import 'package:alse/interface/widgets/shared/custom_buttom_widget.dart';
import 'package:alse/interface/widgets/shared/custom_text_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfileScreen extends StatefulWidget {
  static const name = 'edit-profile-screen';

  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final fullnameController = TextEditingController();
  //final emailController = TextEditingController();

  File? _profileImage; // Para almacenar la imagen seleccionada
  final String _defaultImage = 'assets/alse_profile.png';
  //String _userName = "Alse";

  @override
  void initState() {
    super.initState();
    _loadProfileImage();
    _loadUserName();
  }

  // Método para cargar la imagen guardada de forma persistente
  Future<void> _loadProfileImage() async {
    final prefs = await SharedPreferences.getInstance();
    final imagePath = prefs.getString('profileImage');
    if (imagePath != null && File(imagePath).existsSync()) {
      setState(() {
        _profileImage = File(imagePath);
      });
    }
  }

  // Método para guardar la imagen de forma persistente
  Future<void> _saveProfileImage(String path) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('profileImage', path);
  }

  // Método para seleccionar la imagen desde la galería o la cámara
  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      if (mounted) {
        setState(() {
          _profileImage = File(pickedFile.path);
        });
        await _saveProfileImage(pickedFile.path);

        // Solo realiza la actualización del perfil si el widget sigue montado
        if (mounted) {
          context
              .read<UserProfileProvider>()
              .updateProfileImage(File(pickedFile.path));
        }
      }
    }
  }

  // Mostrar las opciones (galería o cámara)
  void _showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Seleccionar de la galería'),
                onTap: () {
                  context.pop(); // Cierra el modal
                  _pickImage(ImageSource.gallery); // Abre la galería
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Tomar una foto'),
                onTap: () {
                  context.pop(); // Cierra el modal
                  _pickImage(ImageSource.camera); // Abre la cámara
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Método para cargar el nombre guardado de forma persistente
  Future<void> _loadUserName() async {
    final prefs = await SharedPreferences.getInstance();
    final savedName = prefs.getString('userName') ?? "Alse";
    // setState(() {
    //   _userName = savedName;
    //   fullnameController.text = savedName;
    // });
  }

  // Método para guardar el nombre de forma persistente
  Future<void> _saveUserName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', name);
  }

  @override
  Widget build(BuildContext context) {
    //final fullnameController = TextEditingController();
    //final emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        iconTheme: const IconThemeData(
          color: AppColors.tertiaryColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Stack(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: _profileImage != null
                      ? FileImage(_profileImage!) as ImageProvider
                      : AssetImage(
                          _defaultImage), // Cambia esta URL por tu imagen
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: _showImagePickerOptions,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: AppColors.secondaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: AppColors.tertiaryColor,
                          size: 16,
                        ),
                      ),
                    ))
              ],
            ),
            const SizedBox(height: 16),
            Text(
              context.watch<UserProfileProvider>().username,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            // const SizedBox(height: 4),
            // const Text(
            //   'youremail@gmail.com',
            //   style: TextStyle(
            //     fontSize: 14,
            //     color: Colors.grey,
            //   ),
            // ),
            const Divider(
              height: 40,
              thickness: 1,
              color: Colors.grey,
            ),
            CustomTextInputWidget(
              label: 'Nombre',
              placeholder: '',
              controller: fullnameController,
            ),
            // CustomTextInputWidget(
            //   label: 'Email',
            //   placeholder: '',
            //   controller: emailController,
            // ),
            const SizedBox(
              height: 40,
            ),
            CustomButtomWidget(
              text: 'Actualizar',
              onPressed: () async {
                final newName = fullnameController.text.trim();
                if (newName.isNotEmpty) {
                  await context.read<UserProfileProvider>().updateUsername(newName);
                  //await _saveUserName(newName);
                  // setState(() {
                  //    _userName = newName;
                  // });
                  context.pop();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
