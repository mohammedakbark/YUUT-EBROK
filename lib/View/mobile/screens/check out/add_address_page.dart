import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:yuutebrok/Const/colors.dart';
import 'package:yuutebrok/Const/const.dart';
import 'package:yuutebrok/Const/style.dart';
import 'package:yuutebrok/Model/address_model.dart';
import 'package:yuutebrok/View/widgets/custom_textfield.dart';
import 'package:yuutebrok/View/mobile/screens/check%20out/razorpay_int.dart';
import 'package:yuutebrok/utils/appbar_home.dart';
import 'package:yuutebrok/View/widgets/custome_button.dart';
import 'package:yuutebrok/View/widgets/custome_margine.dart';
import 'package:yuutebrok/View/widgets/custome_spacer.dart';
import 'package:yuutebrok/controller/auth/authentication.dart';
import 'package:yuutebrok/controller/data/hive_database.dart';

class AddAdreesPage extends StatelessWidget {
  AddAdreesPage({super.key});
  TextEditingController _emailController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _countryController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _streetAdressController = TextEditingController();
  TextEditingController _areaController = TextEditingController();
  TextEditingController _postCodeController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final userModel =
        Provider.of<AuthenticationController>(context, listen: false).userModel;
    final hiveController = Provider.of<HiveDatabase>(context, listen: false);
    _firstNameController = TextEditingController(text: userModel.name);
    _emailController = TextEditingController(text: userModel.email);
    _phoneNumberController = TextEditingController(text: userModel.phone);

    return Scaffold(
      appBar: emptyAppBar(context),
      body: CustomMargin(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Shipping Address',
                  style: appTextstyle(fontWeight: FontWeight.bold, size: 20),
                ),
                CusstomeSpacer(
                  size: .03,
                ),
                cutomeTextField(
                  'First Name',
                  _firstNameController,
                  (value) {
                    if (value!.isEmpty) {
                      return 'Enter your First Name';
                    } else {
                      return null;
                    }
                  },
                ),
                CusstomeSpacer(
                  size: .01,
                ),
                cutomeTextField(
                  'Last Name',
                  _lastNameController,
                  (value) {
                    if (value!.isEmpty) {
                      return 'Enter your Last Name';
                    } else {
                      return null;
                    }
                  },
                ),
                CusstomeSpacer(
                  size: .01,
                ),
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
                  keyboardType: TextInputType.number,
                  'Phone Number',
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
                  size: .01,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      flex: 1,
                      child: cutomeTextField(
                        // keyboardType: TextInputType.number,
                        'Country',
                        _countryController,
                        (value) {
                          if (value!.isEmpty) {
                            return 'Enter your Country ';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      flex: 1,
                      child: cutomeTextField(
                        // keyboardType: TextInputType.number,
                        'City',
                        _cityController,
                        (value) {
                          if (value!.isEmpty) {
                            return 'Enter your City ';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
                CusstomeSpacer(
                  size: .01,
                ),
                cutomeTextField(
                  // keyboardType: TextInputType.number,
                  'Street Address',
                  _streetAdressController,
                  (value) {
                    if (value!.isEmpty) {
                      return 'Enter your street address ';
                    } else {
                      return null;
                    }
                  },
                ),
                CusstomeSpacer(
                  size: .01,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      flex: 1,
                      child: cutomeTextField(
                        // keyboardType: TextInputType.number,
                        'Area',
                        _areaController,
                        (value) {
                          if (value!.isEmpty) {
                            return 'Enter your area ';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      flex: 1,
                      child: cutomeTextField(
                        // keyboardType: TextInputType.number,
                        'Postal Code',
                        _postCodeController,
                        (value) {
                          if (value!.isEmpty) {
                            return 'Enter your Postal Code ';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
                CusstomeSpacer(
                  size: .1,
                ),
                CustomeButton(
                  bgColor: white,
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      Provider.of<AuthenticationController>(context,
                              listen: false)
                          .storeAdress(AddressModel(
                              area: _areaController.text,
                              city: _cityController.text,
                              country: _countryController.text,
                              email: _emailController.text,
                              firstName: _firstNameController.text,
                              lastName: _lastNameController.text,
                              phoneNumber: _phoneNumberController.text,
                              postCode: _postCodeController.text,
                              streetAddress: _streetAdressController.text));
                      Navigator.of(context).push(createRoute(RazorPayInt(
                        amount: hiveController.tottalAmount,
                      )));
                    }
                  },
                  title: 'Proceed Payment',
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
