import 'package:flutter/material.dart';

class DbSlider extends StatelessWidget {
  final double value;
  final Function(double) onChanged;

  DbSlider({this.value, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SliderTheme(
        data: SliderThemeData(
          thumbColor: Color(0xff32AFB4),
          activeTrackColor: Color(0xff32AFB4),
          inactiveTrackColor: Color(0xff585858),
          showValueIndicator: ShowValueIndicator.never,
          trackHeight: 8,
        ),
        child: Slider(
          min: 1,
          max: 100,
          value: value,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
