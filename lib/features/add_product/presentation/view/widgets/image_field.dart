import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key, required this.onImageSelected, this.selectedImage});
  final ValueChanged<File?> onImageSelected;
  final File? selectedImage;

  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  bool isLoading = false;
  File? imageFile;

  @override
  void initState() {
    super.initState();
    imageFile = widget.selectedImage;
  }

  @override
  void didUpdateWidget(covariant ImageField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedImage?.path != widget.selectedImage?.path) {
      imageFile = widget.selectedImage;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: () async {
          isLoading = true;
          setState(() {});
          try {
            final ImagePicker picker = ImagePicker();
            // Pick an image.
            final XFile? image =
                await picker.pickImage(source: ImageSource.gallery);
            imageFile = image != null ? File(image.path) : null;
            widget.onImageSelected(imageFile);
          } on Exception catch (e) {
            isLoading = false;
            log(e.toString());
            setState(() {});
          }
          isLoading = false;
          setState(() {});
        },
        child: Stack(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: imageFile != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(imageFile!))
                    : const Icon(
                        Icons.image_outlined,
                        color: Colors.grey,
                        size: 180,
                      ),
              ),
            ),
            if (imageFile != null)
              IconButton(
                  onPressed: () {
                    imageFile = null;
                    widget.onImageSelected(imageFile);
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ))
          ],
        ),
      ),
    );
  }
}
