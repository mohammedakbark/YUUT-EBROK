import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yuutebrok/Const/colors.dart';
import 'package:yuutebrok/Const/const.dart';
import 'package:yuutebrok/Const/media.dart';
import 'package:yuutebrok/Const/style.dart';
import 'package:yuutebrok/View/Mobil%20View/Pages/auth/register_page.dart';
import 'package:yuutebrok/View/Mobil%20View/Pages/auth/widget/custom_textfield.dart';
import 'package:yuutebrok/View/utils/appbar_home.dart';
import 'package:yuutebrok/View/widgets/custome_button.dart';
import 'package:yuutebrok/View/widgets/custome_margine.dart';
import 'package:yuutebrok/View/widgets/custome_spacer.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: emptyAppBar(),
      body: CustomMargin(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              cutomeTextField(
                'Email',
                _emailController,
                (value) {
                  if (value!.isEmpty) {
                    return 'Enter your email address';
                  } else if (!emailRegex.hasMatch(value)) {
                    return "Email is invalid";
                  } else {
                    return null;
                  }
                },
              ),
              CusstomeSpacer(
                size: .01,
              ),
              cutomeTextField(
                'Password',
                _passwordController,
                (value) {
                  if (value!.isEmpty) {
                    return 'Enter a Password';
                  }
                  if (!passwordRegex.hasMatch(value)) {
                    return "Password must be At least one uppercase letter.At least one lowercase letter.At least one digit.At least one special character (e.g., @, #,etc.),Minimum length of 8 characters";
                  } else {
                    return null;
                  }
                },
              ),
              CusstomeSpacer(
                size: .05,
              ),
              CustomeButton(
                bgColor: white,
                onPressed: () {
                  if (formKey.currentState!.validate()) {}
                },
                title: 'LOG IN',
                textColor: black,
              ),
              CusstomeSpacer(
                size: .05,
              ),
              Text(
                'OR',
                style: appTextstyle(),
              ),
              CusstomeSpacer(
                size: .05,
              ),
              CustomeButton(
                bgColor: black,
                onPressed: () {
                  Navigator.of(context).push(createRoute(RegisterScreen()));
                },
                title: 'REGISTER',
                textColor: white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
