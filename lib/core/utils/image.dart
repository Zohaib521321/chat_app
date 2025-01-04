import 'dart:io';

import 'package:chat_app/core/utils/short_message.dart';
// import 'package:firebase_storage/firebase_storage.dart' as storage;
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

/// Utility class for image-related operations such as compression and uploading.
class ImageUtil {
  /// Compresses an image file.
  ///
  /// Takes an [originalImage] file and compresses it with the specified settings.
  /// Returns the compressed image as an [XFile] if compression is successful, otherwise returns null.

  static Future<XFile?> compressImage(XFile originalImage) async {
    final directory = path.dirname(originalImage.path);
    final fileName = 'compressed_${path.basename(originalImage.path)}.jpg';
    final compressedPath = path.join(directory, fileName);

    final compressedImage = await FlutterImageCompress.compressAndGetFile(
      originalImage.path,
      compressedPath,
      minWidth: 320,
      minHeight: 240,
      quality: 50,
    );

    if (compressedImage != null) {
      final originalSize = await File(originalImage.path).length();
      final compressedSize = await File(compressedImage.path).length();

      print('Original Image Size: ${originalSize ~/ 1024} KB');
      print('Compressed Image Size: ${compressedSize ~/ 1024} KB');

      return XFile(compressedImage.path);
    } else {
      // Compression failed, handle the error
      return null;
    }
  }

  /// Uploads an image file to the Firebase Storage database.
  ///
  /// Takes the [filePath] of the image file and the user's [phoneNumber].
  /// Returns a [String] representing the download URL of the uploaded image.

  // static Future<String> uploadToDatabase(
  //     String filePath, String phoneNumber)
  // async {
  //   try {
  //     String uniqueId = DateTime.now().millisecondsSinceEpoch.toString();
  //     File pickedImage = File(filePath);
  //
  //     if (pickedImage.existsSync()) {
  //       storage.Reference reference = storage.FirebaseStorage.instance
  //           .ref()
  //           .child("Profile Image/$uniqueId");
  //
  //       // Start the upload task
  //       storage.UploadTask uploadTask = reference.putFile(pickedImage);
  //
  //       // Await for upload to complete
  //       await uploadTask.whenComplete(() => null);
  //
  //       // After upload is complete, retrieve the download URL
  //       final downloadUrl = await reference.getDownloadURL();
  //       return downloadUrl;
  //     } else {
  //       throw Exception('File does not exist at the provided path');
  //     }
  //   } catch (e) {
  //     // Handle database errors
  //     ErrorUtil.handleDatabaseErrors(e);
  //     rethrow;
  //   }
  // }

  static Future<void> pickAndUpdateImage(RxString pathToUpdate,
      {ImageSource source = ImageSource.gallery}) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);

    if (image != null) {
      // Optional: Compress the image before updating the path
      final XFile? compressImage = await ImageUtil.compressImage(image);
      pathToUpdate.value = compressImage?.path ??
          image
              .path; // Use compressed image path or original if compression is null
    } else {
      // Show an error message if no image was selected
      ShortMessageUtils.showError("Please pick an image.");
    }
  }
}
