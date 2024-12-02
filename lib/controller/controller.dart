import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../hive_services/hive_services.dart';
import '../model/user_hive_model.dart';
import '../screens/account_screen.dart';

class AppController extends GetxController {
  final registerUserList = <UserHiveModel>[].obs;
  final hiveServices = HiveServices();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> updateUserList() async {
    registerUserList.value = await HiveServices().getUser();
  }

  RxString firstName = ''.obs;
  RxString lastName = ''.obs;
  RxString mobileNo = ''.obs;
  RxString email = ''.obs;
  RxString password = ''.obs;
  RxString cPassword = ''.obs;
  RxString imagePath = ''.obs;

  void addUser() async {
    if (password.value == cPassword.value && password.value.length > 5) {
      hiveServices.addUser(
        UserHiveModel(
          firstName: firstName.value,
          lastName: lastName.value,
          mobileNo: mobileNo.value,
          password: password.value,
          email: email.value,
          image: imagePath.value,
        ),
      );

      Get.snackbar('Register Successful', 'Thank You!');
      updateUserList();
      Get.to(const AccountScreen());
    } else {
      Get.snackbar('Password did not match', 'Please give same password ');
    }
  }

  void deleteUser(UserHiveModel userModel) async {
    var index = (await hiveServices.getUser()).indexOf(userModel);
    hiveServices.deleteUserAt(index);
    updateUserList();
    Get.snackbar('User Delete Successful', 'Thank You!');
  }

  void updateUser(int userIndex, UserHiveModel userModel) async {
    hiveServices.updateHiveUser(userIndex, userModel);
    updateUserList();
    Get.snackbar('User Update Successful', 'Thank You!');
  }

  final picker = ImagePicker();

  Future getImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      imagePath.value = pickedImage.path.toString();
    } else {
      print('No Image Picked');
    }
  }

  @override
  void onInit() {
    super.onInit();
    updateUserList();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  String? validEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return 'Provide valid Email';
    }
    return null;
  }

  String? validPassword(String value) {
    if (value.length >= 6) {
      return null;
    }
    return 'Password must be upTo 6 character';
  }

  void checkLogin() {
    var isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      return formKey.currentState!.save();
    }
  }
}
