import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  ImagePickerService._();

  static ImagePickerService instance = ImagePickerService._();

  final picker = ImagePicker();

  Future<String?> getImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      return pickedImage.path.toString();
    }
    return null;
  }
}