import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/controller.dart';
import '../reusable_widgets/app_filled_button.dart';
import '../reusable_widgets/app_text_fields.dart';
import '../reusable_widgets/profile_photo_widget.dart';

class RegisterUserScreen extends StatefulWidget {
  const RegisterUserScreen({super.key});

  @override
  State<RegisterUserScreen> createState() => _RegisterUserScreenState();
}

class _RegisterUserScreenState extends State<RegisterUserScreen> {
  var controller = Get.put(AppController());

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
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Obx(() {
                  return ProfilePhotoWidget(
                    heightWidth: 100,
                    onTap: () {
                      controller.getImage();
                    },
                    image: controller.imagePath.value,
                  );
                }),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: AppTextFields(
                          onChanged: (value) {
                            controller.firstName.value = value;
                          },
                          hintText: 'FirstName'),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: AppTextFields(
                          onChanged: (value) {
                            controller.lastName.value = value;
                          },
                          hintText: 'LastName'),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                AppTextFields(
                  onChanged: (value) {
                    controller.mobileNo.value = value;
                  },
                  hintText: 'Mobile No',
                  textInputType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                AppTextFields(
                  validator: (value) {
                    return controller.validEmail(value!);
                  },
                  onChanged: (value) {
                    controller.email.value = value;
                  },
                  hintText: 'Email',
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 10),
                AppTextFields(
                  onChanged: (value) {
                    controller.password.value = value;
                  },
                  hintText: 'Password',
                  validator: (value) {
                    return controller.validPassword(value!);
                  },
                  suffixIcon: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.visibility_off)),
                  obscurePassword: true,
                ),
                const SizedBox(height: 10),
                AppTextFields(
                  onChanged: (value) {
                    controller.cPassword.value = value;
                  },
                  hintText: 'Confirm Password',
                  validator: (value) {
                    return controller.validPassword(value!);
                  },
                  suffixIcon: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.visibility_off)),
                  obscurePassword: true,
                ),
                const SizedBox(height: 10),
                AppFilledButton(
                  text: 'Register',
                  onPressed: () {
                    controller.checkLogin();
                    controller.addUser();
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
