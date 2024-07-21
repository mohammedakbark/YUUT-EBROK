import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';
import 'package:yuutebrok/Const/colors.dart';

 appTextstyle({double? size, FontWeight? fontWeight,double? letterSpacing,Color? color}) {
  return GoogleFonts.anekBangla(
      color:color?? white,
      fontWeight: fontWeight,
      fontSize: size,
      letterSpacing: letterSpacing);
}