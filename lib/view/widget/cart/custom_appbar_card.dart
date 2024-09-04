import 'package:flutter/material.dart';

class CustomAppbarCard extends StatelessWidget {
  const CustomAppbarCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
          alignment: Alignment.centerLeft,
          child:
              IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
        )),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: const Text(
              'Cart',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const Spacer()
      ],
    );
  }
}
