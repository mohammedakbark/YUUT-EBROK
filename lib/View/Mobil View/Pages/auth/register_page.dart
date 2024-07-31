import 'package:flutter/material.dart';
import 'package:yuutebrok/Const/colors.dart';
import 'package:yuutebrok/Const/const.dart';
import 'package:yuutebrok/Model/user_model.dart';

import 'package:yuutebrok/View/Mobil%20View/Pages/auth/widget/custom_textfield.dart';
import 'package:yuutebrok/View/utils/appbar_home.dart';
import 'package:yuutebrok/View/widgets/custome_button.dart';
import 'package:yuutebrok/View/widgets/custome_margine.dart';
import 'package:yuutebrok/View/widgets/custome_spacer.dart';
import 'package:yuutebrok/controller/auth/authentication.dart';

class RegisterScreen extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: emptyAppBar(),
      body: CustomMargin(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
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
                  size: .01,
                ),
                cutomeTextField(
                  'Confirm Password',
                  _confirmPasswordController,
                  (value) {
                    if (value!.isEmpty) {
                      return 'Re-enter password';
                    } else if (_passwordController.text != value) {
                      return "Password is not match !";
                    } else {
                      return null;
                    }
                  },
                ),
                CusstomeSpacer(
                  size: .01,
                ),
                cutomeTextField(
                  'Name',
                  _nameController,
                  (value) {
                    if (value!.isEmpty) {
                      return 'Enter your Name ';
                    } else {
                      return null;
                    }
                  },
                ),
                CusstomeSpacer(
                  size: .01,
                ),
                cutomeTextField(
                  keyboardType: TextInputType.number,
                  'Phone',
                  _phoneNumberController,
                  (value) {
                    if (value!.isEmpty) {
                      return 'Enter your Phone Number';
                    }
                    if (value.length > 10) {
                      return 'Phone Number must be 10 digit';
                    } else {
                      return null;
                    }
                  },
                ),
                CusstomeSpacer(
                  size: .05,
                ),
                CusstomeSpacer(
                  size: .05,
                ),
                CustomeButton(
                  bgColor: white,
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      final authController = AuthenticationController();
                      final UserModel userData = UserModel(
                          email: _emailController.text,
                          password: _passwordController.text,
                          name: _nameController.text,
                          phone: _phoneNumberController.text);

                      await authController.addUserData(context, userData);
                      
                    }
                  },
                  title: 'REGISTER',
                  textColor: black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
