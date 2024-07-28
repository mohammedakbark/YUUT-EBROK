import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuutebrok/Const/colors.dart';
import 'package:yuutebrok/Const/const.dart';
import 'package:yuutebrok/Const/media.dart';
import 'package:yuutebrok/Const/style.dart';
import 'package:yuutebrok/View/Mobil%20View/Pages/cart_page.dart';
import 'package:badges/badges.dart' as badges;
import 'package:yuutebrok/controller/data/hive_database.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HiveDatabase>(builder: (context, hiveController, child) {
      return hiveController.cartLenght == 0
          ? IconButton(
              onPressed: () {
                Navigator.of(context).push(createRoute(const CartPage()));
              },
              icon: ImageIcon(
                bagImage,
                color: white,
              ))
          : badges.Badge(
              badgeContent: Text(
                hiveController.cartLenght.toString(),
                style: appTextstyle(color: black),
              ),
              position: badges.BadgePosition.topEnd(top: -1, end: -1),
              showBadge: true,
              ignorePointer: false,
              onTap: () {},
              // badgeContent: const Icon(Icons.check, color: Colors.white, size: 10),
              badgeAnimation: const badges.BadgeAnimation.scale(
                animationDuration: Duration(seconds: 1),
                colorChangeAnimationDuration: Duration(seconds: 1),
                loopAnimation: false,
                curve: Curves.fastOutSlowIn,
                colorChangeAnimationCurve: Curves.easeInCubic,
              ),
              badgeStyle: badges.BadgeStyle(
                shape: badges.BadgeShape.circle,
                badgeColor: Colors.orange,
                padding: const EdgeInsets.all(5),
                borderRadius: BorderRadius.circular(4),
                elevation: 0,
              ),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(createRoute(const CartPage()));
                  },
                  icon: ImageIcon(
                    bagImage,
                    color: white,
                  )),
            );
    });
  }
}
