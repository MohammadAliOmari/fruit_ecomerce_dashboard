import 'dart:io';

abstract class StorageServices {
  Future<String> uploadImage(File image, String path);
}
