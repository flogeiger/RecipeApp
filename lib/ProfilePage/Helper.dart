import 'package:image_picker/image_picker.dart';

import 'dart:io';

import 'package:sample/utils/Preference.dart';

class Helper {
  static Future<File> getFromGallery(File profileFile) async {
    PickedFile? pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileFile = File(pickedFile.path);
    }
    Preference.shared.setString(
      Preference.profileImage,
      profileFile.path,
    );
    return profileFile;
  }
}
