import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yuutebrok/Const/colors.dart';
import 'package:yuutebrok/Const/const.dart';
import 'package:yuutebrok/Const/media.dart';
import 'package:yuutebrok/Const/style.dart';
import 'package:yuutebrok/View/widgets/custome_spacer.dart';

class AppBottom extends StatelessWidget {
  const AppBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        logoText,
        CusstomeSpacer(
          size: .01,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          width: w(context),
          decoration: BoxDecoration(color: white),
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _customeTile(context, instagram, 'Instagram', () {}),
                CusstomeSpacer(
                  size: .01,
                ),
                _customeTile(context, phone, 'Contact us', () {}),
                CusstomeSpacer(
                  size: .01,
                ),
                _customeTile(context, email, 'Email          ', () {}),
              ],
            ),
          ),
        ),
        //privacy policy | privacy policy | privacy policy
        CusstomeSpacer(
          size: .01,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            _customeButton(() {}, 'Privacy Policy'),
            _customeDevider(),
            _customeButton(() {}, 'Shipping Policy'),
            _customeDevider(),
            _customeButton(() {}, 'Terms of Services'),
          ],
        )
      ],
    );
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

  Widget _customeTile(
      context, String image, String name, void Function()? onTap) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          const Spacer(),
          Image.asset(
            image,
            scale: 30,
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            // width: w(context) * .3,
            child: Text(
              name,
              style: appTextstyle(color: black),
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
