import 'package:flutter/material.dart';

import '../widgets/adaptive_alert_dialog.dart';
import '../widgets/progress_loader.dart';

class UIUtils {
  static showProgressLoader(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const ProgressLoader(),
    );
  }

  static showAdaptiveDialog(BuildContext context, String title, String message, {Function? onPressed}) {
    showDialog(
        context: context,
        builder: (context) {
          return AdaptiveAlertDialog(
            title: title,
            message: message,
            actions: [
              AdaptiveAlertAction(
                  text: "OK",
                  onPressed: () {
                    Navigator.of(context).pop();
                    if (onPressed != null) {
                      onPressed();
                    }
                  })
            ],
          );
        });
  }

  static showAdaptiveConfirmationDialog(BuildContext context, String title, String message,
      {String? positiveTitle, Function? onPositiveAction, String? negativeTitle, Function? onNegativeAction}) {
    showDialog(
        context: context,
        builder: (context) {
          return AdaptiveAlertDialog(
            title: title,
            message: message,
            actions: [
              AdaptiveAlertAction(
                  text: positiveTitle ?? "OK",
                  onPressed: () {
                    Navigator.of(context).pop();
                    if (onPositiveAction != null) {
                      onPositiveAction();
                    }
                  }),
              AdaptiveAlertAction(
                  text: negativeTitle ?? "Cancel",
                  onPressed: () {
                    Navigator.of(context).pop();
                    if (onNegativeAction != null) {
                      onNegativeAction();
                    }
                  }),
            ],
          );
        });
  }
}
