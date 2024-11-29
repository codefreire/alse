import 'package:alse/configuration/app_colors.dart';
import 'package:alse/configuration/app_utils.dart';
import 'package:flutter/material.dart';

class CustomTextInputWidget extends StatefulWidget {
  final String label;
  final String placeholder;
  final bool isPassword;
  final TextEditingController controller;

  const CustomTextInputWidget(
      {super.key,
      required this.label,
      required this.placeholder,
      this.isPassword = false,
      required this.controller});

  @override
  State<CustomTextInputWidget> createState() => _CustomTextInputWidgetState();
}

class _CustomTextInputWidgetState extends State<CustomTextInputWidget> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();

  String? _validateEmail(String? value) {
    return AppUtils.isValidEmail(value) ? null : 'Formato de email no válido';
  }

  String? _validatePassword(String? value) {
    return AppUtils.isValidPassword(value)
        ? null
        : 'Por favor, ingresa una contraseña';
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
              color: AppColors.primaryColor,
            ),
          ),
          const SizedBox(height: 4),
          TextFormField(
            controller: widget.controller,
            obscureText: widget.isPassword ? _obscureText : false,
            keyboardType: widget.isPassword
                ? TextInputType.text
                : TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: widget.placeholder,
              hintStyle: const TextStyle(
                fontWeight: FontWeight.normal,
                color: AppColors.primaryColor,
                fontSize: 12,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: AppColors.primaryColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: AppColors.primaryColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: AppColors.primaryColor),
              ),
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: AppColors.primaryColor,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
                  : null,
            ),
            validator: widget.isPassword ? _validatePassword : _validateEmail,
          )
        ],
      ),
    );
  }
}
