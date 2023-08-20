import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/dimens.dart';
import '../constants/spacing.dart';

class WidgetUtils {
  static Decoration getDecoratedBackground(BuildContext context, {double? radius}) {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(radius ?? Dimens.cardRadius),
      border: Border.all(
        color: Colors.blueGrey,
      ),
      boxShadow: const [
        // BoxShadow(
        //   color: Color.fromARGB(255, 204, 204, 204),
        //   offset: Offset(1, 1),
        //   blurRadius: 10,
        //   // spreadRadius: 1,
        // ),
        // BoxShadow(
        //   color: Colors.white,
        //   offset: Offset(-4, -4),
        //   blurRadius: 15,
        //   spreadRadius: 1,
        // ),
      ],
    );
  }

  static Decoration _getNeumorphicElevation(BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).colorScheme.background,
      borderRadius: BorderRadius.circular(25),
      boxShadow: const [
        BoxShadow(
          color: Color.fromARGB(255, 204, 204, 204),
          offset: Offset(4, 4),
          blurRadius: 15,
          spreadRadius: 1,
        ),
        BoxShadow(
          color: Colors.white,
          offset: Offset(-4, -4),
          blurRadius: 15,
          spreadRadius: 1,
        ),
      ],
    );
  }

  static EdgeInsets getDetailCardMargings() {
    return const EdgeInsets.only(
      left: Dimens.margin,
      right: Dimens.margin,
      top: Dimens.margin,
    );
  }

  static Widget getCircularDot(Color color) {
    return Text(
      "●",
      style: TextStyle(color: color, fontSize: 25),
    );
  }

  static Widget getAdaptiveBackButton(BuildContext context, {Function? onBack}) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back_ios,
        // Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back,
        size: 24,
      ),
      onPressed: () {
        if (onBack != null) {
          onBack();
        } else {
          Navigator.of(context).pop();
        }
      },
    );
  }

  static showAdaptiveBottomSheet(
    BuildContext context, {
    String? title,
    String? message,
    @required List<AdaptiveBottomSheetAction>? actions,
    AdaptiveBottomSheetAction? cancelButton,
  }) {
    if (Platform.isIOS) {
      showCupertinoModalPopup(
          context: context,
          builder: (context) {
            return CupertinoActionSheet(
              title: title != null ? Text(title) : null,
              message: message != null ? Text(message) : null,
              cancelButton: cancelButton != null
                  ? CupertinoActionSheetAction(
                      onPressed: () {
                        cancelButton.onPressed();
                      },
                      child: Text(cancelButton.text),
                    )
                  : null,
              actions: <Widget>[
                for (var action in actions ?? [])
                  CupertinoActionSheetAction(
                    onPressed: action.onPressed,
                    child: Text(action.text),
                  ),
              ],
            );
          });
    } else {
      showModalBottomSheet(
          context: context,
          backgroundColor: Theme.of(context).colorScheme.background,
          builder: (context) {
            return Container(
              padding: const EdgeInsets.all(Dimens.margin),
              child: Wrap(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      title != null
                          ? Text(title, style: Theme.of(context).primaryTextTheme.titleLarge)
                          : const SizedBox(),
                      message != null ? Text(message) : const SizedBox(),
                    ],
                  ),
                  Spacing.vMedium,
                  for (var action in actions ?? [])
                    ListTile(
                      leading: action.icon != null ? Icon(action.icon) : null,
                      title: Text(action.text),
                      onTap: action.onPressed,
                    ),
                  Spacing.vMedium,
                  cancelButton != null
                      ? Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            // textColor: Theme.of(context).colorScheme.secondary,
                            onPressed: () {
                              cancelButton.onPressed();
                            },
                            child: Text(cancelButton.text.toUpperCase()),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            );
          });
    }
  }
}

class AdaptiveBottomSheetAction {
  final String text;
  final Function onPressed;
  final IconData? icon;

  AdaptiveBottomSheetAction({required this.text, this.icon, required this.onPressed});
}
