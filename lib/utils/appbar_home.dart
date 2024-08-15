import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:yuutebrok/Const/colors.dart';
import 'package:yuutebrok/Const/const.dart';
import 'package:yuutebrok/Const/media.dart';
import 'package:yuutebrok/Const/style.dart';
import 'package:yuutebrok/Model/cart_model.dart';
import 'package:yuutebrok/View/mobile/screens/check%20out/cart_page.dart';
import 'package:yuutebrok/utils/cart_button.dart';
import 'package:yuutebrok/utils/drawer.dart';
import 'package:yuutebrok/controller/data/hive_database.dart';

homeAppBar(context) => AppBar(
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
        const CartButton()
      ],
    );
////////////////////////////////////////////////////////

////////////////////logo for common pages///////////////////////////////
commmonAppbar(context,bool isBackButtonEnabled) {
  return AppBar(
    leading:isBackButtonEnabled?backButton(context): Builder(builder: (context) {
      return IconButton(
        onPressed: () {
          return Scaffold.of(context).openDrawer();
        },
        icon: const ImageIcon(menuImage),
        color: white,
      );
    }),
    actions: const [
      CartButton(),
      SizedBox(
        width: 10,
      )
    ],
    centerTitle: true,
    title: Image.asset(scale: 30, logo),
  );
}

//////emptyAppBar
emptyAppBar(BuildContext context) {
  return AppBar(
    leading: backButton(context),
    centerTitle: true,
    title: Image.asset(
      logo,
      scale: 30,
    ),
  );
}
