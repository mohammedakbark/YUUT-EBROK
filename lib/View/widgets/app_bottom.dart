import 'package:flutter/material.dart';
import 'package:yuutebrok/Const/colors.dart';
import 'package:yuutebrok/Const/media.dart';
import 'package:yuutebrok/Const/style.dart';
import 'package:yuutebrok/View/widgets/custome_spacer.dart';

class AppBottom extends StatelessWidget {
  const AppBottom({super.key});

  @override
  Widget build(BuildContext context) {
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
            _customeTile(context, instagram, 'Instagram', () {}),
            const Spacer(),
            _customeTile(context, phone, 'Contact us', () {}),
            const Spacer(),
            _customeTile(context, email, 'Email          ', () {}),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
        CusstomeSpacer(
          size: .05,
        ),
        _contactUs('Contact Us', ''),
        CusstomeSpacer(
          size: .05,
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
}
