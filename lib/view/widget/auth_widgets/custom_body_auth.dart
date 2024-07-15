import 'package:flutter/material.dart';

class CustomBodyauth extends StatelessWidget {
  const CustomBodyauth({super.key, required this.body});
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Text(
        body,
        textAlign: TextAlign.center,
      ),
    );
  }
}
