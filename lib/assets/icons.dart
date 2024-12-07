import 'package:flutter/material.dart';

class AppIcons {
  static const String logo_aiai_dark = "images/logo_aiai_dark.png";
  static const String logo_aiai_light = "images/logo_aiai_light.png";
}

extension SvgParsing on String {
  Image icon({double? size}) {
    return Image(image: AssetImage(this), width: size, height: size,);
  }

  AssetImage iconAssetImage() {
    return AssetImage(this);
  }

}
