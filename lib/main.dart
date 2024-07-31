import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:yuutebrok/Const/colors.dart';
import 'package:yuutebrok/Model/cart_model.dart';
import 'package:yuutebrok/View/Mobil%20View/Pages/home_page.dart';
import 'package:yuutebrok/controller/controller.dart';
import 'package:yuutebrok/View/Mobil%20View/Pages/viewproducts_page.dart';
import 'package:yuutebrok/controller/data/hive_database.dart';
import 'package:yuutebrok/logic/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(CartModelAdapter().typeId)) {
    Hive.registerAdapter(CartModelAdapter());
  }

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ControllerVideoPlayer>(
            create: (_) => ControllerVideoPlayer()),
        ChangeNotifierProvider<HiveDatabase>(create: (_) => HiveDatabase())
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
          useMaterial3: true,
        ),
        home: MobileHomePage(),
      ),
    );
  }
}
