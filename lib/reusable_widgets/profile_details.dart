import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails(
      {super.key,
      required this.title,
      required this.hintText,
      required this.onChanged});

  final String title;
  final String hintText;
  final void Function(String value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        TextFormField(
          onChanged: onChanged,
          initialValue: hintText,
          decoration: const InputDecoration(
            suffixIcon: Icon(Icons.edit),
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
