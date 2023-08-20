import 'package:flutter/material.dart';

class TextFieldUtils {
  static TextSelection getCursorPosition(TextEditingController controller, String text) {
    var cursorPos = controller.selection;

    controller.text = text;

    if (cursorPos.start > controller.text.length) {
      cursorPos = TextSelection.fromPosition(TextPosition(offset: controller.text.length));
    }
    return cursorPos;
  }
}
