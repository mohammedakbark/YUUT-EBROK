import 'package:flutter/material.dart';
import 'package:yuutebrok/Const/colors.dart';
import 'package:yuutebrok/Const/style.dart';

cutomeTextField(
  String hintText,
  TextEditingController? controller,
  String? Function(String?)? validator, {
  TextInputType? keyboardType,
  int? maxLenght,
}) {
  return TextFormField(
    keyboardType: keyboardType,
    maxLength: maxLenght,
    style: appTextstyle(),
    autovalidateMode: AutovalidateMode.onUserInteraction,
    controller: controller,
    validator: validator,
    cursorColor: white,
    decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: grey),
            borderRadius: BorderRadius.circular(
              0,
            )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: white),
            borderRadius: BorderRadius.circular(
              0,
            )),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: white),
            borderRadius: BorderRadius.circular(
              0,
            )),
        hintStyle: appTextstyle(letterSpacing: 1, color: grey),
        hintText: hintText),
  );
}
