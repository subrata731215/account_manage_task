import 'package:flutter/material.dart';

class AppFilledButton extends StatelessWidget {
  const AppFilledButton(
      {super.key, required this.text, required this.onPressed});

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.5,
      height: MediaQuery.of(context).size.height / 18,
      child: FilledButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
