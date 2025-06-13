// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ResizerModel {
  late MediaQueryData _mediaQueryData;
  late double screenWidth;
  late double screenHeight;
  late double baseWidth;
  late double baseHeight;
  late double scaleFactor;

  void init(
    BuildContext context, {
    double designWidth = 375.0,
    double designHeight = 812.0,
  }) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    baseWidth = designWidth;
    baseHeight = designHeight;
    scaleFactor = screenWidth / baseWidth;
  }

  double textSize(double fontSize) {
    return fontSize *
        scaleFactor.clamp(0.8, 1.2);
  }

  double iconSize(double size) {
    return size * scaleFactor.clamp(0.8, 1.2);
  }

  double imageSize(double size) {
    return size * scaleFactor;
  }

  double padding(double padding) {
    return padding * scaleFactor;
  }

  double size(double dimension) {
    return dimension * scaleFactor;
  }

  double height(double height) {
    return (height / baseHeight) * screenHeight;
  }

  double width(double width) {
    return (width / baseWidth) * screenWidth;
  }
}
