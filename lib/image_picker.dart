import 'package:image_picker/image_picker.dart';
import 'dart:io';

Future<File?> pickImageFromGallery() async {
  final ImagePicker picker = ImagePicker();
  final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    return File(pickedFile.path); // Return as a File object
  } else {
    return null; // No image selected
  }
}
