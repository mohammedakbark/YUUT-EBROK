import 'package:flutter/material.dart';
import 'package:yuutebrok/Const/colors.dart';
import 'package:yuutebrok/Const/const.dart';
import 'package:yuutebrok/Const/media.dart';
import 'package:yuutebrok/View/Mobil%20View/Pages/cart_page.dart';

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
        _cartButton(context)
      ],
    );
////////////////////////////////////////////////////////
_cartButton(
  context,
) {
  return IconButton(
      onPressed: () {
        Navigator.of(context).push(createRoute(const CartPage()));
      },
      icon: ImageIcon(
        bagImage,
        color: white,
      ));
}

////////////////////logo for common pages///////////////////////////////
commmonAppbar(context) {
  return AppBar(
    actions: [
      _cartButton(context),
      const SizedBox(
        width: 10,
      )
    ],
    centerTitle: true,
    title: Image.asset(scale: 30, logo),
  );
}

//////emptyAppBar
emptyAppBar() {
  return AppBar(
    centerTitle: true,
    title: Image.asset(
      logo,
      scale: 30,
    ),
  );
}
