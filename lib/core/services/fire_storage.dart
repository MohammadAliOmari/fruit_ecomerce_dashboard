import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruit_dashboard/core/services/storage_services.dart';
import 'package:path/path.dart' as b;

class FireStorage implements StorageServices {
  final storageRef = FirebaseStorage.instance.ref();

  @override
  Future<String> uploadImage(File image, String path) async {
    String fileName = b.basename(image.path);
    String extension = b.extension(image.path);
    var imageRef = storageRef.child('$path/$fileName$extension');
    await imageRef.putFile(image);
    var fileUrl = await imageRef.getDownloadURL();
    return fileUrl;
  }
}
