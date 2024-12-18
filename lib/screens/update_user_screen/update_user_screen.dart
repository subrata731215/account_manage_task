import 'package:account_management_task/screens/register_user_screen/controller/register_user_screen_controller.dart';
import 'package:account_management_task/screens/update_user_screen/controller/update_user_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/user_hive_model.dart';
import '../../reusable_widgets/app_filled_button.dart';
import '../../reusable_widgets/common_method/image_get.dart';
import '../../reusable_widgets/profile_details.dart';
import '../../reusable_widgets/profile_photo_widget.dart';
import '../user_list_screen/controller/user_list_screen_controller.dart';

class UpdateUserScreen extends StatelessWidget {
  const UpdateUserScreen({
    super.key,
    required this.image,
    required this.fName,
    required this.lName,
    required this.mobileNo,
    required this.email,
    required this.password,
    required this.index,
  });

  final String image;
  final String fName;
  final String lName;
  final String mobileNo;
  final String email;
  final String password;
  final int index;

  @override
  Widget build(BuildContext context) {
    UserHiveModel tempUser = UserHiveModel(
      firstName: fName,
      lastName: lName,
      mobileNo: mobileNo,
      password: password,
      email: email,
    );
    UpdateUserScreenController updateUserScreenController =
        Get.put(UpdateUserScreenController());
    RegisterUserScreenController registerUserScreenController =
        Get.put(RegisterUserScreenController());
    UserListScreenController userListScreenController =
        Get.put(UserListScreenController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Update User Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfilePhotoWidget(
                heightWidth: 100,
                image: image,
                onTap: () {
                  getImage(registerUserScreenController.imagePath.value);
                },
              ),
              const SizedBox(height: 20),
              ProfileDetails(
                  title: 'FirstName',
                  hintText: fName,
                  onChanged: (value) {
                    tempUser.firstName = value;
                  }),
              const SizedBox(height: 20),
              ProfileDetails(
                  title: 'LastName',
                  hintText: lName,
                  onChanged: (value) {
                    tempUser.lastName = value;
                  }),
              const SizedBox(height: 20),
              ProfileDetails(
                  title: 'Mobile No',
                  hintText: mobileNo,
                  onChanged: (value) {
                    tempUser.mobileNo = value;
                  }),
              const SizedBox(height: 20),
              ProfileDetails(
                  title: 'Email',
                  hintText: email,
                  onChanged: (value) {
                    tempUser.email = value;
                  }),
              const SizedBox(height: 30),
              ProfileDetails(
                  title: 'Password',
                  hintText: password,
                  onChanged: (value) {
                    tempUser.email = value;
                  }),
              const SizedBox(height: 30),
              AppFilledButton(
                  text: 'Saved Changes',
                  onPressed: () {
                    updateUserScreenController.updateUser(index, tempUser);
                    userListScreenController.updateUserList();
                    Navigator.of(context).pop();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
