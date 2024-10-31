import 'package:flutter/material.dart';

enum SnackBarType { info, success, error, warning }

extension CustomizeSnackBar on SnackBarType {
  Color snackBarColor() {
    switch (this) {
      case SnackBarType.info:
        return Colors.lightBlue;
      case SnackBarType.success:
        return Colors.lightGreen;
      case SnackBarType.error:
        return Colors.red;
      case SnackBarType.warning:
        return Colors.yellow;
    }
  }

  IconData icon() {
    switch (this) {
      case SnackBarType.info:
        return Icons.info;
      case SnackBarType.success:
        return Icons.check_circle_rounded;
      case SnackBarType.error:
        return Icons.error;
      case SnackBarType.warning:
        return Icons.warning;
    }
  }
}

class MySnackBar {
  static void show(
      BuildContext context, String title, String message, SnackBarType type) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: type.snackBarColor(),
          duration: const Duration(seconds: 5),
          content: Row(
            children: [
              Icon(type.icon()),

              const SizedBox(width: 15,),

              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),

                    Text(message, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 14),),
                  ],
                ),
              )
            ],
          ),
        ),
      );
  }
}
