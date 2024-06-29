import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderLine extends StatefulWidget {
  final double initialValue;
  final double maxValue;
  final int divisions;
  final ValueChanged<double>? onChanged;

  const SliderLine({
    Key? key,
    required this.initialValue,
    required this.maxValue,
    required this.divisions,
    this.onChanged,
  }) : super(key: key);

  @override
  _SliderLineState createState() => _SliderLineState();
}

class _SliderLineState extends State<SliderLine> {
  late double _currentSliderValue;

  @override
  void initState() {
    super.initState();
    _currentSliderValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: Color(0xff383838),
        inactiveTrackColor: Color(0xff383838),
        thumbColor: Color(0xff1c4799),
        trackHeight: 8,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12),
        trackShape: RectangularSliderTrackShape(),
      ),
      child: Slider(
        value: _currentSliderValue,
        min: 0,
        max: widget.maxValue,
        divisions: widget.divisions,
        label: _currentSliderValue.round().toString(),
        onChanged: (double value) {
          setState(() {
            _currentSliderValue = value;
          });
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
        },
      ),
    );
  }
}
