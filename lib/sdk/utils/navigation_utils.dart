import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Route<Object> getPageRoute(WidgetBuilder builder, {bool fullscreenDialog = false}) {
  if (Platform.isIOS) {
    return CupertinoPageRoute(builder: builder, fullscreenDialog: fullscreenDialog);
  } else {
    return MaterialPageRoute(builder: builder, fullscreenDialog: fullscreenDialog);
  }
}

Future<Object?> pushPage(BuildContext context, Widget widget) {
  return Navigator.of(context).push(getPageRoute((context) => widget));
}

void popPage(BuildContext context) {
  Navigator.of(context).pop();
}
