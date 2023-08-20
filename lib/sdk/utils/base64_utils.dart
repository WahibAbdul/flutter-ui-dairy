import 'dart:convert';
import 'dart:io';

class Base64Utils {
  static Future<String> convertToBase64(File file) async {
    final image = await file.readAsBytes();
    final encoded = base64.encode(image);
    return encoded;
    // final s = encoded.replaceRange(0, encoded.indexOf(",") + 1, "");
    // return "data:image/png;base64,$s";
  }
}
