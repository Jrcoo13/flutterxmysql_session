// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class MyProgressIndicator {
  static void textProgressIndicator(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () {
            return Future(() => false);
          },
          child: Center(
            child: Material(
              elevation: 10,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.white24),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Container(
                height: 145,
                width: 250,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Please Wait!'),
                    SizedBox(
                      height: 25,
                    ),
                    LinearProgressIndicator(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static void dismiss(BuildContext context) {
    Navigator.pop(context);
  }
}
