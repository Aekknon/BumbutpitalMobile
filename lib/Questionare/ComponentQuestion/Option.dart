// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Option extends StatelessWidget {
  final Map<String, dynamic> option;
  final void Function(int) onSelect;
  final bool isSelected;

  const Option(
      {Key? key,
      required this.option,
      required this.onSelect,
      required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelect(option["score"]),
      child: Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isSelected ? Color(0XFF6367EA) : Color(0XFFECF2FF),
        ),
        child: Row(
          children: [
            Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: isSelected ? Color(0xFF8BB0FF) : Color(0XFFECF2FF),
              ),
              child: Icon(
                Icons.check,
                size: 16,
                color: Colors.white,
              ),
            ),
            Container(
              width: 20,
            ),
            Text(
              option["text"],
              style: GoogleFonts.karla(
                color: isSelected ? Colors.white : Color(0xFF979797),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
