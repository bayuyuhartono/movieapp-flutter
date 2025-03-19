import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final IconData prefixIcon;
  final Color fillColor;
  final Color cursorColor;
  final Color textColor;
  final double fontSize;
  final void Function(String value) onChange;

  const SearchField({
    super.key,
    this.prefixIcon = Icons.search,
    this.fillColor = const Color(0xFF212121),
    this.cursorColor = Colors.grey,
    this.textColor = Colors.grey,
    this.fontSize = 13.0, 
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        hintText: 'Search...',
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.grey,
        ),
      ),
      cursorColor: cursorColor,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
      ),
    );
  }
}