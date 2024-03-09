import 'package:flutter/material.dart';
import 'package:yuutebrok/Const/media.dart';
import 'package:yuutebrok/View/Mobil%20View/Pages/home_page.dart';
import 'package:yuutebrok/Const/const.dart';

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
      Navigator.of(context)
          .pushAndRemoveUntil(createRoute(   MobileHomePage()), (route) => false);
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
