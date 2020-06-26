import 'package:flutter/material.dart';

class ApplicationTitle extends StatelessWidget {
  const ApplicationTitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: <Widget>[
      Container(
        margin: EdgeInsets.fromLTRB(5, 50, 5, 5),
        child: Image(
          image: AssetImage("assets/images/logo.png"),
          width: 100,
        ),
      ),
      Container(
        child: Text(
          "Transforme o som em vibração",
          style: TextStyle(
              fontSize: 14,
              fontFamily: "Roboto",
              color: Colors.white,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.w300),
        ),
      ),
    ]);
  }
}
