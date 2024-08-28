import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuutebrok/Const/const.dart';
import 'package:yuutebrok/Const/style.dart';
import 'package:yuutebrok/View/widgets/custome_margine.dart';
import 'package:yuutebrok/controller/controller.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Controller>(context);

    return Scaffold(
      appBar: AppBar(
        leading: backButton(context),
        title: Text(
          'Privacy Policy',
          style: appTextstyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: CustomMargin(
          child: SingleChildScrollView(
            child: Text(
                    data.socialMediaLinks.privacyPolicy,
                    style: appTextstyle(size: 20),
                  ),
          )),
    );
  }
}
