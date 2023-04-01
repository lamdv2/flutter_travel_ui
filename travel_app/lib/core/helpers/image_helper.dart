import 'package:flutter/material.dart';

class ImageHelper{
  static Widget loadFromAsset(
      String imageFilePath, {
      double? width,
      double? height,
      BorderRadius? radius,
      BoxFit? boxFit,
      Color? tintColor,
      Alignment? alignment
  }){
    return ClipRRect(
      borderRadius: radius ?? BorderRadius.zero,
      child: Image.asset(
        imageFilePath,
        width: width,
        height: height,
        fit: boxFit,
        color: tintColor,
        alignment: alignment ?? Alignment.center,
      ),
    );
  }




}