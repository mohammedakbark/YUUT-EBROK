import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:yuutebrok/Const/colors.dart';
import 'package:yuutebrok/Const/const.dart';
import 'package:yuutebrok/Const/media.dart';
import 'package:yuutebrok/Const/style.dart';
import 'package:yuutebrok/controller/controller.dart';
import 'package:yuutebrok/View/Mobil%20View/Pages/viewproducts_page.dart';
import 'package:yuutebrok/View/utils/loading_indicator.dart';
import 'package:yuutebrok/View/utils/appbar_home.dart';
import 'package:yuutebrok/View/utils/drawer.dart';
import 'package:yuutebrok/controller/data/hive_database.dart';

class MobileHomePage extends StatefulWidget {
  MobileHomePage({super.key});

  @override
  State<MobileHomePage> createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ControllerVideoPlayer>(context, listen: false)
        .initializeController();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final cVP = Provider.of<ControllerVideoPlayer>(context, listen: false);
    return Scaffold(
      appBar: homeAppBar(context),
      drawer: myDrawer,
      extendBodyBehindAppBar: true,
      body: Center(
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            // FutureBuilder(
            //     future:
            //     builder: (context, snapshot) {
            //       if (snapshot.connectionState == ConnectionState.waiting) {
            //         return const Center(
            //           child: LoadingAnimatedLogo(),
            //         );
            //       }
            //       return
            FittedBox(
              fit: BoxFit.fill,
              child: SizedBox(
                  height: height,
                  width: width,
                  child: VideoPlayer(cVP.videoPlayerController)),
            ),
            // }),
            // Image.asset("assets/logo.png"),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 100,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            shape: BeveledRectangleBorder(),
                            side: BorderSide(
                              width: .5,
                              color: white,
                            )),
                        onPressed: () {
                          // cVP.disposeController();
                          Navigator.of(context)
                              .push(createRoute(const ProductViewPageMobile()));

                          // showLoadingIndiactor(context);
                        },
                        child: Text(
                          "SHOP",
                          style: appTextstyle(size: 17),
                        )),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
