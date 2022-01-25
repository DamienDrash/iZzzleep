import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class WeekdayButton extends StatefulWidget {
  final ValueChanged<bool> onChange;
  final bool isChecked;
  final String text;

  const WeekdayButton(
      {this.isChecked = false, required this.onChange, required this.text});

  @override
  _WeekdayButtonState createState() => _WeekdayButtonState();
}

class _WeekdayButtonState extends State<WeekdayButton> {
  bool _isSelected = false;
  String _text = "";

  @override
  void initState() {
    _isSelected = widget.isChecked;
    _text = widget.text;
    super.initState();
  }

  void _changeState() {
    setState(() {
      _isSelected = !_isSelected;
    });
    widget.onChange(_isSelected);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeState,
      child: Container(
          height: 40,
          width: 40,
          alignment: Alignment.center,
          child: Neumorphic(
            duration: const Duration(milliseconds: 250),
            style: NeumorphicStyle(
                boxShape: const NeumorphicBoxShape.circle(),
                lightSource: LightSource.topLeft,
                color: _isSelected ? Colors.amber : const Color(0xfff0f0f0),
                depth: _isSelected ? -3 : 3),
            child: Neumorphic(
              drawSurfaceAboveChild: false,
              style: NeumorphicStyle(
                  boxShape: const NeumorphicBoxShape.circle(),
                  lightSource: LightSource.topLeft,
                  color: _isSelected ? Colors.amber : Color(0xfff0f0f0),
                  depth: -8),
              child: Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  child: NeumorphicText(
                    _text,
                    textAlign: TextAlign.center,
                    textStyle: NeumorphicTextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    style: NeumorphicStyle(
                        color: _isSelected
                            ? const Color(0xfff0f0f0)
                            : Colors.amber,
                        lightSource: LightSource.topLeft,
                        depth: 3),
                  )),
            ),
          )),
    );
  }
}
