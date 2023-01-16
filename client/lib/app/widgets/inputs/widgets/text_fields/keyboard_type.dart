import 'package:flutter/material.dart';

enum KeyboardType {
  number,
  name,
  email,
}

class KeyboardTypeLabel {
  KeyboardTypeLabel();
  keyboardType(keyboardType) {
    switch (keyboardType) {
      case KeyboardType.name:
        return TextInputType.name;
      case KeyboardType.email:
        return TextInputType.emailAddress;
      case KeyboardType.number:
        return TextInputType.number;
      default:
    }
  }
}
