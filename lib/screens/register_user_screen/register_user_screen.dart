import 'package:account_management_task/screens/register_user_screen/controller/register_user_screen_controller.dart';
import 'package:account_management_task/screens/user_list_screen/user_list_screen.dart';
import 'package:account_management_task/utils/route_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../reusable_widgets/app_filled_button.dart';
import '../../reusable_widgets/app_text_fields.dart';
import '../../reusable_widgets/profile_photo_widget.dart';

class RegisterUserScreen extends StatefulWidget {
  const RegisterUserScreen({super.key});

  @override
  State<RegisterUserScreen> createState() => _RegisterUserScreenState();
}

class _RegisterUserScreenState extends State<RegisterUserScreen> {
  RegisterUserScreenController registerController = Get.put(RegisterUserScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Register Screen ',
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: Form(
        key: registerController.registerFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Obx(() {
                  return ProfilePhotoWidget(
                    heightWidth: 100,
                    onTap: registerController.pickImage,
                    image: registerController.imagePath.value,
                  );
                }),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: AppTextFields(
                          onChanged: (value) {
                            registerController.firstName.value = value;
                          },
                          hintText: 'FirstName'),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: AppTextFields(
                          onChanged: (value) {
                            registerController.lastName.value = value;
                          },
                          hintText: 'LastName'),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                AppTextFields(
                  onChanged: (value) {
                    registerController.mobileNo.value = value;
                  },
                  hintText: 'Mobile No',
                  textInputType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                AppTextFields(
                  validator: (value) {
                    return registerController.validEmail(value!);
                  },
                  onChanged: (value) {
                    registerController.email.value = value;
                  },
                  hintText: 'Email',
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 10),
                AppTextFields(
                  onChanged: (value) {
                    registerController.password.value = value;
                  },
                  hintText: 'Password',
                  validator: (value) {
                    return registerController.validPassword(value!);
                  },
                  suffixIcon: IconButton(onPressed: () {}, icon: const Icon(Icons.visibility_off)),
                  obscurePassword: true,
                ),
                const SizedBox(height: 10),
                AppTextFields(
                  onChanged: (value) {
                    registerController.cPassword.value = value;
                  },
                  hintText: 'Confirm Password',
                  validator: (value) {
                    return registerController.validPassword(value!);
                  },
                  suffixIcon: IconButton(onPressed: () {}, icon: const Icon(Icons.visibility_off)),
                  obscurePassword: true,
                ),
                const SizedBox(height: 10),
                AppFilledButton(
                  text: 'Register',
                  onPressed: () {
                    registerController.checkLogin();
                    registerController.addUserToHive();
                    context.gotoReplacement(const UserListScreen());
                  },
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
