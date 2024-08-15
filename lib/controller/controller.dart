import 'dart:developer';

import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:yuutebrok/Const/const_string.dart';
import 'package:yuutebrok/Const/media.dart';
import 'package:yuutebrok/Model/product_model.dart';

class Controller with ChangeNotifier {
  late VideoPlayerController videoPlayerController;

  initializeController() async {
    videoPlayerController = VideoPlayerController.asset(homeVideoasset,
        videoPlayerOptions: VideoPlayerOptions())
      ..initialize().then((value) {
        videoPlayerController.setLooping(true);
        videoPlayerController.play();

        videoPlayerController.setVolume(0);
      });
  }

  Future<void> disposeController() async {
    await videoPlayerController.dispose();
    print('-----video disposed');
  }

  //----------------------------animation controller

  List<Map<String, dynamic>> selectedSizes = [];
  genarateSizeList(List<String> sizes) {
    selectedSizes = [];
    selectedSizes = List.generate(
        sizes.length, (index) => {'size': sizes[index], 'isSelected': false});

    log(selectedSizes.toString());
  }

  _updateSizeButton(int index, bool newValue, List<String> sizes) {
    if (newValue) {
      genarateSizeList(sizes);

      selectedSizes[index]['isSelected'] = newValue;
      notifyListeners();
    } else {
      genarateSizeList(sizes);
      notifyListeners();
    }
  }

  String? selectedSize;
  selectSize(int index, String value, List<String> sizes) {
    selectedSize = value;
    print(selectedSize);
    _updateSizeButton(index, true, sizes);
  }

  unSelectSize(int index, String value, List<String> sizes) {
    selectedSize = null;
    print(selectedSize);

    _updateSizeButton(index, false, sizes);
  }

  // ------------ Searching -----------
  final db = FirebaseFirestore.instance;

  List<ProductModel> productsForSearch = [];
  getProductForSearch() async {
    productsForSearch = [];
    final snaps = await db.collection(ConstString.productCollection).get();

    productsForSearch =
        snaps.docs.map((e) => ProductModel.fromJson(e.data())).toList();

    print(productsForSearch);
    notifyListeners();
  }

  List<ProductModel> searchList = [];
  searchProduct(String key, List<ProductModel> list) {
    searchList = List.from(list);

    searchList = productsForSearch
        .where(
            (element) => element.name.toLowerCase().contains(key.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
