import 'package:auth_front_end/core/constantes/app_colors.dart';
import 'package:flutter/material.dart';

class SharedTextFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final bool obscureText;
  final String labelText;
  final String hintText;
  final Widget suffixIcon;
  final void Function()? showPassword;
  final String? Function(String?) validator;
  const SharedTextFormField({
    super.key,
    required this.keyboardType,
    required this.labelText,
    required this.hintText,
    required this.suffixIcon,
    required this.obscureText,
    required this.validator,
    required this.textEditingController,
    this.showPassword,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          labelText: labelText,
          hintText: hintText,
          suffixIcon: InkWell(
            splashFactory: NoSplash.splashFactory,
            highlightColor: AppColors.transparentColor,
            onTap: showPassword,
            child: suffixIcon,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}
