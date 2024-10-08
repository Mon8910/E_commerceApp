import 'package:flutter/material.dart';

class CustomTitleAuth extends StatelessWidget {
  const CustomTitleAuth({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 24),
      textAlign: TextAlign.center,
    );
  }
}
