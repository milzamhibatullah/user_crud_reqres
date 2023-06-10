import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle fontStyles(
        {double size = 14.0,
        weight = FontWeight.normal,
        Color color = Colors.black}) =>
    GoogleFonts.poppins(
        color: color,
        fontSize: size.sp,
        fontWeight: weight,
        wordSpacing: .5,
        height: 1.25);
