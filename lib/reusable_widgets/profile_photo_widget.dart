import 'dart:io';
import 'package:flutter/material.dart';

class ProfilePhotoWidget extends StatelessWidget {
  const ProfilePhotoWidget(
      {super.key, required this.heightWidth, this.onTap, this.image});

  final double heightWidth;

  final Function()? onTap;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: heightWidth,
        width: heightWidth,
        decoration: BoxDecoration(
            // image: DecorationImage(image: FileImage(image!), fit: BoxFit.cover),
            image: DecorationImage(
                image: (image?.isNotEmpty ?? false)
                    ? FileImage(File(image!))
                    : const NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNNLEL-qmmLeFR1nxJuepFOgPYfnwHR56vcw&s',
                      ),
                fit: BoxFit.cover),
            color: Colors.grey,
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.green,
              width: 2,
            )),
      ),
    );
  }
}
