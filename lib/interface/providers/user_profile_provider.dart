import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfileProvider with ChangeNotifier {
  File? _profileImage;

  File? get profileImage => _profileImage;

  UserProfileProvider() {
    _loadImageFromPreferences();
  }

  Future<void> _loadImageFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final imagePath = prefs.getString('profileImage');
    if (imagePath != null) {
      _profileImage = File(imagePath);
      notifyListeners();
    }
  }

  Future<void> updateProfileImage(File newImage) async {
    _profileImage = newImage;
    notifyListeners();

    // Guardar la imagen en SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('profileImage', newImage.path);
  }
}
