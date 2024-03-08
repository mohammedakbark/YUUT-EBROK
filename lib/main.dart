import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuutebrok/Const/colors.dart';
import 'package:yuutebrok/View%20Model/controller.dart';
import 'package:yuutebrok/View/Mobil%20View/Pages/home_page.dart';
import 'package:yuutebrok/View/splash_screen.dart';
import 'package:yuutebrok/Const/const.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ControllerVideoPlayer>(
            create: (_) => ControllerVideoPlayer())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'YUUT BROKE',
        theme: ThemeData(
          outlinedButtonTheme: OutlinedButtonThemeData(
              style:
                  ButtonStyle(overlayColor: MaterialStatePropertyAll(black))),

          appBarTheme: AppBarTheme(backgroundColor: black),
          scaffoldBackgroundColor: black,
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: false,
        ),
        home: SpalshScreen(),
      ),
    );
  }
}
