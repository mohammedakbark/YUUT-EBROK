import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuutebrok/Const/media.dart';
import 'package:yuutebrok/Const/const.dart';
import 'package:yuutebrok/View/mobile/screens/home/home_page.dart';
import 'package:yuutebrok/controller/auth/authentication.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();
    _animation = Tween<double>(
      begin: .4,
      end: .5,
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 4)).then((value) {
      final authController =
          Provider.of<AuthenticationController>(context, listen: false);
      final auth = FirebaseAuth.instance.currentUser;
      if (auth != null) {
        authController.getUserData(context);
      }

      Navigator.of(context)
          .pushAndRemoveUntil(createRoute(MobileHomePage()), (route) => false);
    });
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Image.asset(logo),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
