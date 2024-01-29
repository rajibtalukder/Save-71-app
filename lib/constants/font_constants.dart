
import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

double fontVeryBig = 26.sp;
double fontBig = 22.sp;

double fontMediumExtra = 20.sp;
double fontMedium = 18.sp;

double fontSmall = 16.sp;
double fontVerySmall = 14.sp;
double fontTiny = 12.sp;

TextStyle secondaryTextStyle(double size, Color color, FontWeight fontWeight) =>
    GoogleFonts.raleway(color: color, fontSize: size, fontWeight: fontWeight);
TextStyle primaryTextStyle(double size, Color color, FontWeight fontWeight) =>
    GoogleFonts.anekDevanagari(color: color, fontSize: size, fontWeight: fontWeight);
