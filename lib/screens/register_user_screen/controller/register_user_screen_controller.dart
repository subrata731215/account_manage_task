import 'package:account_management_task/services/hive_services/hive_services.dart';
import 'package:account_management_task/services/image/image_picker_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/user_hive_model.dart';

class RegisterUserScreenController extends GetxController {
  RxString firstName = ''.obs;
  RxString lastName = ''.obs;
  RxString mobileNo = ''.obs;
  RxString email = ''.obs;
  RxString password = ''.obs;
  RxString cPassword = ''.obs;
  RxString imagePath = ''.obs;
  final registerFormKey = GlobalKey<FormState>();

  void addUserToHive() async {
    if (password.value == cPassword.value &&
        password.value.length > 5 &&
        firstName.value.length > 2 &&
        mobileNo.value.length == 10 &&
        email.value.length > 4) {
      HiveServices.instance.addUser(
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
      // Get.to(const UserListScreen());
      Get.closeCurrentSnackbar();
    } else {
      Get.snackbar('Fill all the details', 'try again ');
    }
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
    var isValid = registerFormKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      return registerFormKey.currentState!.save();
    }
  }

  void pickImage() async {
    final path = await ImagePickerService.instance.getImage();
    if (path != null) imagePath.value = path;
  }
}
