import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final IconData prefixIcon;
  final Color fillColor;
  final Color cursorColor;
  final Color textColor;
  final double fontSize;

  const SearchField({
    Key? key,
    this.controller,
    this.hintText = 'Search...',
    this.prefixIcon = Icons.search,
    this.fillColor = const Color(0xFF212121),
    this.cursorColor = Colors.grey,
    this.textColor = Colors.grey,
    this.fontSize = 13.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
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
        hintText: hintText,
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