import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yuutebrok/Const/colors.dart';
import 'package:yuutebrok/Const/const.dart';
import 'package:yuutebrok/Const/style.dart';

class SlideProductImage extends StatelessWidget {
  List<dynamic> images;
  SlideProductImage({super.key, required this.images});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h(context) * .6,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        clipBehavior: Clip.antiAlias,
        shrinkWrap: true,
        itemCount: images.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.only(right: 10),
          width: w(context),
          decoration: BoxDecoration(color: white),
          child: CachedNetworkImage(imageUrl: images[index]),
        ),
      ),
    );
  }
}
