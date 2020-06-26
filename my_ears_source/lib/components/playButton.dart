import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  IconData icon = Icons.play_arrow;
  Function onPressed;

  PlayButton({this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Icon(
          icon,
          color: Colors.white,
          size: 60,
        ),
        color: Color(0xff989898),
        autofocus: true,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(100.0),
        ),
        padding: EdgeInsets.all(30),
        onPressed: onPressed,
      ),
    );
  }
}
