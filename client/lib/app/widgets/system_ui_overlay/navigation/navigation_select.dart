import 'package:flutter/material.dart';

enum Navigations { exit, back }

class NavigationsLabel {
  NavigationsLabel();
  navigations(navigations) {
    switch (navigations) {
      case Navigations.back:
        return const Icon(Icons.arrow_back_ios_new_outlined);
      case Navigations.exit:
        return const Icon(Icons.close);
    }
  }
}
