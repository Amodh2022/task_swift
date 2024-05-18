import 'package:flutter/material.dart' as snack;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class TaskSwiftSnackBar {
  static void showSnackBarError(
      snack.BuildContext context, String message, Color color) {
    showTopSnackBar(
      displayDuration: const Duration(seconds: 2),
      Overlay.of(Get.overlayContext!),
      CustomSnackBar.error(
        message: message,
      ),
    );
  }

  static void showSnackBarSuccess(
      snack.BuildContext context, String message, Color color) {
    showTopSnackBar(
      displayDuration: const Duration(seconds: 2),
      Overlay.of(Get.overlayContext!),
      CustomSnackBar.success(
        message: message,
      ),
    );
  }
}
