import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class AppTextfields extends StatelessWidget {
  const AppTextfields({
    super.key,
    required this.hintText,
    required this.onChanged,
    this.textInputType,
    this.suffixIcon,
    this.validator,
    this.obscurePassword = false,
  });

  final void Function(String value)? onChanged;
  final String hintText;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final FormFieldValidator<String>? validator;
  final bool obscurePassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      keyboardType: textInputType,
      onChanged: onChanged,
      obscureText: obscurePassword,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        hintStyle:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        fillColor: const Color(0xff669278),
        filled: true,
        border: const OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
