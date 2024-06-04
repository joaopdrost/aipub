import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class TextCustom extends StatelessWidget {
  const TextCustom(
      {super.key,
      required this.text,
      this.color,
      this.sizeText,
      this.alignment,
      this.font,
      this.bold,
      this.overflow, 
      this.maxLines});
  final String text;
  final Color? color;
  final double? sizeText;
  final TextAlign? alignment;
  final String? font;
  final FontWeight? bold;
  final TextOverflow? overflow;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return 
    Text(
      text,
      textAlign: alignment ?? TextAlign.center,
      overflow: overflow ?? TextOverflow.ellipsis,
      maxLines: maxLines?? 200,
      style: GoogleFonts.inter(
        textStyle: 
        TextStyle(
          fontSize: sizeText ?? 24,
          color: color ?? Colors.black,
          fontWeight: bold ?? FontWeight.normal),
      )
    );
  }
}
