import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yuutebrok/Const/colors.dart';
import 'package:yuutebrok/Const/const.dart';
import 'package:yuutebrok/Const/style.dart';

class CustomeButton extends StatelessWidget {
  final String title;
  void Function()? onPressed;
  Color bgColor;
  Color? textColor;

  CustomeButton(
      {super.key,
      required this.bgColor,
      required this.onPressed,
      this.textColor,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: w(context),
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              backgroundColor: bgColor,
              shape: const BeveledRectangleBorder(),
              side: BorderSide(
                width: .5,
                color: white,
              )),
          onPressed: onPressed,
          child: Text(
            title,
            style: appTextstyle(size: 17, color: textColor),
          )),
    );
  }
}
