import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:yuutebrok/Const/colors.dart';
import 'package:yuutebrok/Model/cart_model.dart';
import 'package:yuutebrok/View/mobile/screens/home/home_page.dart';
import 'package:yuutebrok/View/mobile/screens/home/view_single_product_detail.dart';
import 'package:yuutebrok/View/splash_screen.dart';
import 'package:yuutebrok/controller/auth/authentication.dart';
import 'package:yuutebrok/controller/controller.dart';
import 'package:yuutebrok/View/mobile/screens/home/viewproducts_page.dart';
import 'package:yuutebrok/controller/data/hive_database.dart';
import 'package:yuutebrok/controller/payment_service.dart';
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
        ChangeNotifierProvider<Controller>(create: (_) => Controller()),
        ChangeNotifierProvider<HiveDatabase>(create: (_) => HiveDatabase()),
        ChangeNotifierProvider<PaymentService>(create: (_) => PaymentService()),
        ChangeNotifierProvider<AuthenticationController>(
            create: (_) => AuthenticationController())
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
        // home: MobileHomePage(),
        home: SpalshScreen(),
      ),
    );
  }
}
