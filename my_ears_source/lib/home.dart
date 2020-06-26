import 'package:flutter/material.dart';
import 'package:my_ears/components/bottomText.dart';
import 'package:my_ears/components/dbSlider.dart';
import 'package:my_ears/components/playButton.dart';
import 'package:my_ears/components/title.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _value = 50;
  bool _listening = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 5000,
        color: Color(0xff454545),
        child: Column(
          children: <Widget>[
            Container(
              child: ApplicationTitle(),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5, 60, 5, 5),
              child: Text(
                "Sensibilidade",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w300),
              ),
            ),
            Container(
              child: Text(
                _value.toStringAsFixed(0) + " dB",
                style: TextStyle(
                    fontSize: 25,
                    color: Color(0xff32AFB4),
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              child: DbSlider(
                value: _value,
                onChanged: (newValue) {
                  setState(() {
                    _value = newValue;
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: PlayButton(
                icon: _listening ? Icons.stop : Icons.play_arrow,
                onPressed: () {
                  setState(() {
                    _listening = !_listening;
                  });
                },
              ),
            ),
            Container(
              child: BottomText(
                "Clique para começar a ouvir",
              ),
            )
          ],
        ),
      ),
    );
  }
}
