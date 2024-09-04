import 'package:flutter/material.dart';

class CustomAppbarHome extends StatelessWidget {
  const CustomAppbarHome(
      {super.key,
      required this.title,
      
      required this.search, required this.onPressedIconfavorite});
  final String title;
  
  final void Function() search;
  final void Function() onPressedIconfavorite;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                  prefixIcon: IconButton(
                      onPressed: search, icon: const Icon(Icons.search)),
                  hintText: title,
                  // Find product
                  hintStyle: const TextStyle(fontSize: 15),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100]),
            ),
          ),
          const SizedBox(
            width: 7,
          ),
         
          const SizedBox(
            width: 7,
          ),
          Container(
            width: 60,
            padding: const EdgeInsets.symmetric(vertical: 7),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(15),
            ),
            child: IconButton(
                onPressed: onPressedIconfavorite,
                icon: Icon(
                  Icons.favorite,
                  color: Colors.grey[400],
                  size: 30,
                )),
          )
        ],
      ),
    );
  }
}
