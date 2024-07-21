import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomMargin extends StatelessWidget {
  Widget child;
  CustomMargin({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: child,
    );
  }
}
