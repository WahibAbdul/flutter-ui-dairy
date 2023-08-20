import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveAlertDialog extends StatelessWidget {
  final String title;
  final String message;
  final List<AdaptiveAlertAction> actions;

  const AdaptiveAlertDialog({super.key, required this.title, required this.message, required this.actions});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoAlertDialog(
            title: Text(title),
            content: Text(message),
            actions: _getActions(context),
          )
        : AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: _getActions(context),
          );
  }

  List<Widget> _getActions(BuildContext context) {
    List<Widget> buttons = [];
    for (var action in actions) {
      buttons.add(_makeAction(context, action));
    }
    return buttons;
  }

  Widget _makeAction(BuildContext context, AdaptiveAlertAction action) {
    return Platform.isIOS
        ? CupertinoDialogAction(
            onPressed: () {
              action.onPressed();
            },
            child: Text(
              action.text,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.secondary, fontWeight: FontWeight.w500),
            ),
          )
        : TextButton(
            onPressed: () {
              action.onPressed();
            },
            child: Text(
              action.text,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.secondary, fontWeight: FontWeight.w500),
            ),
          );
  }
}

class AdaptiveAlertAction {
  final String text;
  final Function onPressed;

  AdaptiveAlertAction({required this.text, required this.onPressed});
}
