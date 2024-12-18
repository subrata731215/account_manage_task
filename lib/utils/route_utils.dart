import 'package:flutter/material.dart';

extension BuildContextX on BuildContext {
  Future goto(Widget screen) {
    return Navigator.of(this).push(MaterialPageRoute(builder: (context) {
      return screen;
    }));
  }

  Future gotoReplacement(Widget screen) {
    return Navigator.of(this).pushReplacement(MaterialPageRoute(builder: (context) {
      return screen;
    }));
  }
}
