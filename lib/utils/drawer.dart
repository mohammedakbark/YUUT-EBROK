import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yuutebrok/Const/colors.dart';
import 'package:yuutebrok/Const/const.dart';
import 'package:yuutebrok/Const/media.dart';
import 'package:yuutebrok/Const/style.dart';
import 'package:yuutebrok/View/mobile/admin%20controll/privacy_policy_page.dart';
import 'package:yuutebrok/View/mobile/admin%20controll/shipping_policy.dart';
import 'package:yuutebrok/View/mobile/admin%20controll/terms_of_service_page.dart';
import 'package:yuutebrok/View/mobile/screens/order_history_screen.dart';
import 'package:yuutebrok/View/widgets/custome_button.dart';
import 'package:yuutebrok/View/widgets/custome_margine.dart';
import 'package:yuutebrok/controller/auth/authentication.dart';

myDrawer(BuildContext context) => Drawer(
      backgroundColor: black,
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset(scale: 30, logo),
          ),
          drawerTile(
            title: 'My Orders',
            onTap: () {
              Navigator.of(context).push(createRoute(OrderHistoryScreen()));
            },
          ),
          drawerTile(
            title: 'Privacy Policy',
            onTap: () {
              Navigator.of(context).push(createRoute(PrivacyPolicyPage()));
            },
          ),
          drawerTile(
            title: 'Shipping Policy',
            onTap: () {
              Navigator.of(context).push(createRoute(ShippingPolicyPage()));
            },
          ),
          drawerTile(
            title: 'Terms of Services',
            onTap: () {
              Navigator.of(context).push(createRoute(TermsOfServicePage()));
            },
          ),
          CustomMargin(
            child: Column(
              children: [
                CustomeButton(
                  bgColor: white,
                  onPressed: () {
                    AuthenticationController().clearAuth(context);
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
