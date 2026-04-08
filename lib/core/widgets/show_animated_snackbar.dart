import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

showAnimatedSnackbar({
  required String message,
  required BuildContext context,
  AnimatedSnackBarType type = AnimatedSnackBarType.info,
}) {
  AnimatedSnackBar.material(
    message,
    type: type,
    mobileSnackBarPosition:
        MobileSnackBarPosition.bottom, // Position of snackbar on mobile devices
    desktopSnackBarPosition:
        DesktopSnackBarPosition
            .topRight, // Position of snackbar on desktop devices
  ).show(context);
}
