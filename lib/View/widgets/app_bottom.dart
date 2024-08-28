import 'dart:developer';

import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yuutebrok/Const/colors.dart';
import 'package:yuutebrok/Const/const.dart';
import 'package:yuutebrok/Const/media.dart';
import 'package:yuutebrok/Const/style.dart';
import 'package:yuutebrok/Model/admin_info.dart';
import 'package:yuutebrok/View/mobile/admin%20controll/privacy_policy_page.dart';
import 'package:yuutebrok/View/mobile/admin%20controll/shipping_policy.dart';
import 'package:yuutebrok/View/mobile/admin%20controll/terms_of_service_page.dart';
import 'package:yuutebrok/View/widgets/custome_spacer.dart';
import 'package:yuutebrok/controller/controller.dart';
import 'package:yuutebrok/controller/data/database.dart';

class AppBottom extends StatelessWidget {
  const AppBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: FirebaseData().getTheInfoOfAdmin(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox();
          }
          if (!snapshot.hasData) {
            return SizedBox();
          }
          log(snapshot.data.toString());
          final data = SocialMediaLinks.fromMap(
              snapshot.data!.data() as Map<String, dynamic>);
          return Column(
            children: [
              CusstomeSpacer(
                size: .01,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                  _customeTile(context, instagram, () {
                    _openInstagram(data.instagram);
                  }),
                  const Spacer(),
                  _customeTile(context, pintrest, () {
                    _openPinterest(data.pintrest);
                  }),
                  const Spacer(),
                  _customeTile(context, twitter, () {
                    _openTwitter(data.twitter);
                  }),
                  const Spacer(),
                  _customeTile(context, facebook, () {
                    _openFacebook(data.facebook);
                  }),
                  const Spacer(
                    flex: 3,
                  ),
                ],
              ),
              CusstomeSpacer(
                size: .05,
              ),
              _contactUs('Contact Us', data.contactUs),
              CusstomeSpacer(
                size: .02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  _customeButton(() {
                    Navigator.of(context)
                        .push(createRoute(const PrivacyPolicyPage()));
                  }, 'Privacy Policy'),
                  _customeDevider(),
                  _customeButton(() {
                    Navigator.of(context)
                        .push(createRoute(const ShippingPolicyPage()));
                  }, 'Shipping Policy'),
                  _customeDevider(),
                  _customeButton(() {
                    Navigator.of(context)
                        .push(createRoute(const TermsOfServicePage()));
                  }, 'Terms of Services'),
                ],
              )
            ],
          );
        });
  }

  Widget _customeDevider() {
    return Text(
      '|',
      style: appTextstyle(),
    );
  }

  _customeButton(void Function()? onPressed, title) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: appTextstyle(),
        ));
  }

  Widget _customeTile(context, String image, void Function()? onTap) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(
        image,
        color: white,
        scale: 30,
      ),
    );
  }

  Widget _contactUs(String head, String content) {
    return Column(
      children: [
        Text(
          head,
          style: appTextstyle(size: 20, fontWeight: FontWeight.bold),
        ),
        CusstomeSpacer(
          size: .02,
        ),
        Text(
          content,
          style: appTextstyle(),
        )
      ],
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _openInstagram(String id) {
    _launchURL('https://www.instagram.com/$id/');
  }

  void _openFacebook(String id) {
    _launchURL('https://www.facebook.com/$id/');
  }

  void _openPinterest(String id) {
    _launchURL('https://www.pinterest.com/$id/');
  }

  void _openTwitter(String id) {
    _launchURL('https://twitter.com/$id/');
  }
}
