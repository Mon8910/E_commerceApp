import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.title,
      required this.hint,
      required this.iconData,
      required this.controller,
      required this.validator,
      required this.isNumber,
      this.obscuretext,
      this.onTap});
  final String title;
  final String hint;
  final IconData iconData;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool isNumber;
  final bool? obscuretext;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: isNumber
          ? const TextInputType.numberWithOptions(decimal: true)
          : TextInputType.text,
      validator: validator,
      controller: controller,
      obscureText: obscuretext == null|| obscuretext==false ? false : true,
      decoration: InputDecoration(
        suffixIcon: InkWell(
          onTap: onTap,
          child: Icon(
            iconData,
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 7,
        ),
        label: Text(title),
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}