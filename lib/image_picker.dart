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


Future<File?> pickMediaFromGallery() async {
  final ImagePicker picker = ImagePicker();
  final XFile? pickedFile = await picker.pickMedia();

  if (pickedFile != null) {
    return File(pickedFile.path); // Return as a File object
  } else {
    return null; // No image selected
  }
}

bool isVideoFile(String filePath) {
  final ext = filePath.split('.').last.toLowerCase();
  return ext == 'mp4' || ext == 'mov' || ext == 'avi';
}
