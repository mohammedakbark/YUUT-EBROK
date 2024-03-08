import 'package:flutter/material.dart';
import 'package:yuutebrok/Const/colors.dart';
import 'package:yuutebrok/Const/const.dart';
import 'package:yuutebrok/Const/media.dart';

var homeAppBar = AppBar(
  backgroundColor: Colors.transparent,
  elevation: 0,
  centerTitle: true,
  leading: Builder(builder: (context) {
    return IconButton(
      onPressed: () {
        return Scaffold.of(context).openDrawer();
      },
      icon: const ImageIcon(menuImage),
      color: white,
    );
  }),
  title: logoText,
  actions: [
    IconButton(
        onPressed: () {},
        icon: ImageIcon(
          searchImage,
          color: white,
        )),
    IconButton(
        onPressed: () {},
        icon: ImageIcon(
          bagImage,
          color: white,
        ))
  ],
);
