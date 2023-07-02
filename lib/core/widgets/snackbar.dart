import 'package:flutter/material.dart';
import 'package:store/app.dart';
import 'package:store/core/constants.dart';

class CustomSnackbar {
  void showSnackBar({
    required String label,
    double? paddingFromBottom,
    Function()? onPop,
    Color color = Colors.red,
  }) {
    final snackBar = SnackBar(
      margin: EdgeInsets.only(
        bottom: paddingFromBottom ?? verticalPadding,
        left: smallHorizontalPadding,
        right: smallHorizontalPadding,
      ),
      behavior: SnackBarBehavior.floating,
      elevation: 5,
      dismissDirection: DismissDirection.down,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(100))),
      backgroundColor: color,
      content: Center(child: Text(label)),
    );

    materialAppKey.currentState?.hideCurrentSnackBar();
    materialAppKey.currentState
        ?.showSnackBar(snackBar)
        .closed
        .then((SnackBarClosedReason reason) {
      onPop != null ? onPop() : () {};
    });
  }
}
