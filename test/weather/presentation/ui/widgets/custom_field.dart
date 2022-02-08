import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 8, horizontal: 16.0),
        filled: true,
        fillColor: const Color(
          0xFFFDFCFC,
        ),
        suffixIcon: const Icon(
          Icons.search,
          size: 18,
          color: Color(0xFFC4C4C4),
        ),
        hintText: "Search Location",
        hintStyle: const TextStyle(
          color: Color(0xFFC4C4C4),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
