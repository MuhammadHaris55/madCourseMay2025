import 'package:flutter/material.dart';
import 'package:mad_course_may_2025/utils/color_palette.dart';

Widget AppText({
  required String text,
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: fontSize ?? 18,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? ColorPalette.primaryColor,
    ),
  );
}
