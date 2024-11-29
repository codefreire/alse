class AppUtils {
  AppUtils._();

  static bool isValidEmail(String? email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (email == null || email.isEmpty) {
      return false;
    } else if (!emailRegex.hasMatch(email)) {
      return false;
    }
    return true;
  }

  static bool isValidPassword(String? password) {
    if (password == null || password.isEmpty) {
      return false;
    }
    return true;
  }
}
