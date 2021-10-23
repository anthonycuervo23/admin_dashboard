import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextCategory extends StatelessWidget {
  const TextCategory({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      margin: EdgeInsets.only(
        bottom: 5.0,
      ),
      child: Text(
        text,
        style: GoogleFonts.roboto(
          color: Colors.white.withOpacity(0.3),
          fontSize: 12.0,
        ),
      ),
    );
  }
}
