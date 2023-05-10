import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fively_ecommerce/core.dart';

class FirebaseStorageService {
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  FilePickerResult? filePickerResult;

  Future<String> doUploadPhoto() async {
    try {
      filePickerResult = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        allowedExtensions: ['png', 'jpg'],
        type: FileType.custom,
      );
      File file = File(filePickerResult?.files.single.path as String);
      final fileName = filePickerResult?.files.single.name;
      final uploadTask =
          await firebaseStorage.ref('photos/$fileName').putFile(file);
      final taskSapshot = await uploadTask.ref.getDownloadURL();
      return taskSapshot;
    } on FirebaseException catch (e) {
      throw Failure(message: e.code);
    }
  }
}
