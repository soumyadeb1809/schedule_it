import 'dart:io';
import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';

class FirebaseUtils {

    static Future<String> saveImage(File imageFile) async {
      final String fileName = "${DateTime.now().millisecondsSinceEpoch}${Random().nextInt(10000)}";
      debugPrint("Uploading image: "+imageFile.path);
      StorageReference ref =
      FirebaseStorage.instance.ref().child("post_images").child("$fileName.jpg");
      StorageUploadTask uploadTask = ref.putFile(imageFile);
      return await (await uploadTask.onComplete).ref.getDownloadURL();
  }


}