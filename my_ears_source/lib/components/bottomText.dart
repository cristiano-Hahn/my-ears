import 'package:flutter/material.dart';

class BottomText extends StatelessWidget {
  final String text;

  BottomText(this.text);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
        child: Align(
          alignment: FractionalOffset.bottomCenter,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Color(0xff32AFB4),
            ),
          ),
        ),
      ),
    );
  }
}
