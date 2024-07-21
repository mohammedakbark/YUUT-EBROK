import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yuutebrok/Const/const.dart';

class CusstomeSpacer extends StatelessWidget {
  double ?size;
   CusstomeSpacer({super.key,this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:size==null? h(context):h(context)*size!,
    );
  }
}
