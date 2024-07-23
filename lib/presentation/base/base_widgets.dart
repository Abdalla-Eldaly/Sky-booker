import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'base_states.dart';


class BaseWidgets {
  BaseWidgets._();

  static Widget buildImage(String imgPath) {
    return SizedBox(
        height: 100, width: 100, child: Image.asset(imgPath));
  }

  static Widget buildAnimatedImage(String lottiePath) {
    return SizedBox(
        height: 200,
        width: 200,
        child: Lottie.asset(lottiePath));
  }

  static Widget buildItemsColumn(List<Widget> children) {
    return SizedBox(
      width:double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }



  static void showPopUpDialog(BuildContext context, List<Widget> children,
      {List<Widget>? actions}) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          actions: actions,
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            ),
          ),
        ));
  }

  static Widget buildMessage(BuildContext context, String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: FittedBox(
          child: Text(
            message,
          ),
        ),
      ),
    );
  }

  static Widget buildButton(
      {required DisplayType displayType,
        required BuildContext context,
        required String title,
        void Function()? onTap}) {
    if (onTap == null) return const SizedBox();

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: ElevatedButton(
          onPressed: () {
            if (displayType == DisplayType.popUpDialog) {
              Navigator.of(context).pop();
            }
            onTap();
          },
          child: Text(title),
        ),
      ),
    );
  }
}
