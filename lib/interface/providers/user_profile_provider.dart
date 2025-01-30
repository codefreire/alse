import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfileProvider with ChangeNotifier {
  File? _profileImage;
  String _username = 'Alse';

  File? get profileImage => _profileImage;
  String get username => _username;

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

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('profileImage', newImage.path);
  }

  Future<void> loadUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    _username = prefs.getString('username') ?? 'Alse';
    final imagePath = prefs.getString('profileImage');
    if (imagePath != null && File(imagePath).existsSync()) {
      _profileImage = File(imagePath);
    }
    notifyListeners();
  }

  Future<void> updateUsername(String name) async {
    _username = name;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', name);
    notifyListeners();
  }
}
