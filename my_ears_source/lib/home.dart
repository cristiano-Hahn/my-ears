import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_ears/components/bottomText.dart';
import 'package:my_ears/components/dbSlider.dart';
import 'package:my_ears/components/playButton.dart';
import 'package:my_ears/components/title.dart';
import 'package:noise_meter/noise_meter.dart';
import 'package:vibration/vibration.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _sliderValue = 50;
  double _sliderMinValue = 0;
  double _sliderMaxValue = 100;
  int _vibrationSoundDecibels = 0;
  bool _listening = false;
  bool _hasVibrator = true;
  StreamSubscription<NoiseReading> _microphoneListener;

  @override
  void initState() {
    _initializeVibrationSupport();
  }

  _initializeVibrationSupport() async {
    bool hasVibrator = await Vibration.hasVibrator();
    setState(() {
      _hasVibrator = hasVibrator;
    });
    double value = 50;
    double minValue = 0;
    double maxValue = 100;

    if (hasVibrator) {
      Vibration.vibrate(duration: 1100);
      await new Future.delayed(const Duration(milliseconds: 500), () {
        StreamSubscription<NoiseReading> listener;
        listener = new NoiseMeter().noiseStream.listen((noiseReading) {
          minValue = noiseReading.meanDecibel - 30;
          maxValue = noiseReading.meanDecibel + 30;
          value = noiseReading.meanDecibel + 1;
          listener.cancel();
          setState(() {
            _sliderValue = value;
            _sliderMinValue = minValue;
            _sliderMaxValue = maxValue;
            _hasVibrator = hasVibrator;
            _vibrationSoundDecibels = noiseReading.meanDecibel.toInt();
          });
        });
      });
    }
  }

  _onPressButton() async {
    if (_hasVibrator) {
      if (_listening) {
        if (_microphoneListener != null) {
          _microphoneListener.pause();
        }
        Vibration.cancel();
      } else {
        if (_microphoneListener == null) {
          _microphoneListener = new NoiseMeter().noiseStream.listen((noiseReading) {
            if (noiseReading.meanDecibel > _sliderValue && _listening) {
              Vibration.vibrate(duration: 200);
            }
          });
        } else {
          _microphoneListener.resume();
        }
      }
    }
    setState(() {
      _listening = !_listening;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                _sliderValue.toStringAsFixed(0) + " dB",
                style: TextStyle(
                    fontSize: 25,
                    color: Color(0xff32AFB4),
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              child: DbSlider(
                value: _sliderValue,
                min: _sliderMinValue,
                max: _sliderMaxValue,
                onChanged: (newValue) {
                  setState(() {
                    _sliderValue = newValue;
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: PlayButton(
                icon: _listening ? Icons.stop : Icons.play_arrow,
                onPressed: _onPressButton,
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
