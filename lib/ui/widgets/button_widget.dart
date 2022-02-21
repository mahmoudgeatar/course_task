import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  String text;
  final VoidCallback callback;
  CustomButton({required this.text, required this.callback});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        padding: const EdgeInsets.only(top: 14, bottom: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        color: Colors.blue,
        splashColor: Theme.of(context).scaffoldBackgroundColor,
        onPressed: callback,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              text,
              style:
                  const TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
            ),
          ],
        ));
  }
}
