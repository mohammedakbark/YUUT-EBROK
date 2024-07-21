import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yuutebrok/Const/colors.dart';
import 'package:yuutebrok/Const/style.dart';
import 'package:yuutebrok/View/widgets/custome_spacer.dart';

class CustomeExpantionTile extends StatelessWidget {
  String title;
  Widget child;

  CustomeExpantionTile({super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      iconColor: white,
      title: Text(title,
          style: appTextstyle(size: 20, fontWeight: FontWeight.bold)),
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: child,
        ),
        CusstomeSpacer(
          size: .01,
        )
      ],
    );
  }
}
