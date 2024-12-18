import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/controller.dart';
import '../../model/user_hive_model.dart';
import '../../reusable_widgets/app_filled_button.dart';
import '../../reusable_widgets/profile_details.dart';
import '../../reusable_widgets/profile_photo_widget.dart';

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
    AppController controller = Get.put(AppController());
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
                  controller.getImage();
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
                    controller.updateUser(index, tempUser);
                    Navigator.of(context).pop();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
