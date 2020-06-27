import 'package:flutter/material.dart';

class DbSlider extends StatelessWidget {
  final double value;
  final double min;
  final double max;
  final Function(double) onChanged;

  DbSlider({this.value, this.onChanged, this.min, this.max});

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
          min: min,
          max: max,
          value: value,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
