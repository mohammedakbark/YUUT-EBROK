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
import 'package:yuutebrok/View%20Model/controller.dart';
import 'package:yuutebrok/View/Mobil%20View/Pages/viewproducts_page.dart';
import 'package:yuutebrok/View/utils/loading_indicator.dart';
import 'package:yuutebrok/View/utils/appbar_home.dart';
import 'package:yuutebrok/View/utils/drawer.dart';

class MobileHomePage extends StatelessWidget {
  MobileHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final cVP = Provider.of<ControllerVideoPlayer>(context, listen: false);
    return Scaffold(
      appBar: homeAppBar,
      drawer: myDrawer,
      extendBodyBehindAppBar: true,
      body: Center(
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            FutureBuilder(
                future: cVP.initializeController(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: LoadingAnimatedLogo(),
                    );
                  }
                  return FittedBox(
                    fit: BoxFit.fill,
                    child: SizedBox(
                        height: height,
                        width: width,
                        child: VideoPlayer(cVP.videoPlayerController)),
                  );
                }),
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
                          Navigator.of(context).pushAndRemoveUntil(
                              createRoute(const ProductViewPageMobile()),
                              (route) => false);
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
