import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuutebrok/Const/colors.dart';

  final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
    final RegExp passwordRegex = RegExp(
    r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
  );
var logoText = Text(
  "YUUT EBROK",
  style: GoogleFonts.nanumMyeongjo(
      color: white, fontWeight: FontWeight.w800, letterSpacing: 1),
);

Route createRoute(page) {
  return PageRouteBuilder(
    transitionDuration: const Duration(microseconds: 500),
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

double h(context) {
  return MediaQuery.of(context).size.height;
}

double w(context) {
  return MediaQuery.of(context).size.width;
}
//anekDevanagari