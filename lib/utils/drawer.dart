import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yuutebrok/Const/colors.dart';
import 'package:yuutebrok/Const/const.dart';
import 'package:yuutebrok/Const/media.dart';
import 'package:yuutebrok/Const/style.dart';
import 'package:yuutebrok/View/widgets/custome_button.dart';
import 'package:yuutebrok/View/widgets/custome_margine.dart';
import 'package:yuutebrok/controller/auth/authentication.dart';

var myDrawer = Drawer(
  backgroundColor: black,
  child: ListView(
    children: [
      DrawerHeader(
        child: Image.asset(scale: 30, logo),
      ),
      drawerTile(
        title: 'My Order',
        onTap: () {},
      ),
      CustomMargin(
        child: Column(
          children: [
            CustomeButton(
              bgColor: white,
              onPressed: () {
                AuthenticationController().clearAuth();
              },
              title: 'Sign out',
              textColor: black,
            )
          ],
        ),
      )
    ],
  ),
);

drawerTile({void Function()? onTap, String? title}) => ListTile(
      onTap: onTap,
      leading: Icon(color: white, Icons.arrow_forward_rounded),
      title: Text(
        title ?? '',
        style: appTextstyle(size: 17, color: white),
      ),
    );
