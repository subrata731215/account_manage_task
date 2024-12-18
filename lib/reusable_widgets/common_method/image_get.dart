import 'package:image_picker/image_picker.dart';

final picker = ImagePicker();

Future getImage(String imagePath) async {
  final pickedImage = await picker.pickImage(source: ImageSource.gallery);

  if (pickedImage != null) {
    imagePath = pickedImage.path.toString();
  } else {
    print('No Image Picked');
  }
}
