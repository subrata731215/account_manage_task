import 'package:get/get.dart';
import '../../../hive_services/hive_services.dart';
import '../../../model/user_hive_model.dart';
import '../register_user_screen.dart';

class RegisterUserScreenController extends GetxController {
  RxString firstName = ''.obs;
  RxString lastName = ''.obs;
  RxString mobileNo = ''.obs;
  RxString email = ''.obs;
  RxString password = ''.obs;
  RxString cPassword = ''.obs;
  RxString imagePath = ''.obs;




  void addUserToHive() async {
    if (password.value == cPassword.value &&
        password.value.length > 5 &&
        firstName.value.length > 2 &&
        lastName.value.length > 3 &&
        mobileNo.value.length == 10 &&
        email.value.length > 4) {
      HiveServices().addUser(
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
    var isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      return formKey.currentState!.save();
    }
  }
}
