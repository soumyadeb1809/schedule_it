import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class CommonUtils {
  static Widget getImageAsset(String assetPath, double width, double height) {
    AssetImage assetImage = AssetImage(assetPath);
    Image image = Image(image: assetImage, width: width, height: height,);
    return Container(
      child: image,
    );
  }

  static Future<File> imageSelectorGallery() async {
    File galleryFile = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    return galleryFile;
  }
}